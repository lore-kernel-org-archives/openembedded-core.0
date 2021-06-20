Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.32459.1624189110870065680
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jun 2021 04:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id D9A4F38C1378
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jun 2021 11:38:29 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vte: upgrading to 0.64.2 SUCCEEDED
Message-ID: <MADEUP.168A47642B18FCB3.1783@lists.openembedded.org>
X-Groupsio-MsgNum: 153120
Content-Type: multipart/mixed; boundary="===============3082520889574551238=="

--===============3082520889574551238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vte* to *0.64.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vte-upgrade-0.64.1-0.64.2.patch
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

--===============3082520889574551238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (0 cached, 818 parsed). 1455 targets, 41 skipped, 0 masked, 0 errors.
Removing 141 recipes from the core2-32 sysroot...done.
Removing 145 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-2b5498936781458375de4362be7cfdeb3936c950"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2b5498936781458375de4362be7cfdeb3936c950"
workspace            = "master:f585bf4c959ae0b52be8462d278cd289db79b813"

Initialising tasks...done.
Sstate summary: Wanted 729 Local 601 Network 0 Missed 128 Current 322 (82% match, 87% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 323 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 328 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 331 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 332 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 333 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 335 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 336 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 337 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 338 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 339 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 341 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 342 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 343 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 344 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 345 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 347 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 349 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 351 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 352 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 354 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 356 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 357 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 358 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 359 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 360 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 361 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 362 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 363 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 364 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 365 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 366 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 367 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 368 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 369 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 370 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 371 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 372 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 373 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 374 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 375 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 376 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 377 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 378 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 379 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 380 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 381 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 382 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 383 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 384 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 385 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 386 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 387 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 388 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 389 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-libuuid-2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 390 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 391 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 392 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 393 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 394 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 396 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 397 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 398 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 399 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 401 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 404 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_package_write_rpm_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 413 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 414 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 415 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 416 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.19.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 417 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 419 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 420 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 421 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 422 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 423 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 424 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 425 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 426 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 428 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 431 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 432 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 433 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 434 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 435 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package_write_rpm_setscene)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 438 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libdrm-2.4.106-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 439 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 440 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe m4-1.4.19-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 441 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 442 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 444 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 445 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 448 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 449 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 452 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 453 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 454 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 455 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 456 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 459 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 460 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libdrm-2.4.106-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 461 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 462 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 464 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 468 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 469 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 470 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 471 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 473 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 474 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 476 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 477 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 478 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 479 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 481 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 482 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.50.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 483 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 484 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 485 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: Running setscene task 486 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 492 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 496 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 498 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 499 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 501 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 502 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 503 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-yocto-5.10.43+gitAUTOINC+67dad5ca86_ab49d2db98-r0: task do_deploy_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 506 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 507 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_package_write_rpm_setscene)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 508 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.43+gitAUTOINC+67dad5ca86_ab49d2db98-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.50-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 511 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 512 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 536 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 537 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 550 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 551 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 552 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 560 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 571 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 594 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 597 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.50-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 602 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 613 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 614 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 630 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot_setscene)
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.106-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 642 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.43+gitAUTOINC+67dad5ca86_ab49d2db98-r0: task do_deploy_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 643 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 647 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 649 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 652 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 653 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 654 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.43+gitAUTOINC+67dad5ca86_ab49d2db98-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 680 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 684 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 687 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.43+gitAUTOINC+67dad5ca86_ab49d2db98-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.106-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.43+gitAUTOINC+67dad5ca86_ab49d2db98-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 696 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 698 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.43+gitAUTOINC+67dad5ca86_ab49d2db98-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 712 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 715 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 718 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.106-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 731 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 734 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 747 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 750 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_fetch)
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: Running task 774 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: recipe libdrm-2.4.106-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 808 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_fetch)
NOTE: Running task 830 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 837 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 848 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_fetch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 885 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_fetch)
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: Running task 900 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: Running task 912 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: recipe libdrm-2.4.106-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 913 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 914 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_fetch)
NOTE: Running task 917 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: Running task 953 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_write_config)
NOTE: Running task 959 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: Running task 962 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: Running task 969 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Started
NOTE: Running task 1007 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: Running task 1018 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 742 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: Running task 1035 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_unpack)
NOTE: Running task 1039 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1040 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_write_config)
NOTE: Running task 1041 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_write_config)
NOTE: recipe mesa-2_21.1.2-r0: task do_fetch: Started
NOTE: Running task 1074 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: Running task 1087 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: recipe icu-69.1-r0: task do_fetch: Started
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1104 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 1105 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_fetch)
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: Running task 1122 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1123 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 1124 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_fetch)
NOTE: Running task 1125 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 1147 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: Running task 1163 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_fetch)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: recipe icu-69.1-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 1186 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: Running task 1187 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: Running task 1188 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_unpack)
NOTE: Running task 1189 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: Running task 1190 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_fetch: Succeeded
NOTE: Running task 1191 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1192 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_unpack)
NOTE: Running task 1193 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_unpack)
NOTE: Running task 1194 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: Running setscene task 748 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 750 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 752 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 753 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 758 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_write_config: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: Running task 1197 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: Running task 1198 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1212 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_write_config)
NOTE: Running task 1214 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_fetch)
NOTE: Running task 1235 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: Running task 1236 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_write_config)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 763 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_21.1.2-r0: task do_write_config: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Started
NOTE: recipe pango-1.48.5-r0: task do_write_config: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: Running setscene task 766 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 768 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 769 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: Running task 1239 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1244 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.40.2-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_fetch: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1260 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Started
NOTE: recipe pango-1.48.5-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 1265 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_unpack)
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: Running task 1266 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 1267 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: Running task 1268 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_unpack)
NOTE: Running task 1269 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe mesa-2_21.1.2-r0: task do_unpack: Started
NOTE: recipe icu-69.1-r0: task do_unpack: Started
NOTE: Running task 1270 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: Running task 1271 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Started
NOTE: Running task 1290 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_unpack)
NOTE: Running task 1302 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_fetch)
NOTE: recipe pango-1.48.5-r0: task do_unpack: Started
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_write_config: Started
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.40.2-r0: task do_write_config: Started
NOTE: recipe libpcre2-10.37-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: Running task 1383 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_write_config: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1416 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Succeeded
NOTE: Running task 1417 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_unpack)
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_write_config: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: Running task 1463 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: Running task 1489 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_patch)
NOTE: recipe vte-0.64.2-r0: task do_fetch: Started
NOTE: Running task 1493 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_write_config)
NOTE: Running task 1496 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Started
NOTE: recipe vte-0.64.2-r0: task do_fetch: Succeeded
NOTE: Running task 1511 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: Running task 1512 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_unpack)
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: Running task 1524 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe libpcre2-10.37-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1556 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Started
NOTE: Running task 1557 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: Running task 1559 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1576 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe libgcrypt-1.9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.40.2-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 781 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_packagedata_setscene)
NOTE: Running task 1578 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1586 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_patch)
NOTE: Running task 1587 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: recipe pango-1.48.5-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_unpack: Succeeded
NOTE: Running task 1621 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_patch)
NOTE: Running task 1622 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_patch)
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Succeeded
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: Running task 1641 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 1652 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 1658 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe vte-0.64.2-r0: task do_write_config: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.64.2-r0: task do_unpack: Started
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: Running setscene task 788 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 789 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 790 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 792 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 793 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 794 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_populate_sysroot_setscene)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 1727 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 1728 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: Running task 1729 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1730 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.10.4-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.40.2-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1731 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.8-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1732 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1733 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_generate_toolchain_file)
NOTE: Running task 1734 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1735 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_patch: Succeeded
NOTE: Running task 1736 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: Running task 1737 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: recipe pango-1.48.5-r0: task do_patch: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1738 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 798 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.37-r0: task do_unpack: Succeeded
NOTE: Running task 1743 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1744 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1745 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_patch)
NOTE: Running task 1746 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.40.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.48.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.37-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vte-0.64.2-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 802 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 804 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.37-r0: task do_patch: Succeeded
NOTE: Running task 1751 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 805 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 806 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_patch: Succeeded
NOTE: Running task 1756 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1757 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_populate_lic)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1758 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.64.2-r0: task do_populate_lic: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 810 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 811 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 812 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1767 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_patch)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vte-0.64.2-r0: task do_populate_lic: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe vte-0.64.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_populate_lic unihash changed to a3471ed877ea11faf4d12fd062ff60ceb99c14675f2c424c7391311dd653dc5d
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 814 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1772 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1777 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 816 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Succeeded
NOTE: recipe icu-69.1-r0: task do_unpack: Succeeded
NOTE: Running task 1779 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 818 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 819 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 820 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 821 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 822 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_21.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1781 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-69.1-r0: task do_patch: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-src went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-dbg went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcrecpp went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcreposix went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package pcregrep went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package pcregrep-doc went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package pcretest went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package pcretest-doc went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-ptest went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-staticdev went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-dev went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-doc went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-locale went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 824 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 825 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 826 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 827 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 828 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 829 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 830 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-69.1-r0: task do_patch: Succeeded
NOTE: Running task 1790 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_make_icudata)
NOTE: Running task 1791 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 832 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1792 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1793 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-69.1-r0: task do_make_icudata: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-69.1-r0: task do_make_icudata: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 835 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 836 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 837 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Succeeded
NOTE: Running task 1802 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_patch)
NOTE: recipe libx11-1_1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 838 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mesa-2_21.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1803 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 840 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 841 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 842 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 847 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 848 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 849 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 850 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 851 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 852 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 853 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 854 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 855 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 856 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 857 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 858 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 859 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 860 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.50.bb:do_packagedata_setscene)
NOTE: Running setscene task 861 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.50.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 862 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 863 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Succeeded
NOTE: Running task 1814 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_deploy_source_date_epoch)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.50-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.50-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1819 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 865 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.50-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 867 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 869 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 1824 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1825 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.50-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 871 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.50.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.10.43+gitAUTOINC+67dad5ca86_ab49d2db98-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 874 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 876 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 878 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 880 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 881 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 882 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 883 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 884 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 885 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 886 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.50-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 888 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe libcap-2.50-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1845 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe linux-yocto-5.10.43+gitAUTOINC+67dad5ca86_ab49d2db98-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.43+gitAUTOINC+67dad5ca86_ab49d2db98-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 891 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 894 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 895 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 896 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1880 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 898 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 899 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 900 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 901 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 902 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 904 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 905 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 906 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 907 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 908 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 909 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 910 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 911 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 912 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1886 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 916 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running setscene task 918 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1895 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 920 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 922 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 923 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 924 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 926 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 928 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 930 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 932 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 933 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 934 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 935 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 936 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 938 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 940 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 942 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 943 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 944 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 945 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 946 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 947 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 948 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 949 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 950 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1942 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-src went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-dbg went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3 went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-dev went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-doc went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-staticdev went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3 went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 951 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 952 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 953 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 954 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 955 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 956 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 957 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 958 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 959 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 960 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 966 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 970 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 971 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 972 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 973 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 974 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 975 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 976 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 977 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 979 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 980 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 982 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 983 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 984 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 985 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 986 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 987 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 988 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 989 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 990 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 991 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 992 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1987 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 994 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: Running setscene task 997 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 998 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1000 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1001 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1002 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to fe168fe2f55557b34abfe0a18d09d4e35cda8026f3406f53c85834278c76e62c
NOTE: Running task 2004 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe opkg-utils-0.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1005 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1007 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1008 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1009 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1010 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1011 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1013 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1015 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1016 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1017 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1018 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1019 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1021 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1022 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1023 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1025 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1026 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1027 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1029 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1030 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1031 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1033 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1034 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1035 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1036 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1037 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1038 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1044 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1045 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1046 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1048 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1049 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1050 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1051 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1052 of 1051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2354 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2414 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2518 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2526 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2565 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2587 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2591 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2603 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2713 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2714 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2761 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_21.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2887 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 6a34131b530a175ebdad514b70757cbb0a12d86aeb4de2a9ab5ca0f623bbdacd
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: Running task 3048 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3051 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_configure)
NOTE: Running task 3063 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3064 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3083 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe libpcre2-10.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3106 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3107 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: Running task 3108 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3133 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: recipe libpcre2-10.37-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3135 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3136 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_configure)
NOTE: recipe mesa-2_21.1.2-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3137 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3138 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 3139 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3140 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 3141 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Succeeded
NOTE: Running task 3142 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3143 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 3144 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 3145 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 3146 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 3147 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3148 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3149 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Succeeded
NOTE: Running task 3150 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_populate_sysroot)
NOTE: Running task 3151 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-69.1-r0: task do_configure: Succeeded
NOTE: Running task 3152 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_compile: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_configure: Succeeded
NOTE: Running task 3153 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_compile)
NOTE: recipe mesa-2_21.1.2-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Succeeded
NOTE: Running task 3154 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3155 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3156 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 3157 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 3158 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 3159 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 3160 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 3161 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3162 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 3163 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3164 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 3165 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 3166 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: Running task 3167 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3168 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 3169 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3170 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 3171 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3172 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3173 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3174 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3175 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 3176 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: Running task 3177 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe libpcre2-10.37-r0: task do_configure: Succeeded
NOTE: Running task 3178 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_compile: Started
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 3179 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3180 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: Running task 3181 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3182 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 3183 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: Running task 3184 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3185 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3186 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3187 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3188 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: Running task 3189 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3190 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_configure)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe freetype-2.10.4-r0: task do_configure: Started
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-src went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dbg went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-staticdev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-doc went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-locale went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3191 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: Running task 3192 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: Running task 3193 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Succeeded
NOTE: Running task 3194 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3195 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Succeeded
NOTE: Running task 3196 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.37-r0: task do_compile: Succeeded
NOTE: Running task 3201 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_install)
NOTE: recipe libpcre2-10.37-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3202 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.37-r0: task do_install: Succeeded
NOTE: Running task 3203 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_package)
NOTE: Running task 3204 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_populate_sysroot)
NOTE: recipe libpcre2-10.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.37-r0: task do_package: Started
NOTE: recipe libpcre2-10.37-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3205 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe freetype-2.10.4-r0: task do_configure: Succeeded
NOTE: Running task 3206 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_compile)
NOTE: recipe freetype-2.10.4-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_package: Succeeded
NOTE: Running task 3207 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_packagedata)
NOTE: recipe libpcre2-10.37-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3208 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libpcre2-10.37-r0: task do_packagedata: Succeeded
NOTE: Running task 3209 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_package_write_rpm)
NOTE: recipe libpcre2-10.37-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3210 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3211 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3212 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: Running task 3213 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3214 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe freetype-2.10.4-r0: task do_compile: Succeeded
NOTE: Running task 3215 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3216 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libpcre2-10.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3217 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3218 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_install: Succeeded
NOTE: Running task 3219 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot)
NOTE: Running task 3220 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3221 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3222 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3223 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_configure)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_configure: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Succeeded
NOTE: Running task 3224 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3225 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_configure: Succeeded
NOTE: Running task 3226 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_compile)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_compile: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: Running task 3227 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3228 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_compile: Succeeded
NOTE: Running task 3229 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_install)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Succeeded
NOTE: Running task 3230 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3231 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot)
NOTE: Running task 3232 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_install: Succeeded
NOTE: Running task 3233 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_populate_sysroot)
NOTE: recipe icu-69.1-r0: task do_compile: Succeeded
NOTE: Running task 3234 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_package)
NOTE: Running task 3235 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.40.2-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_package: Started
NOTE: recipe icu-69.1-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3236 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3237 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe icu-69.1-r0: task do_install: Succeeded
NOTE: Running task 3238 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot)
NOTE: Running task 3239 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 3240 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe icu-69.1-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3241 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_package: Succeeded
NOTE: Running task 3242 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_packagedata)
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.40.2-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3243 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3244 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3245 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: Running task 3246 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Succeeded
NOTE: Running task 3247 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3248 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 3249 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3250 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3251 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_package: Succeeded
NOTE: Running task 3252 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata)
NOTE: recipe icu-69.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 3253 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 3254 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe icu-69.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3255 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3256 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3257 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 3258 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3260 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3262 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3263 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3264 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3265 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3266 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3267 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_compile: Succeeded
NOTE: Running task 3268 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_install)
NOTE: recipe mesa-2_21.1.2-r0: task do_install: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_install: Succeeded
NOTE: Running task 3269 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_populate_sysroot)
NOTE: Running task 3270 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_package)
NOTE: recipe mesa-2_21.1.2-r0: task do_package: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3271 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3272 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3273 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_configure)
NOTE: recipe libepoxy-1.5.8-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3274 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_configure: Succeeded
NOTE: Running task 3275 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_compile)
NOTE: recipe libepoxy-1.5.8-r0: task do_compile: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_package: Succeeded
NOTE: Running task 3276 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_packagedata)
NOTE: recipe mesa-2_21.1.2-r0: task do_packagedata: Started
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
NOTE: recipe mesa-2_21.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3277 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_package_write_rpm)
NOTE: recipe mesa-2_21.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_compile: Succeeded
NOTE: Running task 3278 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_install)
NOTE: recipe libepoxy-1.5.8-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 3279 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_populate_sysroot)
NOTE: Running task 3280 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_package)
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 3281 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3282 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3283 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3284 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 3285 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 3286 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3287 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3288 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 3289 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3290 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 3291 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_compile)
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 3292 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_install)
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 3293 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_populate_sysroot)
NOTE: Running task 3294 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package)
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3295 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3296 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_configure)
NOTE: recipe pango-1.48.5-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Succeeded
NOTE: Running task 3297 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3298 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.5-r0: task do_configure: Succeeded
NOTE: Running task 3299 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3300 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_compile)
NOTE: recipe pango-1.48.5-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_compile: Succeeded
NOTE: Running task 3301 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3302 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_install)
NOTE: recipe pango-1.48.5-r0: task do_install: Started
NOTE: recipe pango-1.48.5-r0: task do_install: Succeeded
NOTE: Running task 3303 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3304 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_populate_sysroot)
NOTE: Running task 3305 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_package)
NOTE: recipe pango-1.48.5-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.5-r0: task do_package: Started
NOTE: recipe pango-1.48.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3306 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3307 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_configure)
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Started
NOTE: recipe pango-1.48.5-r0: task do_package: Succeeded
NOTE: Running task 3308 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_packagedata)
NOTE: recipe pango-1.48.5-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3309 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.5-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Succeeded
NOTE: Running task 3310 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_compile)
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Succeeded
NOTE: Running task 3311 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_install)
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Succeeded
NOTE: Running task 3312 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package)
NOTE: Running task 3313 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3314 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.64.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.64.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3319 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_configure)
NOTE: recipe vte-0.64.2-r0: task do_configure: Started
NOTE: recipe vte-0.64.2-r0: task do_configure: Succeeded
NOTE: Running task 3320 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_compile)
NOTE: recipe vte-0.64.2-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Succeeded
NOTE: Running task 3321 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Succeeded
NOTE: Running task 3325 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.64.2-r0: task do_compile: Succeeded
NOTE: Running task 3326 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_install)
NOTE: recipe vte-0.64.2-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_install: Succeeded
NOTE: Running task 3327 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_package)
NOTE: Running task 3328 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_populate_sysroot)
NOTE: recipe vte-0.64.2-r0: task do_package: Started
NOTE: recipe vte-0.64.2-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.64.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_package: Succeeded
NOTE: Running task 3329 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_packagedata)
NOTE: recipe vte-0.64.2-r0: task do_packagedata: Started
NOTE: recipe vte-0.64.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3330 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_package_write_rpm)
NOTE: Running task 3331 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_package_qa)
NOTE: recipe vte-0.64.2-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.64.2-r0: task do_package_qa: Started
NOTE: recipe vte-0.64.2-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3332 of 3332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3332 tasks of which 3002 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 56 ERROR messages shown, returning a non-zero exit code.

--===============3082520889574551238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (0 cached, 818 parsed). 1455 targets, 50 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-2b5498936781458375de4362be7cfdeb3936c950"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2b5498936781458375de4362be7cfdeb3936c950"
workspace            = "master:f585bf4c959ae0b52be8462d278cd289db79b813"

Initialising tasks...done.
Sstate summary: Wanted 194 Local 67 Network 0 Missed 127 Current 842 (34% match, 87% complete)
Removing 7 stale sstate objects for arch qemuarm...done.
Removing 10 stale sstate objects for arch armv7vet2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 844 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 845 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 846 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 856 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 862 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 868 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 869 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 878 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: Running setscene task 879 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 903 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 906 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 909 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 910 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 911 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 912 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_populate_sysroot_setscene)
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1013 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1014 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1015 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1016 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1017 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1018 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-src went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-dbg went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3 went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-dev went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-doc went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-staticdev went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3 went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1020 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1150 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1317 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 1327 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_fetch)
NOTE: Running task 1360 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: Running task 1424 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_fetch)
NOTE: Running task 1462 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 1475 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1503 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_fetch)
NOTE: Running task 1550 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_fetch)
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Started
NOTE: Running task 1572 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: Running task 1591 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: Running task 1592 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: Running task 1601 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_unpack)
NOTE: Running task 1605 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1606 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_fetch)
NOTE: Running task 1607 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1616 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_fetch)
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1025 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: Running task 1633 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: Running task 1675 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_write_config)
NOTE: Running task 1690 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: recipe mesa-2_21.1.2-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Started
NOTE: Running task 1713 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: Running task 1714 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: Running task 1715 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1737 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_unpack)
NOTE: Running task 1738 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_unpack)
NOTE: Running task 1739 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-69.1-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: Running task 1740 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 1776 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-69.1-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: Running task 1777 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_unpack)
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: Running task 1796 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: recipe pango-1.48.5-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: Running task 1804 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1814 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_unpack)
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: Running task 1815 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: Running task 1821 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: Running task 1835 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.5-r0: task do_fetch: Succeeded
NOTE: Running task 1836 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_unpack)
NOTE: Running task 1852 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1853 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: Running task 1854 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_write_config)
NOTE: Running task 1856 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_write_config)
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Started
NOTE: Running task 1877 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1890 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 1910 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: Running task 1912 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1918 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_21.1.2-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Started
NOTE: Running task 1938 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: recipe icu-69.1-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1956 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1966 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_patch)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe pango-1.48.5-r0: task do_unpack: Started
NOTE: Running task 1983 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_fetch)
NOTE: recipe pango-1.48.5-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2010 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 2011 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 2012 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 2013 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_fetch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: Running task 2038 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe pango-1.48.5-r0: task do_write_config: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: Running task 2051 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Succeeded
NOTE: Running task 2071 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Succeeded
NOTE: Running task 2079 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_fetch)
NOTE: Running task 2080 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: Running task 2090 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 2120 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_write_config)
NOTE: Running task 2126 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_fetch)
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.40.2-r0: task do_fetch: Started
NOTE: Running task 2137 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: Running task 2145 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_fetch: Succeeded
NOTE: Running task 2162 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_unpack)
NOTE: Running task 2170 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: Running task 2171 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_write_config)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 2182 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: Running task 2183 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 2184 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 2185 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 2186 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: Running task 2187 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_patch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: Running task 2229 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_unpack)
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: Running task 2237 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre2-10.37-r0: task do_fetch: Started
NOTE: Running task 2243 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_fetch)
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Succeeded
NOTE: Running task 2262 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_unpack)
NOTE: recipe libpcre2-10.37-r0: task do_fetch: Succeeded
NOTE: Running task 2276 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_unpack)
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2304 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.40.2-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_unpack: Succeeded
NOTE: Running task 2369 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2371 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2372 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libepoxy-1.5.8-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: Running task 2373 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_patch)
NOTE: Running task 2374 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_generate_toolchain_file)
NOTE: Running task 2375 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2376 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.10.4-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 2390 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: Running task 2397 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2404 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vte-0.64.2-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.37-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2435 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_unpack)
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: Running task 2436 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: Running task 2438 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: Running task 2443 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.40.2-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 2481 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: Running task 2482 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: Running task 2483 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2496 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 2507 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.48.5-r0: task do_patch: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2542 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: Running task 2543 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_write_config)
NOTE: recipe pango-1.48.5-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2579 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_deploy_source_date_epoch)
NOTE: recipe vte-0.64.2-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2610 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: Running task 2618 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2693 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: Running task 2714 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.8-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: Running task 2736 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2768 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_write_config: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2769 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2770 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_patch)
NOTE: Running task 2771 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.64.2-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2789 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_patch)
NOTE: recipe libepoxy-1.5.8-r0: task do_patch: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_write_config: Succeeded
NOTE: Running task 2812 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2844 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2881 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 278761f683d58654f46eeb60975397bcf0fc79ad68c8c25e0ee17d6d6bbad66b
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: Running task 2892 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe pango-1.48.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_patch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 2951 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_patch)
NOTE: recipe libpcre2-10.37-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_patch: Succeeded
NOTE: Running task 2955 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2956 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2957 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2958 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_populate_lic)
NOTE: recipe mesa-2_21.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2959 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1028 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.64.2-r0: task do_populate_lic: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Succeeded
NOTE: Running task 2964 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-69.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2965 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_patch)
NOTE: Running task 2966 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libpcre2-10.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2967 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_configure)
NOTE: recipe vte-0.64.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_populate_lic unihash changed to a3471ed877ea11faf4d12fd062ff60ceb99c14675f2c424c7391311dd653dc5d
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.64.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_unpack: Succeeded
NOTE: recipe icu-69.1-r0: task do_patch: Started
NOTE: Running task 2968 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_patch)
NOTE: recipe libpcre2-10.37-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1030 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1031 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_21.1.2-r0: task do_patch: Started
NOTE: recipe icu-69.1-r0: task do_patch: Succeeded
NOTE: Running task 2973 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_make_icudata)
NOTE: Running task 2974 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 1fadc44bbb97006d7f8b62466dc5b890540a7ca4ef72a6e997187e3c55717d9e
NOTE: Running task 2988 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_make_icudata: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-69.1-r0: task do_make_icudata: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2990 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe mesa-2_21.1.2-r0: task do_patch: Succeeded
NOTE: Running task 2991 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2992 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_configure)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-69.1-r0: task do_configure: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2993 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_configure)
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 2994 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2995 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Succeeded
NOTE: Running task 2996 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Succeeded
NOTE: Running task 2997 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_deploy_source_date_epoch)
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2998 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2999 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 3000 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 3001 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 3002 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3003 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Succeeded
NOTE: Running task 3004 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_populate_sysroot)
NOTE: Running task 3005 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 3006 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 3007 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 3008 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 3009 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3010 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Succeeded
NOTE: Running task 3011 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_packagedata)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1034 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 1035 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3017 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package_write_rpm)
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Started
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-src went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-dbg went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcrecpp went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcreposix went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package pcregrep went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package pcregrep-doc went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package pcretest went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package pcretest-doc went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-ptest went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-staticdev went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-dev went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-doc went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-locale went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 3018 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running setscene task 1037 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3019 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3049 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 3050 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: Running task 3064 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.37-r0: task do_configure: Succeeded
NOTE: Running task 3125 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_compile)
NOTE: recipe icu-69.1-r0: task do_configure: Succeeded
NOTE: Running task 3126 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_compile)
NOTE: recipe libpcre2-10.37-r0: task do_compile: Started
NOTE: recipe icu-69.1-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3127 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 3128 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 3129 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3130 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3131 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_configure: Succeeded
NOTE: Running task 3132 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3133 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe mesa-2_21.1.2-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 3134 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 3135 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 3136 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 3137 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3138 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3139 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3140 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: Running task 3141 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: Running task 3142 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 3143 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: Running task 3144 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3145 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3146 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3147 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3148 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3149 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3150 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_configure)
NOTE: recipe freetype-2.10.4-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3151 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3152 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: Running task 3153 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: Running task 3154 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3155 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-src went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dbg went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-staticdev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-doc went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-locale went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3156 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3157 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: Running task 3158 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3159 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe libpcre2-10.37-r0: task do_compile: Succeeded
NOTE: Running task 3160 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_install)
NOTE: recipe libpcre2-10.37-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: Running task 3161 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3162 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe libpcre2-10.37-r0: task do_install: Succeeded
NOTE: Running task 3163 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_package)
NOTE: Running task 3164 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_populate_sysroot)
NOTE: recipe libpcre2-10.37-r0: task do_package: Started
NOTE: recipe libpcre2-10.37-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3165 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3166 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe libpcre2-10.37-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_package: Succeeded
NOTE: Running task 3167 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_packagedata)
NOTE: recipe libpcre2-10.37-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.37-r0: task do_packagedata: Succeeded
NOTE: Running task 3168 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_configure: Succeeded
NOTE: Running task 3169 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_compile)
NOTE: recipe libpcre2-10.37-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3170 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3171 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: Running task 3172 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3173 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install)
NOTE: recipe libpcre2-10.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3174 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_compile: Succeeded
NOTE: Running task 3175 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3176 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe freetype-2.10.4-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3177 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3178 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe freetype-2.10.4-r0: task do_install: Succeeded
NOTE: Running task 3179 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot)
NOTE: Running task 3180 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3181 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3182 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3183 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Succeeded
NOTE: Running task 3184 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install_ptest_base)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3185 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3186 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_configure: Started
NOTE: Running task 3187 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package)
NOTE: Running task 3188 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3189 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package: Succeeded
NOTE: Running task 3190 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3191 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_configure: Succeeded
NOTE: Running task 3192 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_compile)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_compile: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Succeeded
NOTE: Running task 3193 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3194 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_compile: Succeeded
NOTE: Running task 3195 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_install)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_install: Succeeded
NOTE: Running task 3196 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_populate_sysroot)
NOTE: Running task 3197 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_package)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_package: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_compile: Succeeded
NOTE: Running task 3198 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_install)
NOTE: recipe mesa-2_21.1.2-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3199 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_install: Succeeded
NOTE: Running task 3200 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_populate_sysroot)
NOTE: Running task 3201 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_package)
NOTE: recipe mesa-2_21.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3202 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe mesa-2_21.1.2-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3203 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 3204 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3205 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3206 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_configure)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_package: Succeeded
NOTE: Running task 3207 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.8-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3208 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe icu-69.1-r0: task do_compile: Succeeded
NOTE: Running task 3209 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_install)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3210 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3211 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: recipe libepoxy-1.5.8-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3212 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_compile)
NOTE: Running task 3213 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-69.1-r0: task do_install: Succeeded
NOTE: Running task 3214 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot)
NOTE: Running task 3215 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3216 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3217 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 3218 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 3219 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 3220 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_package: Succeeded
NOTE: Running task 3221 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3222 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3223 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_21.1.2-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
NOTE: Running task 3224 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3225 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_package_write_rpm)
NOTE: recipe mesa-2_21.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3226 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 3227 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3229 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe icu-69.1-r0: task do_package: Succeeded
NOTE: Running task 3231 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata)
NOTE: recipe icu-69.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3232 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3233 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3234 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3235 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3236 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_compile: Succeeded
NOTE: Running task 3237 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_install)
NOTE: recipe libepoxy-1.5.8-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3238 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 3239 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_populate_sysroot)
NOTE: Running task 3240 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3241 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 3242 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3243 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3244 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3245 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 3246 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 3247 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3248 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3249 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 3250 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3251 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 3252 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_compile)
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 3253 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_install)
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 3254 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_populate_sysroot)
NOTE: Running task 3255 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package)
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3256 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3257 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_configure)
NOTE: recipe pango-1.48.5-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Succeeded
NOTE: Running task 3258 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3259 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.5-r0: task do_configure: Succeeded
NOTE: Running task 3260 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3261 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_compile)
NOTE: recipe pango-1.48.5-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_compile: Succeeded
NOTE: Running task 3262 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3263 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_install)
NOTE: recipe pango-1.48.5-r0: task do_install: Started
NOTE: recipe pango-1.48.5-r0: task do_install: Succeeded
NOTE: Running task 3264 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3265 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_populate_sysroot)
NOTE: Running task 3266 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_package)
NOTE: recipe pango-1.48.5-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.5-r0: task do_package: Started
NOTE: recipe pango-1.48.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3267 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3268 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_configure)
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Started
NOTE: recipe pango-1.48.5-r0: task do_package: Succeeded
NOTE: Running task 3269 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_packagedata)
NOTE: recipe pango-1.48.5-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3270 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.5-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Succeeded
NOTE: Running task 3271 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_compile)
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Succeeded
NOTE: Running task 3272 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_install)
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Succeeded
NOTE: Running task 3273 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package)
NOTE: Running task 3274 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3275 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.64.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.64.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3280 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_configure)
NOTE: recipe vte-0.64.2-r0: task do_configure: Started
NOTE: recipe vte-0.64.2-r0: task do_configure: Succeeded
NOTE: Running task 3281 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_compile)
NOTE: recipe vte-0.64.2-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Succeeded
NOTE: Running task 3282 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Succeeded
NOTE: Running task 3286 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.64.2-r0: task do_compile: Succeeded
NOTE: Running task 3287 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_install)
NOTE: recipe vte-0.64.2-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_install: Succeeded
NOTE: Running task 3288 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_package)
NOTE: Running task 3289 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_populate_sysroot)
NOTE: recipe vte-0.64.2-r0: task do_package: Started
NOTE: recipe vte-0.64.2-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.64.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_package: Succeeded
NOTE: Running task 3290 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_packagedata)
NOTE: recipe vte-0.64.2-r0: task do_packagedata: Started
NOTE: recipe vte-0.64.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3291 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_package_write_rpm)
NOTE: Running task 3292 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_package_qa)
NOTE: recipe vte-0.64.2-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.64.2-r0: task do_package_qa: Started
NOTE: recipe vte-0.64.2-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3293 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3293 tasks of which 2977 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 56 ERROR messages shown, returning a non-zero exit code.

--===============3082520889574551238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (0 cached, 818 parsed). 1455 targets, 67 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-2b5498936781458375de4362be7cfdeb3936c950"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2b5498936781458375de4362be7cfdeb3936c950"
workspace            = "master:f585bf4c959ae0b52be8462d278cd289db79b813"

Initialising tasks...done.
Sstate summary: Wanted 173 Local 46 Network 0 Missed 127 Current 863 (26% match, 87% complete)
Removing 10 stale sstate objects for arch ppc7400...done.
Removing 7 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 868 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 869 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 870 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 875 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 876 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 880 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 881 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 890 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: Running setscene task 891 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 905 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 907 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 909 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 910 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 911 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 912 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_populate_sysroot_setscene)
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1013 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1014 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1015 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1016 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1151 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1017 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: Running task 1279 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 1289 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_fetch)
NOTE: Running task 1322 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: Running task 1386 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_fetch)
NOTE: Running task 1424 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 1437 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Started
NOTE: Running task 1465 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Succeeded
NOTE: Running task 1499 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: Running task 1500 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_unpack)
NOTE: Running task 1501 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1515 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 1526 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: Running task 1538 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: Running task 1568 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1569 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1570 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_fetch)
NOTE: Running task 1579 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_fetch)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Started
NOTE: Running task 1622 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: recipe mesa-2_21.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1624 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_unpack)
NOTE: Running task 1639 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_write_config)
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: Running setscene task 1020 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Started
NOTE: Running task 1654 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 1655 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_unpack)
NOTE: Running task 1656 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: Running task 1657 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: recipe icu-69.1-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: Running task 1676 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: recipe icu-69.1-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 1689 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_unpack)
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1695 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_fetch: Started
NOTE: Running task 1696 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: Running task 1697 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 1706 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: recipe pango-1.48.5-r0: task do_fetch: Succeeded
NOTE: Running task 1712 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_unpack)
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 1724 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: recipe mesa-2_21.1.2-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_write_config: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: Running task 1736 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: Running task 1774 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_write_config: Succeeded
NOTE: Running task 1788 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 1797 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: Running task 1798 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: Running task 1803 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: Running task 1807 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1808 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1809 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_write_config)
NOTE: Running task 1811 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_write_config)
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-src went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-dbg went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Started
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3 went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
NOTE: recipe icu-69.1-r0: task do_unpack: Started
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-dev went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
NOTE: Running task 1844 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: recipe pango-1.48.5-r0: task do_unpack: Started
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-doc went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-staticdev went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
NOTE: Running task 1865 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1871 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3 went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1880 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 1892 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
NOTE: Running task 1930 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_fetch)
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Started
NOTE: Running setscene task 1022 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1955 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_fetch)
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: Running task 1956 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 1957 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1958 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: Running task 1975 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: Running task 1983 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: Running task 1985 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 2013 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe pango-1.48.5-r0: task do_write_config: Started
NOTE: Running task 2023 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_fetch)
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 2041 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Started
NOTE: Running task 2047 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2064 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_write_config)
NOTE: Running task 2070 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_fetch)
NOTE: recipe pango-1.48.5-r0: task do_write_config: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_fetch: Started
NOTE: Running task 2109 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_write_config)
NOTE: Running task 2110 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 2132 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 2133 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_fetch: Started
NOTE: Running task 2134 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_unpack)
NOTE: Running task 2135 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: Running task 2136 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_patch: Started
NOTE: Running task 2159 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: Running task 2160 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2161 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_unpack)
NOTE: Running task 2162 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_write_config: Started
NOTE: recipe pango-1.48.5-r0: task do_unpack: Succeeded
NOTE: Running task 2171 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_patch)
NOTE: Running task 2183 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_fetch)
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Started
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_write_config: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2248 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2249 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe freetype-2.10.4-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.40.2-r0: task do_unpack: Started
NOTE: Running task 2250 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe libepoxy-1.5.8-r0: task do_write_config: Succeeded
NOTE: Running task 2251 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.8-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 2264 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2267 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2268 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 2269 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_unpack)
NOTE: Running task 2272 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_unpack)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2302 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe vte-0.64.2-r0: task do_fetch: Started
NOTE: Running task 2304 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: Running task 2337 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe pango-1.48.5-r0: task do_patch: Succeeded
NOTE: Running task 2338 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_fetch: Succeeded
NOTE: Running task 2339 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2340 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: Running task 2341 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: Running task 2342 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_unpack)
NOTE: Running task 2361 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_generate_toolchain_file)
NOTE: Running task 2362 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: Running task 2383 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_patch)
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2384 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2404 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: recipe libpcre2-10.37-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Started
NOTE: Running task 2416 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: recipe mesa-2_21.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe libpcre2-10.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.64.2-r0: task do_unpack: Started
NOTE: Running task 2483 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2535 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2536 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_write_config)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2584 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.40.2-r0: task do_patch: Succeeded
NOTE: Running task 2654 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2663 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2664 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2684 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe libepoxy-1.5.8-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2685 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: recipe vte-0.64.2-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.64.2-r0: task do_write_config: Started
NOTE: Running task 2706 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: Running task 2707 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2725 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_configure)
NOTE: recipe pango-1.48.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2726 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe vte-0.64.2-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.37-r0: task do_unpack: Succeeded
NOTE: Running task 2817 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_patch)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: Running task 2852 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: Running setscene task 1025 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to fb4425e04d05d4f6bf313ecfabba08b00dbffb5b3ce956f1f4f9629ed613676d
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Started
NOTE: recipe vte-0.64.2-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2948 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: recipe libpcre2-10.37-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 2949 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_deploy_source_date_epoch)
NOTE: Running task 2950 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_patch)
NOTE: recipe vte-0.64.2-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2951 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: Running task 2952 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_populate_lic)
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2953 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2954 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: recipe libpcre2-10.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Started
NOTE: recipe vte-0.64.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.64.2-r0: task do_populate_lic: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2955 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Succeeded
NOTE: Running task 2956 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2962 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_configure)
NOTE: recipe vte-0.64.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_populate_lic unihash changed to a3471ed877ea11faf4d12fd062ff60ceb99c14675f2c424c7391311dd653dc5d
NOTE: recipe vte-0.64.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_unpack: Succeeded
NOTE: recipe icu-69.1-r0: task do_unpack: Succeeded
NOTE: Running task 2963 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_patch)
NOTE: Running task 2964 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_patch)
NOTE: recipe libpcre2-10.37-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_patch: Started
NOTE: recipe icu-69.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 202474001c0ab4795c4c895a19551098a359ecc98f131bb66809ffbff2f0ebdd
NOTE: Running task 2965 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: Running task 2980 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_patch: Succeeded
NOTE: Running task 2981 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_make_icudata)
NOTE: Running task 2982 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-69.1-r0: task do_make_icudata: Started
NOTE: recipe icu-69.1-r0: task do_make_icudata: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_patch: Succeeded
NOTE: Running task 2983 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 2984 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe mesa-2_21.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2985 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2986 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_compile)
NOTE: recipe mesa-2_21.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2987 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_configure)
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2988 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: Running setscene task 1029 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Succeeded
NOTE: Running task 2993 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_patch)
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_configure: Started
NOTE: recipe icu-69.1-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 2994 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1031 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1032 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Succeeded
NOTE: Running task 2999 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 3000 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1034 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 1035 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 3006 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 3007 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-src went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-dbg went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcrecpp went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcreposix went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package pcregrep went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package pcregrep-doc went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package pcretest went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package pcretest-doc went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-ptest went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-staticdev went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-dev went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-doc went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-locale went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1037 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3037 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 3051 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3112 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Succeeded
NOTE: Running task 3113 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_populate_sysroot)
NOTE: Running task 3114 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 3115 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3116 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3117 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Succeeded
NOTE: Running task 3118 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 3119 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3120 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package_write_rpm)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 3121 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 3122 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_configure: Succeeded
NOTE: Running task 3123 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 3124 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe icu-69.1-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3125 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_configure: Succeeded
NOTE: Running task 3126 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_compile)
NOTE: recipe mesa-2_21.1.2-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 3127 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 3128 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 3129 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3130 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3131 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3132 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 3133 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 3134 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 3135 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3136 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 3137 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: Running task 3138 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 3139 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3140 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3141 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3142 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 3143 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: Running task 3144 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: Running task 3145 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3146 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe libpcre2-10.37-r0: task do_configure: Succeeded
NOTE: Running task 3147 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_compile)
NOTE: recipe libpcre2-10.37-r0: task do_compile: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3148 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3149 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3150 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3151 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: Running task 3152 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3153 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3154 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_configure)
NOTE: recipe freetype-2.10.4-r0: task do_configure: Started
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-src went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dbg went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-staticdev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-doc went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-locale went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3155 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: Running task 3156 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3157 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3158 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: Running task 3159 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3160 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3161 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: Running task 3162 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3163 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3164 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe freetype-2.10.4-r0: task do_configure: Succeeded
NOTE: Running task 3165 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_compile)
NOTE: recipe freetype-2.10.4-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3166 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe libpcre2-10.37-r0: task do_compile: Succeeded
NOTE: Running task 3167 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_install)
NOTE: recipe libpcre2-10.37-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3168 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libpcre2-10.37-r0: task do_install: Succeeded
NOTE: Running task 3169 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_package)
NOTE: Running task 3170 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_populate_sysroot)
NOTE: recipe libpcre2-10.37-r0: task do_package: Started
NOTE: recipe libpcre2-10.37-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3171 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3172 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3173 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libpcre2-10.37-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3174 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3175 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libpcre2-10.37-r0: task do_package: Succeeded
NOTE: Running task 3176 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe freetype-2.10.4-r0: task do_compile: Succeeded
NOTE: Running task 3177 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_install)
NOTE: recipe libpcre2-10.37-r0: task do_packagedata: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3178 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe libpcre2-10.37-r0: task do_packagedata: Succeeded
NOTE: Running task 3179 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_package_write_rpm)
NOTE: recipe libpcre2-10.37-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_install: Succeeded
NOTE: Running task 3180 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot)
NOTE: Running task 3181 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: Running task 3182 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile_ptest_base)
NOTE: recipe freetype-2.10.4-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3183 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3184 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3185 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_configure)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_configure: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3186 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: recipe libpcre2-10.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package: Succeeded
NOTE: Running task 3187 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3188 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Succeeded
NOTE: Running task 3189 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install_ptest_base)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_configure: Succeeded
NOTE: Running task 3190 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3191 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot)
NOTE: Running task 3192 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-core-2.40.2-r0: task do_compile: Succeeded
NOTE: Running task 3193 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_install)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Succeeded
NOTE: Running task 3194 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_install: Succeeded
NOTE: Running task 3195 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_populate_sysroot)
NOTE: Running task 3196 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_package)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3197 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3198 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_21.1.2-r0: task do_compile: Succeeded
NOTE: Running task 3199 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_install: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_install: Succeeded
NOTE: Running task 3200 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_populate_sysroot)
NOTE: Running task 3201 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_package)
NOTE: recipe mesa-2_21.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3202 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 3203 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3204 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3205 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe libepoxy-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3206 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_package: Succeeded
NOTE: Running task 3207 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_compile: Succeeded
NOTE: Running task 3208 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3209 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe icu-69.1-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3210 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.8-r0: task do_configure: Succeeded
NOTE: Running task 3211 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_compile)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3212 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 3213 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-69.1-r0: task do_install: Succeeded
NOTE: Running task 3214 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot)
NOTE: Running task 3215 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package)
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_package: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 3216 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3217 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3218 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 3219 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 3220 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3221 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3222 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3223 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_package: Succeeded
NOTE: Running task 3224 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_packagedata)
NOTE: recipe mesa-2_21.1.2-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3225 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
NOTE: recipe mesa-2_21.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3226 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_package_write_rpm)
NOTE: recipe mesa-2_21.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 3227 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3229 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_package: Succeeded
NOTE: Running task 3231 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata)
NOTE: recipe icu-69.1-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3232 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3233 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3234 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3235 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3236 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3237 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3238 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_compile: Succeeded
NOTE: Running task 3239 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_install)
NOTE: recipe libepoxy-1.5.8-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 3240 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_populate_sysroot)
NOTE: Running task 3241 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_package)
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 3242 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3243 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3244 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3245 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 3246 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 3247 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3248 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3249 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 3250 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3251 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 3252 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_compile)
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 3253 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_install)
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 3254 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_populate_sysroot)
NOTE: Running task 3255 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package)
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3256 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3257 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_configure)
NOTE: recipe pango-1.48.5-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Succeeded
NOTE: Running task 3258 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3259 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.5-r0: task do_configure: Succeeded
NOTE: Running task 3260 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3261 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_compile)
NOTE: recipe pango-1.48.5-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_compile: Succeeded
NOTE: Running task 3262 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3263 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_install)
NOTE: recipe pango-1.48.5-r0: task do_install: Started
NOTE: recipe pango-1.48.5-r0: task do_install: Succeeded
NOTE: Running task 3264 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3265 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_populate_sysroot)
NOTE: Running task 3266 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_package)
NOTE: recipe pango-1.48.5-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.5-r0: task do_package: Started
NOTE: recipe pango-1.48.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3267 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3268 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_configure)
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Started
NOTE: recipe pango-1.48.5-r0: task do_package: Succeeded
NOTE: Running task 3269 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_packagedata)
NOTE: recipe pango-1.48.5-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3270 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.5-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Succeeded
NOTE: Running task 3271 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_compile)
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Succeeded
NOTE: Running task 3272 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_install)
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Succeeded
NOTE: Running task 3273 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package)
NOTE: Running task 3274 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3275 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.64.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.64.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3280 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_configure)
NOTE: recipe vte-0.64.2-r0: task do_configure: Started
NOTE: recipe vte-0.64.2-r0: task do_configure: Succeeded
NOTE: Running task 3281 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_compile)
NOTE: recipe vte-0.64.2-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Succeeded
NOTE: Running task 3282 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Succeeded
NOTE: Running task 3286 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.64.2-r0: task do_compile: Succeeded
NOTE: Running task 3287 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_install)
NOTE: recipe vte-0.64.2-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_install: Succeeded
NOTE: Running task 3288 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_package)
NOTE: Running task 3289 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_populate_sysroot)
NOTE: recipe vte-0.64.2-r0: task do_package: Started
NOTE: recipe vte-0.64.2-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.64.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_package: Succeeded
NOTE: Running task 3290 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_packagedata)
NOTE: recipe vte-0.64.2-r0: task do_packagedata: Started
NOTE: recipe vte-0.64.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3291 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_package_write_rpm)
NOTE: Running task 3292 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_package_qa)
NOTE: recipe vte-0.64.2-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.64.2-r0: task do_package_qa: Started
NOTE: recipe vte-0.64.2-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3293 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3293 tasks of which 2977 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 56 ERROR messages shown, returning a non-zero exit code.

--===============3082520889574551238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vte: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte: SRC_URI changed from "https://ftp.gnome.org/pub/GNOME/sources/vte/0.64/vte-0.64.1.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch" to "https://ftp.gnome.org/pub/GNOME/sources/vte/0.64/vte-0.64.2.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
packages/core2-32-poky-linux/vte/libvte: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/libvte: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
Changes to packages/core2-32-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.6400.1 to libvte-2.91.so.0.6400.2
  /usr/lib/libvte-2.91.so.0.6400.1 moved to /usr/lib/libvte-2.91.so.0.6400.2
packages/core2-32-poky-linux/vte/vte-dbg: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-dbg: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-dev: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-dev: PKGSIZE changed from 367910 to 367914 (+0%)
packages/core2-32-poky-linux/vte/vte-dev: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-doc: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-doc: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-am: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-am: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-an: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-an: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ang: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-ang: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ar: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-ar: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-as: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-as: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ast: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-ast: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-az: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-az: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-be+latin: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-be+latin: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-be: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-be: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-bg: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-bg: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-bn-in: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-bn-in: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-bn: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-bn: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-bs: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-bs: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ca+valencia: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-ca+valencia: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ca: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-ca: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ckb: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-ckb: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-cs: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-cs: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-cy: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-cy: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-da: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-da: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-de: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-de: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-dz: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-dz: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-el: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-el: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-en+shaw: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-en+shaw: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-en-ca: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-en-ca: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-en-gb: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-en-gb: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-eo: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-eo: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-es: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-es: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-et: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-et: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-eu: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-eu: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-fa: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-fa: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-fi: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-fi: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-fr: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-fr: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-fur: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-fur: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ga: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-ga: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-gd: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-gd: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-gl: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-gl: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-gu: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-gu: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-he: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-he: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-hi: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-hi: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-hr: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-hr: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-hu: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-hu: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-id: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-id: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-is: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-is: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-it: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-it: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ja: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-ja: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ka: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-ka: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-kk: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-kk: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-kn: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-kn: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ko: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-ko: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ku: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-ku: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ky: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-ky: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-li: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-li: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-lt: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-lt: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-lv: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-lv: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mai: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-mai: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mi: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-mi: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mjw: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-mjw: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mk: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-mk: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ml: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-ml: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mn: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-mn: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mr: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-mr: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ms: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-ms: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-nb: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-nb: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-nds: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-nds: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ne: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-ne: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-nl: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-nl: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-nn: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-nn: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-oc: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-oc: PKGSIZE changed from 1048 to 1305 (+25%)
packages/core2-32-poky-linux/vte/vte-locale-oc: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-or: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-or: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-pa: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-pa: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-pl: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-pl: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-pt-br: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-pt-br: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-pt: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-pt: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ro: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-ro: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ru: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-ru: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-rw: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-rw: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-si: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-si: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sk: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-sk: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sl: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-sl: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sq: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-sq: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sr+latin: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-sr+latin: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sr: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-sr: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sv: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-sv: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ta: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-ta: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-te: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-te: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-tg: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-tg: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-th: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-th: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-tr: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-tr: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ug: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-ug: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-uk: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-uk: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-uz+cyrillic: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-uz+cyrillic: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-vi: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-vi: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-wa: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-wa: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-xh: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-xh: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-cn: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-zh-cn: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-hk: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-zh-hk: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-tw: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-locale-zh-tw: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-prompt: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-prompt: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-src: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-src: PKGSIZE changed from 2081348 to 2081352 (+0%)
packages/core2-32-poky-linux/vte/vte-src: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte-staticdev: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte-staticdev: PKGV changed from 0.64.1 [default] to 0.64.2 [default]
packages/core2-32-poky-linux/vte/vte: PV changed from "0.64.1" to "0.64.2"
packages/core2-32-poky-linux/vte/vte: PKGV changed from 0.64.1 [default] to 0.64.2 [default]

--===============3082520889574551238==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-vte-upgrade-0.64.1-0.64.2.patch"

From e9be747edada1d379712005e1c6420d06aaedb70 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Jun 2021 11:38:29 +0000
Subject: [PATCH] vte: upgrade 0.64.1 -> 0.64.2

---
 meta/recipes-support/vte/{vte_0.64.1.bb => vte_0.64.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vte/{vte_0.64.1.bb => vte_0.64.2.bb} (95%)

diff --git a/meta/recipes-support/vte/vte_0.64.1.bb b/meta/recipes-support/vte/vte_0.64.2.bb
similarity index 95%
rename from meta/recipes-support/vte/vte_0.64.1.bb
rename to meta/recipes-support/vte/vte_0.64.2.bb
index 0401eaa049..b0baa3f422 100644
--- a/meta/recipes-support/vte/vte_0.64.1.bb
+++ b/meta/recipes-support/vte/vte_0.64.2.bb
@@ -20,7 +20,7 @@ inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-intros
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "12fb41a9ff8e03c5f1711b46560910a4b9b3102aec3e9e7609ceef4dfa98aa2a"
+SRC_URI[archive.sha256sum] = "2b3c820b65a667c1d8859ba20478be626d1519cc3159dac25f703330c6d07e18"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.20.1


--===============3082520889574551238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.6400.1 to libvte-2.91.so.0.6400.2
  /usr/lib/libvte-2.91.so.0.6400.1 moved to /usr/lib/libvte-2.91.so.0.6400.2
packages/core2-32-poky-linux/vte/vte-locale-oc: PKGSIZE changed from 1048 to 1305 (+25%)

--===============3082520889574551238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (0 cached, 818 parsed). 1455 targets, 59 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-2b5498936781458375de4362be7cfdeb3936c950"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2b5498936781458375de4362be7cfdeb3936c950"
workspace            = "master:f585bf4c959ae0b52be8462d278cd289db79b813"

Initialising tasks...done.
Sstate summary: Wanted 173 Local 46 Network 0 Missed 127 Current 863 (26% match, 87% complete)
Removing 7 stale sstate objects for arch qemumips...done.
Removing 10 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 868 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 869 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 870 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 875 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 876 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 880 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 881 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 890 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: Running setscene task 891 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 905 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 907 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 909 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 910 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 911 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 912 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_populate_sysroot_setscene)
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1013 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 1014 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1015 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_packagedata_setscene)
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1016 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1017 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1018 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-src went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-dbg went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3 went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-dev went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-doc went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-staticdev went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3 went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1020 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1151 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1317 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 1327 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_fetch)
NOTE: Running task 1360 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: Running task 1424 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_fetch)
NOTE: Running task 1462 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 1475 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1503 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Started
NOTE: Running task 1550 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_fetch)
NOTE: Running task 1572 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Succeeded
NOTE: Running task 1586 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: Running task 1587 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: Running task 1588 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_unpack)
NOTE: Running task 1605 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1606 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_fetch)
NOTE: Running task 1607 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1616 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 1630 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: Running task 1675 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_write_config)
NOTE: Running task 1690 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: recipe mesa-2_21.1.2-r0: task do_fetch: Started
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: Running task 1713 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: Running task 1719 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: Running task 1720 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_21.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1732 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1733 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_unpack)
NOTE: Running task 1734 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: recipe icu-69.1-r0: task do_fetch: Started
NOTE: Running task 1735 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: recipe icu-69.1-r0: task do_fetch: Succeeded
NOTE: Running task 1757 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_unpack)
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: Running task 1777 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1778 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: Running task 1779 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1780 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: recipe pango-1.48.5-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: Running task 1803 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_unpack)
NOTE: recipe pango-1.48.5-r0: task do_fetch: Succeeded
NOTE: Running task 1812 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_unpack)
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: Running task 1822 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: recipe mesa-2_21.1.2-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: Running task 1835 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: Running task 1837 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: Running task 1853 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1854 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1855 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_write_config)
NOTE: Running task 1857 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_write_config)
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_unpack: Started
NOTE: Running task 1890 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: Running task 1891 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: Running task 1912 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: recipe mesa-2_21.1.2-r0: task do_write_config: Succeeded
NOTE: Running task 1918 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1927 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe icu-69.1-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: Running task 1928 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Started
NOTE: recipe pango-1.48.5-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1969 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_patch)
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: Running task 1978 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2005 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_fetch)
NOTE: Running task 2006 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 2007 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 2008 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2030 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_patch)
NOTE: Running task 2034 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2042 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_write_config: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: Running task 2074 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_fetch)
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe pango-1.48.5-r0: task do_write_config: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2113 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_write_config)
NOTE: Running task 2119 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_fetch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1025 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: Running task 2125 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: Running task 2140 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
NOTE: Running task 2141 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2163 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_write_config)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Started
NOTE: Running task 2164 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_fetch: Started
NOTE: recipe freetype-2.10.4-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.40.2-r0: task do_fetch: Succeeded
NOTE: Running task 2226 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: Running task 2229 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_fetch)
NOTE: Running task 2231 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_unpack)
NOTE: Running task 2232 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 2233 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: Running task 2234 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2235 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: Running task 2258 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: Running task 2259 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 2260 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_write_config: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_fetch: Started
NOTE: Running task 2291 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.37-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_patch: Succeeded
NOTE: Running task 2317 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_unpack)
NOTE: Running task 2319 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_unpack)
NOTE: Running task 2320 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: Running task 2321 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2345 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.40.2-r0: task do_unpack: Started
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.64.2-r0: task do_fetch: Started
NOTE: recipe pango-1.48.5-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: Running task 2392 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2393 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_patch)
NOTE: recipe libepoxy-1.5.8-r0: task do_write_config: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: Running task 2405 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2433 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2458 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_generate_toolchain_file)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: Running task 2459 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2473 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_unpack: Succeeded
NOTE: Running task 2474 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: Running task 2478 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_patch)
NOTE: recipe libepoxy-1.5.8-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2488 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_patch)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2489 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe libpcre2-10.37-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2531 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: Running task 2532 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_write_config)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: Running task 2552 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2584 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_unpack: Started
NOTE: Running task 2600 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe pango-1.48.5-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: Running task 2642 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.48.5-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2663 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2741 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_patch: Succeeded
NOTE: Running task 2768 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.64.2-r0: task do_write_config: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: Running task 2809 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2810 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2828 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2829 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_patch: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_unpack: Succeeded
NOTE: Running task 2878 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2879 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2884 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_patch)
NOTE: recipe pango-1.48.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.37-r0: task do_unpack: Succeeded
NOTE: Running task 2924 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2925 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_configure)
NOTE: Running task 2926 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2927 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2928 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2929 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.64.2-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2930 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Started
NOTE: recipe libpcre2-10.37-r0: task do_patch: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2936 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2937 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe vte-0.64.2-r0: task do_patch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2938 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2939 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_populate_lic)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: Running task 2940 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.64.2-r0: task do_populate_lic: Started
NOTE: Running task 2941 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 9e397671ca5acfc4092db2f9c2c8a6017cbba86bcd411dd00a9224c0d6b6b8bb
NOTE: recipe libpcre2-10.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2960 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_configure)
NOTE: recipe vte-0.64.2-r0: task do_populate_lic: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_populate_lic unihash changed to a3471ed877ea11faf4d12fd062ff60ceb99c14675f2c424c7391311dd653dc5d
NOTE: recipe vte-0.64.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Succeeded
NOTE: Running task 2961 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-69.1-r0: task do_unpack: Succeeded
NOTE: Running task 2962 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_patch)
NOTE: recipe libpcre2-10.37-r0: task do_configure: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2963 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_patch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-69.1-r0: task do_patch: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2964 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-69.1-r0: task do_patch: Succeeded
NOTE: Running task 2965 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_make_icudata)
NOTE: Running task 2966 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_make_icudata: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2967 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2968 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_make_icudata: Succeeded
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1028 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2973 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 2974 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 9d54ef88276fc72f756f18c26e97789228fcaaaeaf9de3ee8aca2d8ba0923b26
NOTE: Running task 2988 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_configure: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: Running task 2990 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2991 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_compile)
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2992 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_patch)
NOTE: Running task 2993 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1031 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1032 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_21.1.2-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 2998 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Succeeded
NOTE: Running task 2999 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 3000 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1034 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 1035 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-src went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 3006 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-dbg went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
NOTE: Running task 3007 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcrecpp went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcreposix went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package pcregrep went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package pcregrep-doc went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package pcretest went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package pcretest-doc went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-ptest went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-staticdev went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-dev went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-doc went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-locale went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1037 of 1036 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3037 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 3051 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3112 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 3113 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Succeeded
NOTE: Running task 3114 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_populate_sysroot)
NOTE: Running task 3115 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3116 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3117 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Succeeded
NOTE: Running task 3118 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_packagedata)
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 3119 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3120 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package_write_rpm)
NOTE: recipe mesa-2_21.1.2-r0: task do_configure: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3121 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_compile)
NOTE: Running task 3122 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe icu-69.1-r0: task do_configure: Succeeded
NOTE: Running task 3123 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 3124 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 3125 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe mesa-2_21.1.2-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_compile: Started
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 3126 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 3127 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3128 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 3129 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 3130 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3131 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 3132 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3133 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 3134 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: Running task 3135 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3136 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3137 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 3138 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 3139 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 3140 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libpcre2-10.37-r0: task do_configure: Succeeded
NOTE: Running task 3141 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3142 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3143 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3144 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3145 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libpcre2-10.37-r0: task do_compile: Started
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3146 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_configure)
NOTE: recipe freetype-2.10.4-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 3147 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: Running task 3148 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3149 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: Running task 3150 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3151 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3152 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3153 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: Running task 3154 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: Running task 3155 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: Running task 3156 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Started
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-src went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dbg went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-staticdev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-doc went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-locale went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3157 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3158 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3159 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3160 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3161 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: Running task 3162 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3163 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3164 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.37-r0: task do_compile: Succeeded
NOTE: Running task 3165 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_install)
NOTE: recipe libpcre2-10.37-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3166 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe libpcre2-10.37-r0: task do_install: Succeeded
NOTE: Running task 3167 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_package)
NOTE: Running task 3168 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_populate_sysroot)
NOTE: recipe libpcre2-10.37-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe libpcre2-10.37-r0: task do_package: Started
NOTE: recipe freetype-2.10.4-r0: task do_configure: Succeeded
NOTE: Running task 3169 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_compile)
NOTE: recipe freetype-2.10.4-r0: task do_compile: Started
NOTE: recipe libpcre2-10.37-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_package: Succeeded
NOTE: Running task 3170 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_packagedata)
NOTE: recipe libpcre2-10.37-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3171 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libpcre2-10.37-r0: task do_packagedata: Succeeded
NOTE: Running task 3172 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_package_write_rpm)
NOTE: recipe libpcre2-10.37-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3173 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3174 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3175 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe freetype-2.10.4-r0: task do_compile: Succeeded
NOTE: Running task 3176 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe freetype-2.10.4-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3177 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_install: Succeeded
NOTE: Running task 3178 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot)
NOTE: Running task 3179 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Started
NOTE: recipe libpcre2-10.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3180 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3181 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3182 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: Running task 3183 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_configure)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: Running task 3184 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile_ptest_base)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3185 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3186 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package: Succeeded
NOTE: Running task 3187 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3188 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_configure: Succeeded
NOTE: Running task 3189 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_compile)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Succeeded
NOTE: Running task 3190 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3191 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot)
NOTE: Running task 3192 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_compile: Succeeded
NOTE: Running task 3193 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_install)
NOTE: recipe mesa-2_21.1.2-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_compile: Succeeded
NOTE: Running task 3194 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_install)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_install: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_install: Succeeded
NOTE: Running task 3195 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_populate_sysroot)
NOTE: Running task 3196 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_package)
NOTE: recipe mesa-2_21.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_package: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3197 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3198 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Succeeded
NOTE: Running task 3199 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.8-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_install: Succeeded
NOTE: Running task 3200 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_populate_sysroot)
NOTE: Running task 3201 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_package)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_configure: Succeeded
NOTE: Running task 3202 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_compile)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3203 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.8-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3204 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3205 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3206 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_package: Succeeded
NOTE: Running task 3207 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 3208 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe icu-69.1-r0: task do_compile: Succeeded
NOTE: Running task 3209 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3210 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe icu-69.1-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3211 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3212 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 3213 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_package: Succeeded
NOTE: Running task 3214 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_packagedata)
NOTE: recipe icu-69.1-r0: task do_install: Succeeded
NOTE: Running task 3215 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot)
NOTE: Running task 3216 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package)
NOTE: recipe mesa-2_21.1.2-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_package: Started
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3217 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3218 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe mesa-2_21.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3219 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 3220 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 3221 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 3222 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3223 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3224 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3225 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3226 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 3227 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3229 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe icu-69.1-r0: task do_package: Succeeded
NOTE: Running task 3231 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata)
NOTE: recipe icu-69.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3232 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3233 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3234 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3235 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3236 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_compile: Succeeded
NOTE: Running task 3237 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_install)
NOTE: recipe libepoxy-1.5.8-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 3238 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_populate_sysroot)
NOTE: Running task 3239 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_package)
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_package: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3240 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3241 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 3242 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3243 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3244 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3245 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 3246 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 3247 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3248 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3249 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 3250 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3251 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 3252 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_compile)
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 3253 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_install)
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 3254 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_populate_sysroot)
NOTE: Running task 3255 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package)
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3256 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3257 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_configure)
NOTE: recipe pango-1.48.5-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Succeeded
NOTE: Running task 3258 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3259 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.5-r0: task do_configure: Succeeded
NOTE: Running task 3260 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3261 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_compile)
NOTE: recipe pango-1.48.5-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_compile: Succeeded
NOTE: Running task 3262 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3263 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_install)
NOTE: recipe pango-1.48.5-r0: task do_install: Started
NOTE: recipe pango-1.48.5-r0: task do_install: Succeeded
NOTE: Running task 3264 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3265 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_populate_sysroot)
NOTE: Running task 3266 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_package)
NOTE: recipe pango-1.48.5-r0: task do_package: Started
NOTE: recipe pango-1.48.5-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3267 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3268 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_configure)
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Started
NOTE: recipe pango-1.48.5-r0: task do_package: Succeeded
NOTE: Running task 3269 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_packagedata)
NOTE: recipe pango-1.48.5-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3270 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.5-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Succeeded
NOTE: Running task 3271 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_compile)
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Succeeded
NOTE: Running task 3272 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_install)
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Succeeded
NOTE: Running task 3273 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package)
NOTE: Running task 3274 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3275 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.64.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.64.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3280 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_configure)
NOTE: recipe vte-0.64.2-r0: task do_configure: Started
NOTE: recipe vte-0.64.2-r0: task do_configure: Succeeded
NOTE: Running task 3281 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_compile)
NOTE: recipe vte-0.64.2-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Succeeded
NOTE: Running task 3282 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Succeeded
NOTE: Running task 3286 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.64.2-r0: task do_compile: Succeeded
NOTE: Running task 3287 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_install)
NOTE: recipe vte-0.64.2-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_install: Succeeded
NOTE: Running task 3288 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_package)
NOTE: Running task 3289 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_populate_sysroot)
NOTE: recipe vte-0.64.2-r0: task do_package: Started
NOTE: recipe vte-0.64.2-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.64.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_package: Succeeded
NOTE: Running task 3290 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_packagedata)
NOTE: recipe vte-0.64.2-r0: task do_packagedata: Started
NOTE: recipe vte-0.64.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3291 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_package_write_rpm)
NOTE: Running task 3292 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_package_qa)
NOTE: recipe vte-0.64.2-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.64.2-r0: task do_package_qa: Started
NOTE: recipe vte-0.64.2-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3293 of 3293 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3293 tasks of which 2977 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 56 ERROR messages shown, returning a non-zero exit code.

--===============3082520889574551238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1457 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (817 cached, 1 parsed). 1455 targets, 32 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-2b5498936781458375de4362be7cfdeb3936c950"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2b5498936781458375de4362be7cfdeb3936c950"
workspace            = "master:f585bf4c959ae0b52be8462d278cd289db79b813"

Initialising tasks...done.
Sstate summary: Wanted 200 Local 73 Network 0 Missed 127 Current 840 (36% match, 87% complete)
Removing 10 stale sstate objects for arch core2-64...done.
Removing 7 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 843 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 844 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 845 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 855 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 862 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 867 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 869 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 871 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 879 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 902 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 905 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 908 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 909 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 910 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 911 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1001 of 1040 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-native-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1002 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1003 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 1004 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cantarell-fonts-0.301-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1005 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1007 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1014 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1019 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1020 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1021 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-native-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1022 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb:do_packagedata_setscene)
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-src went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-dbg went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3 went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-dev went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-doc went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-staticdev went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
ERROR: sqlite3-3_3.35.5-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3 went backwards which would break package feeds (from 3:3.36.0-r0 to 3:3.35.5-r0) [version-going-backwards]
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1026 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1151 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1029 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: Running task 1317 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 1327 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_fetch)
NOTE: Running task 1360 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: Running task 1424 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_fetch)
NOTE: Running task 1462 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 1475 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1503 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_fetch)
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Started
NOTE: Running task 1550 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: Running task 1561 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: Running task 1562 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: Running task 1571 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_unpack)
NOTE: Running task 1577 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 1600 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: Running task 1608 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_fetch)
NOTE: Running task 1609 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1610 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1619 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_fetch)
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_fetch: Started
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: Running task 1681 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_write_config)
NOTE: Running task 1688 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Started
NOTE: Running task 1697 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: Running task 1698 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_21.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1714 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_unpack)
NOTE: Running task 1715 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: Running task 1716 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 1717 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_unpack)
NOTE: Running task 1725 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: recipe icu-69.1-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Started
NOTE: Running task 1760 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe pango-1.48.5-r0: task do_fetch: Started
NOTE: Running task 1795 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1807 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 1819 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: Running task 1820 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: Running task 1835 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_unpack)
NOTE: Running task 1839 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: Running task 1853 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.5-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_write_config: Started
NOTE: Running task 1854 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_unpack)
NOTE: Running task 1870 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_write_config)
NOTE: Running task 1871 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1872 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 1873 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: Running task 1875 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_write_config)
NOTE: recipe mesa-2_21.1.2-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1897 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_unpack: Started
NOTE: Running task 1900 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1915 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: Running task 1936 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1942 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: recipe pango-1.48.5-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Started
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Started
NOTE: recipe pango-1.48.5-r0: task do_write_config: Started
NOTE: Running task 1999 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: Running task 2014 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2025 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_patch)
NOTE: Running task 2028 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 2029 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_fetch)
NOTE: Running task 2030 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 2031 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: Running task 2056 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: recipe pango-1.48.5-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: Running task 2085 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2092 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2093 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: Running task 2098 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_fetch)
NOTE: Running task 2100 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: Running task 2138 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_write_config)
NOTE: Running task 2144 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_fetch)
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: Running task 2170 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_fetch: Started
NOTE: Running task 2186 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_write_config)
NOTE: Running task 2187 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_fetch: Succeeded
NOTE: Running task 2229 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
NOTE: Running task 2251 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 2252 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Started
NOTE: Running task 2254 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_fetch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: Running task 2272 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_unpack)
NOTE: Running task 2273 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 2274 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: recipe freetype-2.10.4-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: Running task 2275 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: Running task 2277 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Started
NOTE: Running task 2287 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: Running task 2288 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: recipe libpcre2-10.37-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_write_config: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: Running task 2314 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_unpack)
NOTE: recipe libpcre2-10.37-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: Running task 2322 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2323 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_write_config: Started
NOTE: recipe pango-1.48.5-r0: task do_unpack: Succeeded
NOTE: Running task 2324 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: Running task 2327 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2338 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.8-r0: task do_write_config: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: Running task 2373 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_write_config: Succeeded
NOTE: Running task 2379 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2380 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2381 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: Running task 2382 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2383 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe vte-0.64.2-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe vte-0.64.2-r0: task do_fetch: Succeeded
NOTE: Running task 2401 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_unpack)
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2427 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2428 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2440 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: Running task 2441 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_patch)
NOTE: recipe libpcre2-10.37-r0: task do_unpack: Started
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_unpack: Succeeded
NOTE: Running task 2458 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2470 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2496 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe pango-1.48.5-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2508 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe vte-0.64.2-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2548 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2549 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_patch: Started
NOTE: Running task 2561 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2562 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_write_config)
NOTE: Running task 2568 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_generate_toolchain_file)
NOTE: Running task 2569 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.8-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.40.2-r0: task do_patch: Succeeded
NOTE: Running task 2600 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libpcre2-10.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: Running task 2677 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.48.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2717 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2742 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe vte-0.64.2-r0: task do_write_config: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2743 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_patch: Succeeded
NOTE: Running task 2754 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: recipe vte-0.64.2-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.40.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2769 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2790 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe vte-0.64.2-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: Running task 2802 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 1032 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to f3390a2fe49bc60b86c9dac8cfaf80751b5dfa0aa5f45e3bfe72541e1a12a8f6
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.37-r0: task do_unpack: Succeeded
NOTE: Running task 2898 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2904 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_patch: Started
NOTE: recipe pango-1.48.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.40.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2975 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_configure)
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2976 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_patch: Started
NOTE: recipe vte-0.64.2-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2977 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2978 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_populate_lic)
NOTE: recipe libpcre2-10.37-r0: task do_patch: Succeeded
NOTE: Running task 2979 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 2980 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2981 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe vte-0.64.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.64.2-r0: task do_populate_lic: Started
NOTE: recipe libpcre2-10.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2982 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1034 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1035 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe vte-0.64.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_populate_lic unihash changed to a3471ed877ea11faf4d12fd062ff60ceb99c14675f2c424c7391311dd653dc5d
NOTE: recipe vte-0.64.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Succeeded
NOTE: Running task 2987 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre2-10.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2988 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_configure)
NOTE: recipe icu-69.1-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2989 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_patch)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2990 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_patch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.37-r0: task do_configure: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_patch: Started
NOTE: recipe icu-69.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f09301e6f4ce77a3ef6061076714e0d150ee8ee0561dd4f291f3fc86c68e279b
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3005 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_patch: Succeeded
NOTE: Running task 3006 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_make_icudata)
NOTE: Running task 3007 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_patch: Succeeded
NOTE: Running task 3008 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: Running task 3009 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-69.1-r0: task do_make_icudata: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-69.1-r0: task do_make_icudata: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3010 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_configure)
NOTE: recipe mesa-2_21.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3011 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_configure)
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 3012 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 3013 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_21.1.2-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Succeeded
NOTE: Running task 3014 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_patch)
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3015 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_compile)
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 3016 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1038 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 1039 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-src went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-dbg went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcrecpp went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcreposix went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Succeeded
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package pcregrep went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
NOTE: Running task 3022 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_deploy_source_date_epoch)
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package pcregrep-doc went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package pcretest went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package pcretest-doc went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-ptest went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-staticdev went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-dev went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-doc went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre-locale went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
ERROR: libpcre-8.44-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre went backwards which would break package feeds (from 0:8.45-r0 to 0:8.44-r0) [version-going-backwards]
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1041 of 1040 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3052 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 3066 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 3127 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 3128 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: Running task 3129 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 3130 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 3131 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3132 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3133 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3134 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Succeeded
NOTE: Running task 3135 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_populate_sysroot)
NOTE: Running task 3136 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-69.1-r0: task do_configure: Succeeded
NOTE: Running task 3137 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_compile)
NOTE: recipe icu-69.1-r0: task do_compile: Started
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 3138 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Succeeded
NOTE: Running task 3139 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_packagedata)
NOTE: recipe mesa-2_21.1.2-r0: task do_configure: Succeeded
NOTE: Running task 3140 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 3141 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 3142 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3143 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3144 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package_write_rpm)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3145 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 3146 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 3147 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3148 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 3149 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3150 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 3151 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: Running task 3152 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3153 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 3154 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: Running task 3155 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe libpcre2-10.37-r0: task do_configure: Succeeded
NOTE: Running task 3156 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 3157 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 3158 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3159 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 3160 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3161 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3162 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3163 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 3164 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: Running task 3165 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3166 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: Running task 3167 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 3168 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3169 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3170 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-src went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dbg went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-staticdev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-doc went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-locale went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3171 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3172 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3173 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_configure: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: Running task 3174 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3175 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3176 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: Running task 3177 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: Running task 3178 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3179 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3180 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: Running task 3181 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3182 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe libpcre2-10.37-r0: task do_compile: Succeeded
NOTE: Running task 3183 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_install)
NOTE: recipe libpcre2-10.37-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3184 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe libpcre2-10.37-r0: task do_install: Succeeded
NOTE: Running task 3185 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_package)
NOTE: Running task 3186 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_populate_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe libpcre2-10.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.37-r0: task do_package: Started
NOTE: recipe libpcre2-10.37-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_package: Succeeded
NOTE: Running task 3187 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_packagedata)
NOTE: recipe libpcre2-10.37-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.37-r0: task do_packagedata: Succeeded
NOTE: Running task 3188 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_package_write_rpm)
NOTE: recipe libpcre2-10.37-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: Running task 3189 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Started
NOTE: recipe freetype-2.10.4-r0: task do_configure: Succeeded
NOTE: Running task 3190 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3191 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install)
NOTE: recipe freetype-2.10.4-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Started
NOTE: recipe libpcre2-10.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3192 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe freetype-2.10.4-r0: task do_compile: Succeeded
NOTE: Running task 3193 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_install)
NOTE: recipe freetype-2.10.4-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3194 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe freetype-2.10.4-r0: task do_install: Succeeded
NOTE: Running task 3195 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot)
NOTE: Running task 3196 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3197 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3198 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3199 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Succeeded
NOTE: Running task 3200 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install_ptest_base)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3201 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3202 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3203 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: Running task 3204 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3205 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3206 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3207 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Succeeded
NOTE: Running task 3208 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3209 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_configure: Succeeded
NOTE: Running task 3210 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_compile)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_compile: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Succeeded
NOTE: Running task 3211 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3212 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_compile: Succeeded
NOTE: Running task 3213 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_install)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_install: Succeeded
NOTE: Running task 3214 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_populate_sysroot)
NOTE: Running task 3215 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_package)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3216 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3217 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 3218 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3219 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_package: Succeeded
NOTE: Running task 3220 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.40.2-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_compile: Succeeded
NOTE: Running task 3221 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_install)
NOTE: recipe icu-69.1-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3222 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-core-2.40.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3223 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.2.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3224 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 3225 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-69.1-r0: task do_install: Succeeded
NOTE: Running task 3226 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot)
NOTE: Running task 3227 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package)
NOTE: recipe icu-69.1-r0: task do_package: Started
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3228 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.40.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 3229 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3230 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 3231 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 3232 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3233 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3234 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe icu-69.1-r0: task do_package: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 3235 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: Running task 3236 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3238 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3240 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3241 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3242 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3243 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3244 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3245 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3246 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_compile: Succeeded
NOTE: Running task 3247 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_install)
NOTE: recipe mesa-2_21.1.2-r0: task do_install: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_install: Succeeded
NOTE: Running task 3248 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_populate_sysroot)
NOTE: Running task 3249 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_package)
NOTE: recipe mesa-2_21.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_package: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3250 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3251 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3252 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_configure)
NOTE: recipe libepoxy-1.5.8-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3253 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_configure: Succeeded
NOTE: Running task 3254 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_compile)
NOTE: recipe libepoxy-1.5.8-r0: task do_compile: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_package: Succeeded
NOTE: Running task 3255 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_packagedata)
NOTE: recipe mesa-2_21.1.2-r0: task do_packagedata: Started
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
ERROR: mesa-2_21.1.2-r0 do_packagedata: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:21.1.3-r0 to 2:21.1.2-r0) [version-going-backwards]
NOTE: recipe mesa-2_21.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3256 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_package_write_rpm)
NOTE: recipe mesa-2_21.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_compile: Succeeded
NOTE: Running task 3257 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_install)
NOTE: recipe libepoxy-1.5.8-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 3258 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_populate_sysroot)
NOTE: Running task 3259 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_package)
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 3260 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3261 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3262 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3263 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 3264 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 3265 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3266 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3267 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 3268 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3269 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 3270 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_compile)
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 3271 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_install)
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 3272 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_populate_sysroot)
NOTE: Running task 3273 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package)
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3274 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3275 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_configure)
NOTE: recipe pango-1.48.5-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Succeeded
NOTE: Running task 3276 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3277 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.5-r0: task do_configure: Succeeded
NOTE: Running task 3278 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3279 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_compile)
NOTE: recipe pango-1.48.5-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_compile: Succeeded
NOTE: Running task 3280 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3281 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_install)
NOTE: recipe pango-1.48.5-r0: task do_install: Started
NOTE: recipe pango-1.48.5-r0: task do_install: Succeeded
NOTE: Running task 3282 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3283 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_populate_sysroot)
NOTE: Running task 3284 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_package)
NOTE: recipe pango-1.48.5-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.5-r0: task do_package: Started
NOTE: recipe pango-1.48.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3285 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3286 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_configure)
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Started
NOTE: recipe pango-1.48.5-r0: task do_package: Succeeded
NOTE: Running task 3287 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_packagedata)
NOTE: recipe pango-1.48.5-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3288 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.5-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Succeeded
NOTE: Running task 3289 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_compile)
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Succeeded
NOTE: Running task 3290 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_install)
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Succeeded
NOTE: Running task 3291 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package)
NOTE: Running task 3292 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3293 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.64.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.64.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3298 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_configure)
NOTE: recipe vte-0.64.2-r0: task do_configure: Started
NOTE: recipe vte-0.64.2-r0: task do_configure: Succeeded
NOTE: Running task 3299 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_compile)
NOTE: recipe vte-0.64.2-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Succeeded
NOTE: Running task 3300 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Succeeded
NOTE: Running task 3304 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.64.2-r0: task do_compile: Succeeded
NOTE: Running task 3305 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_install)
NOTE: recipe vte-0.64.2-r0: task do_install: Started
NOTE: recipe vte-0.64.2-r0: task do_install: Succeeded
NOTE: Running task 3306 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_package)
NOTE: Running task 3307 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_populate_sysroot)
NOTE: recipe vte-0.64.2-r0: task do_package: Started
NOTE: recipe vte-0.64.2-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.64.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_package: Succeeded
NOTE: Running task 3308 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_packagedata)
NOTE: recipe vte-0.64.2-r0: task do_packagedata: Started
NOTE: recipe vte-0.64.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3309 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_package_write_rpm)
NOTE: Running task 3310 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_package_qa)
NOTE: recipe vte-0.64.2-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.64.2-r0: task do_package_qa: Started
NOTE: recipe vte-0.64.2-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.64.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3311 of 3311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.64.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3311 tasks of which 2995 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 56 ERROR messages shown, returning a non-zero exit code.

--===============3082520889574551238==--
