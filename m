Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.2170.1622683488391003816
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 18:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4910338C08ED
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Jun 2021 01:24:48 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-tools: upgrading to 1.2.5 SUCCEEDED
Message-ID: <MADEUP.1684EE091946FDBA.31310@lists.openembedded.org>
X-Groupsio-MsgNum: 152581
Content-Type: multipart/mixed; boundary="===============7000961810849828596=="

--===============7000961810849828596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *alsa-tools* to *1.2.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-tools-upgrade-1.2.2-1.2.5.patch
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

--===============7000961810849828596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 823 .bb files complete (0 cached, 823 parsed). 1459 targets, 41 skipped, 0 masked, 0 errors.
Removing 167 recipes from the core2-32 sysroot...done.
Removing 171 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-4f45df860b6b07b73acd2ab269775e7c722526a7"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4f45df860b6b07b73acd2ab269775e7c722526a7"
workspace            = "master:9d1b332292a94cd4463f1e88dfe293847264714e"

Initialising tasks...done.
Sstate summary: Wanted 723 Local 615 Network 0 Missed 108 Current 320 (85% match, 89% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 321 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 322 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 323 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 326 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 328 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 329 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 331 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 332 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 333 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 335 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 336 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 337 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 338 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 339 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 341 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 342 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 343 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 344 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 345 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 347 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 349 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 351 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 352 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 353 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 354 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 355 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 356 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 357 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 358 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 359 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 360 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 361 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 362 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 363 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 364 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 365 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 366 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 367 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 368 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 369 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 370 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 371 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 372 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 373 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 374 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 375 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 376 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 377 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 378 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 379 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 380 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 381 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 382 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 383 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 384 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 385 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 386 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 387 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 388 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 389 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 390 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 391 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 392 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 393 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 398 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 399 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 400 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.106-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: Running setscene task 401 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 406 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 409 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 410 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 411 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_package_write_rpm_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 413 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 416 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 417 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 418 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 419 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 420 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 421 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 422 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 423 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 424 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 425 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 428 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 429 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 430 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 431 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 432 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 435 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 436 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 437 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 440 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 441 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 443 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 444 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 445 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 446 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 447 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 448 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_package_write_rpm_setscene)
NOTE: recipe mesa-2_21.1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 449 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 450 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 451 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 452 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 454 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 455 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 456 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 492 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 493 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 507 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 509 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 513 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 514 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 542 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 543 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 544 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 545 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 546 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 552 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 553 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 554 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 555 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 556 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 562 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 563 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_package_write_rpm_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 564 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 565 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 566 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm_setscene)
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 567 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_package_write_rpm_setscene)
NOTE: recipe libcap-2.49-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 568 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 569 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 570 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_deploy_setscene: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 571 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 572 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 573 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 574 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 575 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 576 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 578 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_package_write_rpm_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.49-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 583 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 686 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: Running task 689 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_fetch)
NOTE: Running task 736 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 745 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_fetch)
NOTE: Running task 779 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_fetch)
NOTE: Running task 782 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_write_config)
NOTE: Running task 793 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: Running task 804 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 805 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 806 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_fetch)
NOTE: Running task 808 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_fetch)
NOTE: Running task 843 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 894 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: Running task 912 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: Running task 913 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 914 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_unpack)
NOTE: Running task 915 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_unpack)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 916 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_write_config)
NOTE: Running task 917 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: recipe icu-69.1-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_fetch: Started
NOTE: Running task 918 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: Running task 919 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_write_config)
NOTE: recipe pango-1.48.5-r0: task do_fetch: Succeeded
NOTE: Running task 920 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: recipe icu-69.1-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 921 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_unpack)
NOTE: Running task 922 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: Running task 923 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: Running task 924 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_unpack)
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: Running task 957 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Started
NOTE: Running task 965 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running setscene task 584 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Started
NOTE: Running task 984 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_fetch)
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 994 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 995 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: recipe pango-1.48.5-r0: task do_write_config: Started
NOTE: recipe pango-1.48.5-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 996 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: Running task 997 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe pango-1.48.5-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Succeeded
NOTE: Running task 998 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: recipe icu-69.1-r0: task do_unpack: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1018 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: Running task 1029 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_fetch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: Running task 1030 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: Running task 1031 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1032 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1033 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: Running task 1034 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1035 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_unpack)
NOTE: Running task 1036 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Succeeded
NOTE: Running task 1060 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_write_config)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 585 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: Running task 1061 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1063 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_fetch)
NOTE: Running setscene task 586 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_write_config: Started
NOTE: Running setscene task 587 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 588 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Started
NOTE: Running setscene task 590 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.48.5-r0: task do_unpack: Succeeded
NOTE: Running task 1064 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1065 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_patch)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1066 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: Running task 1067 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1068 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1069 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_generate_toolchain_file)
NOTE: Running task 1070 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Succeeded
NOTE: Running task 1071 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch)
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: recipe pango-1.48.5-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe pango-1.48.5-r0: task do_patch: Succeeded
NOTE: Running task 1072 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1073 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1074 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: Running task 1075 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: recipe pango-1.48.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 591 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 592 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: Running task 1076 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1077 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: Running task 1078 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1079 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Succeeded
NOTE: Running task 1080 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-69.1-r0: task do_unpack: Succeeded
NOTE: Running task 1081 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_patch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-69.1-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_write_config: Succeeded
NOTE: Running task 1082 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1098 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1129 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_unpack)
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 593 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 594 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1130 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1137 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_fetch)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1138 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_patch: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 595 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe alsa-tools-1.2.5-r0: task do_fetch: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_fetch: Succeeded
NOTE: Running setscene task 596 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: Running setscene task 599 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 600 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 604 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 606 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: Running task 1227 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_unpack)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1453 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_unpack: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 1462 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1463 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 1468 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1470 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 625 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 634 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running task 1514 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: Running setscene task 643 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: Running task 1531 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 649 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 650 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 653 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 1537 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_unpack: Succeeded
NOTE: Running task 1562 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_patch)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_patch: Succeeded
NOTE: Running task 1563 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-69.1-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1564 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_make_icudata)
NOTE: Running task 1565 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-69.1-r0: task do_make_icudata: Started
NOTE: recipe icu-69.1-r0: task do_make_icudata: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1566 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 667 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: Running setscene task 669 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_21.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_21.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: Running setscene task 676 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 678 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 679 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 685 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1576 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: Running task 1585 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.106-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 693 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 694 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 1590 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1591 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_lic)
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 696 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1599 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_lic: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_lic unihash changed to b2bd106a905e530065f69afa39dae1766342c9390361187a1e08cb219c4f9a6c
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 715 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 719 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.106-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 725 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 726 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 730 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 734 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 738 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.106-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 740 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 741 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 743 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 744 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.106-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Succeeded
NOTE: Running task 1642 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 752 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Succeeded
NOTE: Running task 1651 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_deploy_source_date_epoch)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 772 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 783 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 792 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 793 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 794 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1716 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 796 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1721 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 801 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1730 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 806 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 807 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 809 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 810 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 814 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 815 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 816 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 817 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 818 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 819 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 820 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1740 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 824 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 826 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 828 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 830 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 832 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 833 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 834 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 836 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 841 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 842 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 843 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 844 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 845 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 846 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 847 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 848 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 849 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 850 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 851 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 852 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 853 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 854 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_packagedata_setscene)
NOTE: Running setscene task 855 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 856 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 857 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1772 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 859 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 1773 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1774 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 861 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 863 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 865 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 866 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 867 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 869 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 870 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 871 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 872 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 873 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 874 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 875 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 877 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.49-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 879 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1806 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libcap-2.49-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1812 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 881 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 882 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 883 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 884 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 885 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libcap-2.49-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1818 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 888 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 890 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1823 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 892 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 893 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 894 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 895 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 897 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 898 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 899 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 900 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 901 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 902 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 903 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 904 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 905 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 907 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 909 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 910 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 911 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 912 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 913 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 914 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 915 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 916 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 918 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 920 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 922 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 923 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 924 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 925 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 926 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 929 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 933 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 936 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 938 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1861 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1875 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 942 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 943 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 944 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 945 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 946 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 947 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 948 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 949 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 950 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 305b0a97b7eac5cae4281b81016e33d41e3ccde77a1ee1ea345ea9066b31f1eb
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1876 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 952 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 953 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 954 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 955 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 956 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 957 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 958 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 959 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 960 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 962 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 963 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 964 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 965 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 966 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 967 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 968 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 969 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 970 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 971 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 972 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 975 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 977 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 978 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 980 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 984 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 986 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 988 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 990 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 991 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 992 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 994 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 996 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 997 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 998 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 999 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1000 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1002 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1004 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1005 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1006 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1007 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1008 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1010 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1011 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1012 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1014 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1015 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1016 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1018 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1019 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1020 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1022 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1023 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1024 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1026 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1027 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1028 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1033 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1034 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1037 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1038 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1040 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1041 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1042 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1043 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1044 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2304 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2425 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2527 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2556 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2558 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2572 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2688 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2689 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2739 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3009 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 9ce9416002f72f995e0135e736f6c3ea756725ebf1b0f7734f466eaf3371e950
NOTE: Running task 3028 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3030 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3034 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_configure)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3037 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe alsa-lib-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3053 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3070 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: Running task 3111 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3112 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe icu-69.1-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3113 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3114 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3115 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 3116 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3117 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Succeeded
NOTE: Running task 3118 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 3119 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 3120 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 3121 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Succeeded
NOTE: Running task 3122 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 3123 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3124 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Succeeded
NOTE: Running task 3125 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_populate_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3126 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package)
NOTE: Running task 3127 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-69.1-r0: task do_configure: Succeeded
NOTE: Running task 3128 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_compile)
NOTE: recipe icu-69.1-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Succeeded
NOTE: Running task 3129 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3130 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package_write_rpm)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 3131 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 3132 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3133 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3134 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3135 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 3136 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 3137 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 3138 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3139 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3140 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 3141 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: Running task 3142 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3143 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3144 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3145 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3146 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3147 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: Running task 3148 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3149 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-src went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dbg went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-staticdev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-doc went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-locale went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
NOTE: recipe alsa-lib-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3150 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_compile)
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
NOTE: recipe alsa-lib-1.2.4-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3151 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Succeeded
NOTE: Running task 3152 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 3153 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Succeeded
NOTE: Running task 3154 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 3159 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 3160 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 3161 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3162 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3163 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3164 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3165 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3166 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3167 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3168 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3169 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 3170 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3172 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe alsa-lib-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3174 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_install)
NOTE: recipe alsa-lib-1.2.4-r0: task do_install: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3175 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3176 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe alsa-lib-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3177 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package)
NOTE: Running task 3178 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_populate_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Succeeded
NOTE: Running task 3179 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_install)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Succeeded
NOTE: Running task 3180 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot)
NOTE: Running task 3181 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3182 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3183 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3184 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3185 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3186 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package_write_rpm)
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3187 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_configure)
NOTE: Running task 3188 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3189 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Succeeded
NOTE: Running task 3190 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3191 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3192 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_configure: Succeeded
NOTE: Running task 3193 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_compile)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3194 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: Running task 3195 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3196 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3197 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3198 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3199 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3200 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-69.1-r0: task do_compile: Succeeded
NOTE: Running task 3201 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_install)
NOTE: recipe icu-69.1-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3202 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3203 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3204 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: Running task 3205 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_compile: Succeeded
NOTE: Running task 3206 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_install)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3207 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_install: Succeeded
NOTE: Running task 3208 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_populate_sysroot)
NOTE: Running task 3209 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_package)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3210 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3211 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3212 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: Running task 3213 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3214 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package: Succeeded
NOTE: Running task 3215 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3216 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3217 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3218 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3219 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 3220 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-69.1-r0: task do_install: Succeeded
NOTE: Running task 3221 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot)
NOTE: Running task 3222 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package)
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3223 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Succeeded
NOTE: Running task 3224 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install_ptest_base)
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3225 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot)
NOTE: Running task 3226 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Started
NOTE: Running task 3227 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3228 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe icu-69.1-r0: task do_package: Succeeded
NOTE: Running task 3229 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata)
NOTE: recipe icu-69.1-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3230 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Succeeded
NOTE: Running task 3231 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3232 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3233 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 3234 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 3235 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3236 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3237 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 3238 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3239 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 3240 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_compile)
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 3241 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_install)
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 3242 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_populate_sysroot)
NOTE: Running task 3243 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package)
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3244 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3245 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_configure)
NOTE: recipe pango-1.48.5-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Succeeded
NOTE: Running task 3246 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3247 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.5-r0: task do_configure: Succeeded
NOTE: Running task 3248 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3249 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_compile)
NOTE: recipe pango-1.48.5-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_compile: Succeeded
NOTE: Running task 3250 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3251 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_install)
NOTE: recipe pango-1.48.5-r0: task do_install: Started
NOTE: recipe pango-1.48.5-r0: task do_install: Succeeded
NOTE: Running task 3252 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3253 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_populate_sysroot)
NOTE: Running task 3254 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_package)
NOTE: recipe pango-1.48.5-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.5-r0: task do_package: Started
NOTE: recipe pango-1.48.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3255 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3256 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_configure)
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Started
NOTE: recipe pango-1.48.5-r0: task do_package: Succeeded
NOTE: Running task 3257 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_packagedata)
NOTE: recipe pango-1.48.5-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3258 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.5-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Succeeded
NOTE: Running task 3259 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_compile)
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Succeeded
NOTE: Running task 3260 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_install)
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Succeeded
NOTE: Running task 3261 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package)
NOTE: Running task 3262 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3263 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-tools-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3268 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_configure)
NOTE: recipe alsa-tools-1.2.5-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Succeeded
NOTE: Running task 3269 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Succeeded
NOTE: Running task 3273 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3274 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_compile)
NOTE: recipe alsa-tools-1.2.5-r0: task do_compile: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3275 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_install)
NOTE: recipe alsa-tools-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3276 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_package)
NOTE: Running task 3277 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_sysroot)
NOTE: recipe alsa-tools-1.2.5-r0: task do_package: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3278 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-tools-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3279 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_package_write_rpm)
NOTE: Running task 3280 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_package_qa)
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_qa: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_qa: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3281 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_build)
NOTE: Tasks Summary: Attempted 3281 tasks of which 3002 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 18 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============7000961810849828596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/alsa-tools/alsa-tools-dbg: PKGV changed from 1.2.2 [default] to 1.2.5 [default]
packages/core2-32-poky-linux/alsa-tools/alsa-tools-dbg: PV changed from "1.2.2" to "1.2.5"
packages/core2-32-poky-linux/alsa-tools/alsa-tools-dev: PKGV changed from 1.2.2 [default] to 1.2.5 [default]
packages/core2-32-poky-linux/alsa-tools/alsa-tools-dev: PV changed from "1.2.2" to "1.2.5"
packages/core2-32-poky-linux/alsa-tools/alsa-tools-doc: PKGV changed from 1.2.2 [default] to 1.2.5 [default]
packages/core2-32-poky-linux/alsa-tools/alsa-tools-doc: PV changed from "1.2.2" to "1.2.5"
packages/core2-32-poky-linux/alsa-tools/alsa-tools-locale: PKGV changed from 1.2.2 [default] to 1.2.5 [default]
packages/core2-32-poky-linux/alsa-tools/alsa-tools-locale: PV changed from "1.2.2" to "1.2.5"
packages/core2-32-poky-linux/alsa-tools/alsa-tools-src: PKGV changed from 1.2.2 [default] to 1.2.5 [default]
packages/core2-32-poky-linux/alsa-tools/alsa-tools-src: PV changed from "1.2.2" to "1.2.5"
packages/core2-32-poky-linux/alsa-tools/alsa-tools-staticdev: PKGV changed from 1.2.2 [default] to 1.2.5 [default]
packages/core2-32-poky-linux/alsa-tools/alsa-tools-staticdev: PV changed from "1.2.2" to "1.2.5"
packages/core2-32-poky-linux/alsa-tools/alsa-tools: PKGV changed from 1.2.2 [default] to 1.2.5 [default]
packages/core2-32-poky-linux/alsa-tools/alsa-tools: PV changed from "1.2.2" to "1.2.5"
packages/core2-32-poky-linux/alsa-tools: PV changed from "1.2.2" to "1.2.5"
packages/core2-32-poky-linux/alsa-tools: PKGV changed from 1.2.2 [default] to 1.2.5 [default]
packages/core2-32-poky-linux/alsa-tools: SRC_URI changed from "https://www.alsa-project.org/files/pub/tools/alsa-tools-1.2.2.tar.bz2" to "https://www.alsa-project.org/files/pub/tools/alsa-tools-1.2.5.tar.bz2"

--===============7000961810849828596==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-alsa-tools-upgrade-1.2.2-1.2.5.patch"

From 7f301a292dc408a95f05f40e2ea4ee15e1b526de Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Wed, 2 Jun 2021 23:04:30 +0000
Subject: [PATCH] alsa-tools: upgrade 1.2.2 -> 1.2.5

---
 .../alsa/{alsa-tools_1.2.2.bb => alsa-tools_1.2.5.bb}          | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.2.2.bb => alsa-tools_1.2.5.bb} (95%)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.2.2.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb
similarity index 95%
rename from meta/recipes-multimedia/alsa/alsa-tools_1.2.2.bb
rename to meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb
index 0a25d809b0..8f9c77e4fc 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.2.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb
@@ -14,8 +14,7 @@ LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=59530bdf33659b29e73d4adb9f9f65
 
 SRC_URI = "https://www.alsa-project.org/files/pub/tools/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "4e6187d2c3a8c73a9d75d66a72faed27"
-SRC_URI[sha256sum] = "bfd3c7aae1289269605d3da02279159b10e3dabdd31e658cbceaa30170957349"
+SRC_URI[sha256sum] = "35a71027a01f4d7de4722e223520e940de68b3c570b6c671691567ae28f9893e"
 
 inherit autotools-brokensep pkgconfig
 # brokensep as as10k1 (and probably more) fail out of tree
-- 
2.17.1


--===============7000961810849828596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 823 .bb files complete (0 cached, 823 parsed). 1459 targets, 49 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-4f45df860b6b07b73acd2ab269775e7c722526a7"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4f45df860b6b07b73acd2ab269775e7c722526a7"
workspace            = "master:9d1b332292a94cd4463f1e88dfe293847264714e"

Initialising tasks...done.
Sstate summary: Wanted 112 Local 5 Network 0 Missed 107 Current 916 (4% match, 89% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 924 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 925 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 931 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: Running setscene task 932 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1109 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1296 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: Running task 1311 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_fetch)
NOTE: Running task 1413 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1448 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_fetch)
NOTE: Running task 1506 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_fetch)
NOTE: Running task 1507 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_write_config)
NOTE: Running task 1524 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: Running task 1556 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1557 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_fetch)
NOTE: Running task 1558 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1567 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Started
NOTE: Running task 1590 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: Running task 1591 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Succeeded
NOTE: Running task 1592 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_unpack)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Started
NOTE: Running task 1675 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1716 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 1717 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_unpack)
NOTE: Running task 1737 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Started
NOTE: recipe icu-69.1-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Started
NOTE: Running task 1784 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: recipe icu-69.1-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: recipe pango-1.48.5-r0: task do_fetch: Started
NOTE: Running task 1794 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_unpack)
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: Running task 1795 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: Running task 1810 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1811 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: Running task 1812 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_unpack)
NOTE: Running task 1813 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: Running task 1825 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_write_config)
NOTE: Running task 1826 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1827 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.5-r0: task do_fetch: Succeeded
NOTE: Running task 1828 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_unpack)
NOTE: Running task 1832 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_write_config)
NOTE: Running task 1865 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: Running task 1885 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: Running task 1906 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: Running task 1935 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: Running task 1936 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: Running task 1959 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_fetch)
NOTE: recipe icu-69.1-r0: task do_unpack: Started
NOTE: Running task 1990 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1991 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 1992 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 2018 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: Running task 2059 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_fetch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe pango-1.48.5-r0: task do_unpack: Started
NOTE: recipe pango-1.48.5-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: Running task 2098 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_write_config)
NOTE: Running task 2104 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_fetch)
NOTE: Running task 2149 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2219 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: recipe pango-1.48.5-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: Running task 2248 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: Running task 2282 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2328 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: Running task 2329 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: Running task 2357 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 2504 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: Running task 2505 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 2506 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.4-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2727 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_unpack)
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Succeeded
NOTE: Running task 2744 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 2745 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-tools-1.2.5-r0: task do_fetch: Started
NOTE: Running task 2746 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: Running task 2772 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2798 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_unpack)
NOTE: Running task 2799 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_write_config: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 2889 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_unpack)
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: Running task 2927 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: Running task 2928 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: Running task 2929 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 2930 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 2931 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2932 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: Running task 2933 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2934 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: Running task 2935 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: Running task 2936 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_unpack: Succeeded
NOTE: Running task 2937 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_patch)
NOTE: recipe pango-1.48.5-r0: task do_unpack: Succeeded
NOTE: Running task 2938 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_patch)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2939 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Succeeded
NOTE: Running task 2940 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2941 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_generate_toolchain_file)
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 2942 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2943 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_patch: Started
NOTE: recipe pango-1.48.5-r0: task do_patch: Started
NOTE: Running task 2944 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2945 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2946 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_patch: Succeeded
NOTE: Running task 2947 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.48.5-r0: task do_patch: Succeeded
NOTE: Running task 2948 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Started
NOTE: Running task 2949 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2950 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: Running task 2951 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2952 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_patch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2953 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2954 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2955 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_configure)
NOTE: Running task 2956 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.48.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: Running task 2957 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 7353962c5995eb43ce6b728b8435cccccd735093aa09eb01718807cb5c880526
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2976 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2981 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 2982 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: Running task 2983 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2995 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: Running task 2999 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_configure)
NOTE: recipe alsa-tools-1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 3027 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3028 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_lic)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_lic: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3029 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 3030 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: Running task 3031 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Succeeded
NOTE: Running task 3032 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_lic unihash changed to b2bd106a905e530065f69afa39dae1766342c9390361187a1e08cb219c4f9a6c
NOTE: recipe alsa-tools-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-69.1-r0: task do_unpack: Succeeded
NOTE: Running task 3033 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_patch)
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe icu-69.1-r0: task do_patch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-69.1-r0: task do_patch: Succeeded
NOTE: Running task 3034 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_make_icudata)
NOTE: Running task 3035 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3036 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-69.1-r0: task do_make_icudata: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe icu-69.1-r0: task do_make_icudata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to a89ab88ca1e7c5af0c37a9e8742dc12cbb16ff280c36ee341d0e4d71c92e0af4
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 3043 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_patch)
NOTE: Running task 3064 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3072 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3081 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_configure)
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-69.1-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Succeeded
NOTE: Running task 3082 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3083 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_configure)
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 3084 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3085 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 3086 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 3087 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 3088 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Succeeded
NOTE: Running task 3089 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3090 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 3091 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Succeeded
NOTE: Running task 3092 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_populate_sysroot)
NOTE: Running task 3093 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Started
NOTE: Running task 3094 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Succeeded
NOTE: Running task 3095 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3096 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 3097 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe icu-69.1-r0: task do_configure: Succeeded
NOTE: Running task 3098 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: recipe icu-69.1-r0: task do_compile: Started
NOTE: Running task 3099 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 3100 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 3101 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: Running task 3102 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 3103 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: Running task 3104 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3105 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3106 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3107 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3108 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 3109 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 3110 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3111 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3112 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: Running task 3113 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3114 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3115 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.4-r0: task do_compile: Started
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-src went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dbg went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-staticdev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3116 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-doc went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-locale went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3117 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3118 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 3119 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3120 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 3121 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3122 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3123 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3124 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe alsa-lib-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3125 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_install: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 3126 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 3127 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3128 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3129 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3130 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package)
NOTE: Running task 3131 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_populate_sysroot)
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3132 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3133 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3134 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 3135 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3136 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3138 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3140 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Succeeded
NOTE: Running task 3141 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_install)
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Started
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-src went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-dbg went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-server went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-conf went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package libatopology went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-staticdev went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-dev went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-doc went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-locale went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3142 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package_write_rpm)
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Succeeded
NOTE: Running task 3143 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot)
NOTE: Running task 3144 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3145 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3146 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3147 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3148 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3149 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Succeeded
NOTE: Running task 3150 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3151 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3152 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3153 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3154 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_configure: Succeeded
NOTE: Running task 3155 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_compile)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: Running task 3156 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3157 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3158 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3159 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3160 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3161 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3162 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3163 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_compile: Succeeded
NOTE: Running task 3164 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_install)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3165 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3166 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_install: Succeeded
NOTE: Running task 3167 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_populate_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: Running task 3168 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile_ptest_base)
NOTE: Running task 3169 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_package)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3170 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3171 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_compile: Succeeded
NOTE: Running task 3172 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_install)
NOTE: recipe icu-69.1-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3173 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3174 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_install: Succeeded
NOTE: Running task 3175 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot)
NOTE: Running task 3176 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package)
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Succeeded
NOTE: Running task 3177 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: Running task 3178 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install_ptest_base)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package: Succeeded
NOTE: Running task 3179 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3180 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot)
NOTE: Running task 3181 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3182 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3183 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3184 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3185 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: Running task 3186 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3187 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3188 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_package: Succeeded
NOTE: Running task 3189 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata)
NOTE: recipe icu-69.1-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3190 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Succeeded
NOTE: Running task 3191 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3192 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Started
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3193 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3194 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 3195 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 3196 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3197 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3198 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 3199 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3200 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 3201 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_compile)
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 3202 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_install)
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 3203 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_populate_sysroot)
NOTE: Running task 3204 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package)
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3205 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3206 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_configure)
NOTE: recipe pango-1.48.5-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Succeeded
NOTE: Running task 3207 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3208 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.5-r0: task do_configure: Succeeded
NOTE: Running task 3209 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3210 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_compile)
NOTE: recipe pango-1.48.5-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_compile: Succeeded
NOTE: Running task 3211 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3212 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_install)
NOTE: recipe pango-1.48.5-r0: task do_install: Started
NOTE: recipe pango-1.48.5-r0: task do_install: Succeeded
NOTE: Running task 3213 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3214 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_populate_sysroot)
NOTE: Running task 3215 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_package)
NOTE: recipe pango-1.48.5-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.5-r0: task do_package: Started
NOTE: recipe pango-1.48.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3216 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3217 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_configure)
NOTE: recipe pango-1.48.5-r0: task do_package: Succeeded
NOTE: Running task 3218 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Started
NOTE: recipe pango-1.48.5-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3219 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.5-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Succeeded
NOTE: Running task 3220 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_compile)
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Succeeded
NOTE: Running task 3221 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_install)
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Succeeded
NOTE: Running task 3222 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package)
NOTE: Running task 3223 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3224 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-tools-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3229 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_configure)
NOTE: recipe alsa-tools-1.2.5-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Succeeded
NOTE: Running task 3230 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Succeeded
NOTE: Running task 3234 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3235 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_compile)
NOTE: recipe alsa-tools-1.2.5-r0: task do_compile: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3236 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_install)
NOTE: recipe alsa-tools-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3237 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_package)
NOTE: Running task 3238 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_sysroot)
NOTE: recipe alsa-tools-1.2.5-r0: task do_package: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3239 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-tools-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3240 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_package_write_rpm)
NOTE: Running task 3241 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_package_qa)
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_qa: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_qa: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3242 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_build)
NOTE: Tasks Summary: Attempted 3242 tasks of which 2977 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 17 ERROR messages shown, returning a non-zero exit code.

--===============7000961810849828596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 823 .bb files complete (0 cached, 823 parsed). 1459 targets, 58 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-4f45df860b6b07b73acd2ab269775e7c722526a7"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4f45df860b6b07b73acd2ab269775e7c722526a7"
workspace            = "master:9d1b332292a94cd4463f1e88dfe293847264714e"

Initialising tasks...done.
Sstate summary: Wanted 112 Local 5 Network 0 Missed 107 Current 916 (4% match, 89% complete)
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 924 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 925 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 931 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: Running setscene task 932 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1110 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1296 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: Running task 1311 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_fetch)
NOTE: Running task 1413 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1448 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_fetch)
NOTE: Running task 1506 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_fetch)
NOTE: Running task 1507 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_write_config)
NOTE: Running task 1524 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: Running task 1556 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_fetch)
NOTE: Running task 1557 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1558 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1567 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Started
NOTE: Running task 1654 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: Running task 1655 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1674 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Succeeded
NOTE: Running task 1675 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_unpack)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1751 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_unpack)
NOTE: Running task 1752 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1753 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: recipe icu-69.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Started
NOTE: Running task 1784 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: Running task 1819 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_write_config)
NOTE: Running task 1820 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1824 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_write_config)
NOTE: recipe icu-69.1-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1852 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_unpack)
NOTE: Running task 1853 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: Running task 1854 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: Running task 1855 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: Running task 1856 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_fetch: Succeeded
NOTE: Running task 1857 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: Running task 1863 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: Running task 1876 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_unpack)
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: Running task 1877 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_unpack)
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: Running task 1885 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: Running task 1919 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Started
NOTE: Running task 1920 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: Running task 1958 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: Running task 1989 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 1990 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 1991 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: recipe icu-69.1-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 2017 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: Running task 2028 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe pango-1.48.5-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: Running task 2059 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2098 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_write_config)
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: Running task 2104 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_fetch)
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_write_config: Succeeded
NOTE: Running task 2119 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_patch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Started
NOTE: recipe pango-1.48.5-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: Running task 2150 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2220 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_fetch: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: Running task 2320 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: Running task 2349 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 2350 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: Running task 2355 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_write_config: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_fetch: Started
NOTE: Running task 2811 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 2812 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_unpack)
NOTE: Running task 2813 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2814 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 2815 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-tools-1.2.5-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2816 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: Running task 2817 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_unpack)
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_write_config: Succeeded
NOTE: Running task 2821 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_unpack)
NOTE: Running task 2822 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_unpack)
NOTE: Running task 2823 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_unpack: Started
NOTE: Running task 2926 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 2927 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_patch)
NOTE: Running task 2928 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2929 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: Running task 2930 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Started
NOTE: Running task 2931 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: Running task 2932 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: Running task 2933 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2934 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: Running task 2935 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.48.5-r0: task do_unpack: Succeeded
NOTE: Running task 2936 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2937 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: Running task 2938 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2939 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_unpack: Succeeded
NOTE: Running task 2940 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_patch)
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: Running task 2941 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2942 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_patch)
NOTE: recipe pango-1.48.5-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: Running task 2943 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 2944 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2945 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2946 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2947 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2948 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2949 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.48.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: Running task 2950 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2951 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2952 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_generate_toolchain_file)
NOTE: Running task 2953 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2954 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: Running task 2955 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2956 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2957 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2958 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: Running task 2959 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 2960 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_patch)
NOTE: recipe pango-1.48.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2961 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 9db1ebfe9b3fd2f1fb3a0d8975c0e71132c4ac7ffd8a022230ad1822d23afd05
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2980 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2985 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: Running task 3009 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3010 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3011 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3030 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_lic)
NOTE: Running task 3031 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_lic: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3032 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe alsa-tools-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_lic unihash changed to b2bd106a905e530065f69afa39dae1766342c9390361187a1e08cb219c4f9a6c
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 3033 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe icu-69.1-r0: task do_unpack: Succeeded
NOTE: Running task 3034 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_patch: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 3035 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ae80e3d5b4a179edfe89ddf0cfd90e569484509b91bb4d7ba20b7a9884e49191
NOTE: Setscene tasks completed
NOTE: Running task 3070 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_patch: Succeeded
NOTE: Running task 3078 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_make_icudata)
NOTE: Running task 3079 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch)
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Succeeded
NOTE: Running task 3080 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe icu-69.1-r0: task do_make_icudata: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-69.1-r0: task do_make_icudata: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3081 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_configure)
NOTE: recipe icu-69.1-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Succeeded
NOTE: Running task 3082 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3083 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_configure)
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 3084 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3085 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 3086 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 3087 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 3088 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3089 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Succeeded
NOTE: Running task 3090 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_populate_sysroot)
NOTE: Running task 3091 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 3092 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Succeeded
NOTE: Running task 3093 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3094 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Succeeded
NOTE: Running task 3095 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3096 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package_write_rpm)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 3097 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3098 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 3099 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3100 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3101 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 3102 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe icu-69.1-r0: task do_configure: Succeeded
NOTE: Running task 3103 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3104 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3105 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: recipe icu-69.1-r0: task do_compile: Started
NOTE: Running task 3106 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 3107 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 3108 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: Running task 3109 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3110 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_compile: Started
NOTE: Running task 3111 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3112 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3113 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3114 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: Running task 3115 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3116 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3117 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-src went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dbg went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-staticdev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-doc went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-locale went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3118 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 3119 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3120 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3121 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe alsa-lib-1.2.4-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 3122 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3123 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe alsa-lib-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3124 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package)
NOTE: Running task 3125 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_populate_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3126 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3127 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 3128 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 3129 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3130 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3131 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3132 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3133 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3134 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3135 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3136 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-src went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-dbg went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-server went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-conf went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package libatopology went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-staticdev went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-dev went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-doc went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-locale went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3137 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 3138 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3140 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3142 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_install)
NOTE: Running task 3143 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Succeeded
NOTE: Running task 3144 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot)
NOTE: Running task 3145 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3146 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3147 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3148 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3149 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3150 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3151 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3152 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3153 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3154 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3155 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3156 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3157 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Succeeded
NOTE: Running task 3158 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3159 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe icu-69.1-r0: task do_compile: Succeeded
NOTE: Running task 3160 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_install)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_configure: Succeeded
NOTE: Running task 3161 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_compile)
NOTE: recipe icu-69.1-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: Running task 3162 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3163 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_install: Succeeded
NOTE: Running task 3164 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot)
NOTE: Running task 3165 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package)
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_package: Started
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_compile: Succeeded
NOTE: Running task 3166 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_install)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3167 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: Running task 3168 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile_ptest_base)
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3169 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_install: Succeeded
NOTE: Running task 3170 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_populate_sysroot)
NOTE: Running task 3171 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_package)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-69.1-r0: task do_package: Succeeded
NOTE: Running task 3172 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata)
NOTE: recipe icu-69.1-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3173 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3174 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3175 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3176 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Succeeded
NOTE: Running task 3177 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install_ptest_base)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package: Succeeded
NOTE: Running task 3178 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3179 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot)
NOTE: Running task 3180 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3181 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3182 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3183 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3184 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3185 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3186 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3187 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: Running task 3188 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3189 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3190 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Succeeded
NOTE: Running task 3191 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3192 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3193 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3194 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 3195 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 3196 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3197 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3198 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 3199 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3200 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 3201 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_compile)
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 3202 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_install)
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 3203 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_populate_sysroot)
NOTE: Running task 3204 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package)
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3205 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3206 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_configure)
NOTE: recipe pango-1.48.5-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Succeeded
NOTE: Running task 3207 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3208 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.5-r0: task do_configure: Succeeded
NOTE: Running task 3209 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3210 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_compile)
NOTE: recipe pango-1.48.5-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_compile: Succeeded
NOTE: Running task 3211 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3212 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_install)
NOTE: recipe pango-1.48.5-r0: task do_install: Started
NOTE: recipe pango-1.48.5-r0: task do_install: Succeeded
NOTE: Running task 3213 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3214 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_populate_sysroot)
NOTE: Running task 3215 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_package)
NOTE: recipe pango-1.48.5-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.5-r0: task do_package: Started
NOTE: recipe pango-1.48.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3216 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3217 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_configure)
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Started
NOTE: recipe pango-1.48.5-r0: task do_package: Succeeded
NOTE: Running task 3218 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_packagedata)
NOTE: recipe pango-1.48.5-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3219 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.5-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Succeeded
NOTE: Running task 3220 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_compile)
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Succeeded
NOTE: Running task 3221 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_install)
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Succeeded
NOTE: Running task 3222 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package)
NOTE: Running task 3223 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3224 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-tools-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3229 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_configure)
NOTE: recipe alsa-tools-1.2.5-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Succeeded
NOTE: Running task 3230 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Succeeded
NOTE: Running task 3234 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3235 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_compile)
NOTE: recipe alsa-tools-1.2.5-r0: task do_compile: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3236 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_install)
NOTE: recipe alsa-tools-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3237 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_package)
NOTE: Running task 3238 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_sysroot)
NOTE: recipe alsa-tools-1.2.5-r0: task do_package: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3239 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-tools-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3240 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_package_write_rpm)
NOTE: Running task 3241 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_package_qa)
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_qa: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_qa: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3242 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_build)
NOTE: Tasks Summary: Attempted 3242 tasks of which 2977 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There were 17 ERROR messages shown, returning a non-zero exit code.

--===============7000961810849828596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 823 .bb files complete (0 cached, 823 parsed). 1459 targets, 66 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-4f45df860b6b07b73acd2ab269775e7c722526a7"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4f45df860b6b07b73acd2ab269775e7c722526a7"
workspace            = "master:9d1b332292a94cd4463f1e88dfe293847264714e"

Initialising tasks...done.
Sstate summary: Wanted 112 Local 5 Network 0 Missed 107 Current 916 (4% match, 89% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 924 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 925 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 931 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: Running setscene task 932 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Succeeded
NOTE: Running task 1109 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1296 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: Running task 1311 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_fetch)
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1413 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1448 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_fetch)
NOTE: Running task 1506 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_fetch)
NOTE: Running task 1507 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_write_config)
NOTE: Running task 1524 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: Running task 1556 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1557 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1558 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_fetch)
NOTE: Running task 1567 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Started
NOTE: Running task 1643 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Succeeded
NOTE: Running task 1644 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_unpack)
NOTE: Running task 1645 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1675 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Started
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1743 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 1744 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_unpack)
NOTE: Running task 1745 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-69.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: Running task 1784 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: recipe icu-69.1-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: Running task 1804 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_unpack)
NOTE: Running task 1809 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1810 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: Running task 1811 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: Running task 1823 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1824 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_write_config)
NOTE: Running task 1828 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_write_config)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Started
NOTE: Running task 1861 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: recipe pango-1.48.5-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: Running task 1881 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1893 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: Running task 1894 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: Running task 1895 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_unpack)
NOTE: Running task 1896 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_unpack)
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: Running task 1921 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Started
NOTE: Running task 1922 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1958 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_fetch)
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: Running task 1989 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 1990 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1991 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 2017 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: recipe icu-69.1-r0: task do_unpack: Started
NOTE: Running task 2058 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2097 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_write_config)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: Running task 2103 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_fetch)
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: Running task 2148 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2210 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 2219 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: Running task 2241 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_fetch: Started
NOTE: Running task 2323 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_patch)
NOTE: recipe pango-1.48.5-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: Running task 2345 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 2346 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_write_config: Succeeded
NOTE: Running task 2347 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: Running task 2348 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 2349 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_fetch: Succeeded
NOTE: Running task 2350 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_unpack)
NOTE: Running task 2351 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_write_config: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Succeeded
NOTE: Running task 2421 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_unpack)
NOTE: recipe alsa-tools-1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 2449 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_unpack)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: Running task 2632 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_unpack)
NOTE: Running task 2633 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 2924 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2925 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2926 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2927 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_unpack: Succeeded
NOTE: Running task 2928 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: Running task 2929 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_patch)
NOTE: Running task 2930 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: Running task 2931 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: Running task 2932 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_patch: Succeeded
NOTE: Running task 2933 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_unpack: Succeeded
NOTE: Running task 2934 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Succeeded
NOTE: Running task 2935 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2936 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_patch)
NOTE: Running task 2937 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2938 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Started
NOTE: recipe pango-1.48.5-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: Running task 2939 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.48.5-r0: task do_patch: Succeeded
NOTE: Running task 2940 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2941 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_patch)
NOTE: recipe pango-1.48.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Succeeded
NOTE: Running task 2942 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: Running task 2943 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: Running task 2944 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 2945 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_patch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Succeeded
NOTE: Running task 2946 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2947 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe alsa-tools-1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2948 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2949 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2950 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2951 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_lic)
NOTE: recipe alsa-tools-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_lic: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2952 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_unpack: Succeeded
NOTE: Running task 2953 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_patch)
NOTE: recipe alsa-tools-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_lic unihash changed to b2bd106a905e530065f69afa39dae1766342c9390361187a1e08cb219c4f9a6c
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe icu-69.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b0bd4b956355d1351e65f6f6b22dd85a86503a98cfac2900754f37891017fa9c
NOTE: Running task 2972 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2977 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 3019 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: Running task 3020 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3021 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Succeeded
NOTE: Running task 3022 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_generate_toolchain_file)
NOTE: Running task 3023 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 3024 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 3025 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3026 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_patch)
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Succeeded
NOTE: Running task 3027 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3028 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_configure)
NOTE: Running task 3029 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: Running task 3030 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: Running task 3031 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: Running task 3032 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_configure)
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe icu-69.1-r0: task do_patch: Succeeded
NOTE: Running task 3033 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_make_icudata)
NOTE: Running task 3034 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3035 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: Running task 3036 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe icu-69.1-r0: task do_make_icudata: Started
NOTE: Running task 3037 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3038 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3039 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe icu-69.1-r0: task do_make_icudata: Succeeded
NOTE: Running task 3040 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_configure)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe icu-69.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 282c3d6360e5bd55524ab52880de1765c1e1d43af1f8d999f066debeaae29e00
NOTE: Setscene tasks completed
NOTE: Running task 3074 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3083 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 3084 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3085 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 3086 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 3087 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 3088 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3089 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Succeeded
NOTE: Running task 3090 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Succeeded
NOTE: Running task 3091 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_populate_sysroot)
NOTE: Running task 3092 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 3093 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3094 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Succeeded
NOTE: Running task 3095 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3096 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package_write_rpm)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3097 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_compile)
NOTE: recipe alsa-lib-1.2.4-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 3098 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3099 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 3100 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3101 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: recipe icu-69.1-r0: task do_configure: Succeeded
NOTE: Running task 3102 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_compile)
NOTE: Running task 3103 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 3104 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe icu-69.1-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 3105 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3106 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3107 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3108 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 3109 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: Running task 3110 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3111 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3112 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3113 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3114 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: Running task 3115 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3116 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-src went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dbg went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-staticdev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-doc went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-locale went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3117 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3118 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3119 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3120 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_install)
NOTE: recipe alsa-lib-1.2.4-r0: task do_install: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 3121 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3122 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package)
NOTE: Running task 3123 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_populate_sysroot)
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 3124 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 3125 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3126 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3127 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3128 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3129 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3130 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3131 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-src went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-dbg went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-server went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-conf went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package libatopology went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-staticdev went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-dev went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-doc went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-locale went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3132 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3133 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3134 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm: Started
NOTE: Running task 3135 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3136 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 3137 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3138 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3140 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Succeeded
NOTE: Running task 3142 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_install)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Succeeded
NOTE: Running task 3143 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot)
NOTE: Running task 3144 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3145 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: Running task 3146 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3147 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3148 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3149 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3150 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3151 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3152 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3153 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3154 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3155 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3156 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3157 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Succeeded
NOTE: Running task 3158 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3159 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: Running task 3160 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3161 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_configure: Succeeded
NOTE: Running task 3162 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_compile: Started
NOTE: recipe icu-69.1-r0: task do_compile: Succeeded
NOTE: Running task 3163 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_install)
NOTE: recipe icu-69.1-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3164 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe icu-69.1-r0: task do_install: Succeeded
NOTE: Running task 3165 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot)
NOTE: Running task 3166 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package)
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_package: Started
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_compile: Succeeded
NOTE: Running task 3167 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_install)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3168 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3169 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_install: Succeeded
NOTE: Running task 3170 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_populate_sysroot)
NOTE: Running task 3171 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_package)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3172 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: Running task 3173 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3174 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3175 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe icu-69.1-r0: task do_package: Succeeded
NOTE: Running task 3176 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata)
NOTE: recipe icu-69.1-r0: task do_packagedata: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3177 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3178 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3179 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package: Succeeded
NOTE: Running task 3180 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3181 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3182 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3183 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3184 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 3185 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Succeeded
NOTE: Running task 3186 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install_ptest_base)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3187 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot)
NOTE: Running task 3188 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3189 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3190 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3191 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Succeeded
NOTE: Running task 3192 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3193 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Started
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3194 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 3195 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 3196 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3197 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3198 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 3199 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3200 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 3201 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_compile)
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 3202 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_install)
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 3203 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_populate_sysroot)
NOTE: Running task 3204 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package)
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3205 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3206 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_configure)
NOTE: recipe pango-1.48.5-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Succeeded
NOTE: Running task 3207 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3208 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.5-r0: task do_configure: Succeeded
NOTE: Running task 3209 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3210 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_compile)
NOTE: recipe pango-1.48.5-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_compile: Succeeded
NOTE: Running task 3211 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3212 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_install)
NOTE: recipe pango-1.48.5-r0: task do_install: Started
NOTE: recipe pango-1.48.5-r0: task do_install: Succeeded
NOTE: Running task 3213 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3214 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_populate_sysroot)
NOTE: Running task 3215 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_package)
NOTE: recipe pango-1.48.5-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.5-r0: task do_package: Started
NOTE: recipe pango-1.48.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3216 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3217 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_configure)
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Started
NOTE: recipe pango-1.48.5-r0: task do_package: Succeeded
NOTE: Running task 3218 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_packagedata)
NOTE: recipe pango-1.48.5-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3219 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.5-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Succeeded
NOTE: Running task 3220 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_compile)
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Succeeded
NOTE: Running task 3221 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_install)
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Succeeded
NOTE: Running task 3222 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package)
NOTE: Running task 3223 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3224 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-tools-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3229 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_configure)
NOTE: recipe alsa-tools-1.2.5-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Succeeded
NOTE: Running task 3230 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Succeeded
NOTE: Running task 3234 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3235 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_compile)
NOTE: recipe alsa-tools-1.2.5-r0: task do_compile: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3236 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_install)
NOTE: recipe alsa-tools-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3237 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_package)
NOTE: Running task 3238 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_sysroot)
NOTE: recipe alsa-tools-1.2.5-r0: task do_package: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3239 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-tools-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3240 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_package_write_rpm)
NOTE: Running task 3241 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_package_qa)
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_qa: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_qa: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3242 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_build)
NOTE: Tasks Summary: Attempted 3242 tasks of which 2977 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There were 17 ERROR messages shown, returning a non-zero exit code.

--===============7000961810849828596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1459 entries from dependency cache.
Parsing recipes...done.
Parsing of 823 .bb files complete (822 cached, 1 parsed). 1459 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-4f45df860b6b07b73acd2ab269775e7c722526a7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4f45df860b6b07b73acd2ab269775e7c722526a7"
workspace            = "master:9d1b332292a94cd4463f1e88dfe293847264714e"

Initialising tasks...done.
Sstate summary: Wanted 116 Local 9 Network 0 Missed 107 Current 916 (7% match, 89% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 922 of 1032 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 925 of 1032 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 927 of 1032 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 932 of 1032 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1026 of 1032 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1027 of 1032 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1028 of 1032 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb:do_packagedata_setscene)
NOTE: recipe cantarell-fonts-0.301-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1029 of 1032 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Started
NOTE: Running task 1110 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1296 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: Running task 1311 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_fetch)
NOTE: Running task 1413 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1448 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_fetch)
NOTE: Running task 1506 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: Running task 1509 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_write_config)
NOTE: Running task 1526 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 1550 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: Running task 1551 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1560 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1561 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_fetch)
NOTE: Running task 1562 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1571 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_fetch)
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Started
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1678 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 1681 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Started
NOTE: recipe icu-69.1-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Succeeded
NOTE: Running task 1760 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_unpack)
NOTE: Running task 1761 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: Running task 1762 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_unpack)
NOTE: recipe icu-69.1-r0: task do_fetch: Succeeded
NOTE: Running task 1774 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_unpack)
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: Running task 1803 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Started
NOTE: Running task 1826 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: Running task 1828 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1840 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_write_config)
NOTE: Running task 1841 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1845 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_write_config)
NOTE: recipe pango-1.48.5-r0: task do_fetch: Started
NOTE: Running task 1878 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: Running task 1898 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: recipe pango-1.48.5-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: Running task 1941 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_unpack)
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: Running task 1957 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 1958 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 1959 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: Running task 1960 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: Running task 1961 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1962 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_unpack)
NOTE: Running task 1976 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Started
NOTE: recipe icu-69.1-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: Running task 2007 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Started
NOTE: Running task 2008 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 2009 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: Running task 2031 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: Running task 2036 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: Running task 2051 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: recipe pango-1.48.5-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2078 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_fetch)
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: Running task 2117 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_write_config)
NOTE: Running task 2123 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_fetch)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: Running task 2130 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: recipe pango-1.48.5-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: Running task 2169 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2239 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_fetch)
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_fetch: Started
NOTE: Running task 2379 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_patch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Succeeded
NOTE: Running task 2414 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_unpack)
NOTE: Running task 2415 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2416 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_unpack)
NOTE: recipe alsa-tools-1.2.5-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 2503 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: Running task 2504 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_write_config: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: Running task 2739 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 2740 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_unpack)
NOTE: Running task 2741 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: Running task 2742 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: Running task 2743 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 2744 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2943 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2944 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 2945 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2946 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: Running task 2947 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: Running task 2948 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2949 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2950 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2951 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2952 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2953 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: Running task 2954 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_patch)
NOTE: Running task 2955 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Succeeded
NOTE: Running task 2956 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_patch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2957 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_unpack: Succeeded
NOTE: Running task 2958 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: Running task 2959 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_patch)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2960 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2961 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: Running task 2962 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b058d65b7ecf2e582e8b45e3e61cdad604192782062fe750397f705e0d9d20d0
NOTE: Running task 2981 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_unpack: Succeeded
NOTE: Running task 2986 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2987 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: Running task 2988 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_patch)
NOTE: Running task 3000 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_patch: Succeeded
NOTE: Running task 3031 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: Running task 3032 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 3033 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_patch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_patch: Started
NOTE: Running task 3034 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: Running task 3035 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3036 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 3037 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3038 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3039 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.48.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Succeeded
NOTE: Running task 3040 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_generate_toolchain_file)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3041 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3042 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3043 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 3044 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3045 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_lic)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: Running task 3046 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_lic: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ef81a923a976d58e96871431d8f8527287c0885c2f08bd02a58f765c3bab4c60
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3048 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_configure)
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 3062 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_patch)
NOTE: Running task 3063 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_configure)
NOTE: Running task 3083 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_lic unihash changed to b2bd106a905e530065f69afa39dae1766342c9390361187a1e08cb219c4f9a6c
NOTE: recipe alsa-tools-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Succeeded
NOTE: Running task 3092 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 3093 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_unpack: Succeeded
NOTE: Running task 3094 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_patch)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe icu-69.1-r0: task do_patch: Started
NOTE: recipe icu-69.1-r0: task do_patch: Succeeded
NOTE: Running task 3095 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_make_icudata)
NOTE: Running task 3096 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 3097 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-69.1-r0: task do_make_icudata: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Succeeded
NOTE: Running task 3098 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_make_icudata: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3099 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-69.1-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 3100 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: Running task 3101 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_configure)
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Succeeded
NOTE: Running task 3102 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3103 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 3104 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 3105 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 3106 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 3107 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Succeeded
NOTE: Running task 3108 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3109 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3110 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Succeeded
NOTE: Running task 3111 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_populate_sysroot)
NOTE: Running task 3112 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 3113 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Succeeded
NOTE: Running task 3114 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 3115 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3116 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3117 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3118 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe icu-69.1-r0: task do_configure: Succeeded
NOTE: Running task 3119 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_compile)
NOTE: recipe icu-69.1-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 3120 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 3121 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3122 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 3123 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3124 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3125 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 3126 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: Running task 3127 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3128 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3129 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3130 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3131 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3132 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: Running task 3133 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3134 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-src went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dbg went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-staticdev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-doc went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-locale went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3135 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3136 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 3137 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3138 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3139 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_install)
NOTE: recipe alsa-lib-1.2.4-r0: task do_install: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 3140 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3141 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3142 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3143 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3144 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package)
NOTE: Running task 3145 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_populate_sysroot)
NOTE: recipe alsa-lib-1.2.4-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 3146 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 3147 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3148 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3149 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3150 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3151 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3152 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3153 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe alsa-lib-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3154 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-src went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-dbg went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-server went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-conf went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package libatopology went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-staticdev went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-dev went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-doc went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib-locale went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata: QA Issue: Package version for package alsa-lib went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3155 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 3156 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3158 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Succeeded
NOTE: Running task 3160 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_install)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Succeeded
NOTE: Running task 3161 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot)
NOTE: Running task 3162 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3163 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3164 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3165 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3166 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3167 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3168 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3169 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3170 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3171 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3172 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Succeeded
NOTE: Running task 3173 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3174 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3175 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3176 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3177 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_configure: Succeeded
NOTE: Running task 3178 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_compile)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: Running task 3179 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3180 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe icu-69.1-r0: task do_compile: Succeeded
NOTE: Running task 3181 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_install)
NOTE: recipe icu-69.1-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_install: Succeeded
NOTE: Running task 3182 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot)
NOTE: Running task 3183 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package)
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_compile: Succeeded
NOTE: Running task 3184 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_install)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_install: Started
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_install: Succeeded
NOTE: Running task 3185 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_populate_sysroot)
NOTE: Running task 3186 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_package)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: Running task 3187 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile_ptest_base)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3188 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Started
NOTE: recipe icu-69.1-r0: task do_package: Succeeded
NOTE: Running task 3189 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata)
NOTE: recipe icu-69.1-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3190 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package: Succeeded
NOTE: Running task 3191 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_packagedata)
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Succeeded
NOTE: Running task 3192 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3193 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot)
NOTE: Running task 3194 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3195 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3196 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Succeeded
NOTE: Running task 3197 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3198 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3199 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3200 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3201 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3202 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3203 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3204 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3205 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3206 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3207 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3208 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: Running task 3209 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3210 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3211 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3212 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 3213 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 3214 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3215 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3216 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 3217 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3218 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 3219 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_compile)
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 3220 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_install)
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 3221 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_populate_sysroot)
NOTE: Running task 3222 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package)
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3223 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3224 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_configure)
NOTE: recipe pango-1.48.5-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Succeeded
NOTE: Running task 3225 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3226 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.5-r0: task do_configure: Succeeded
NOTE: Running task 3227 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3228 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_compile)
NOTE: recipe pango-1.48.5-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_compile: Succeeded
NOTE: Running task 3229 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3230 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_install)
NOTE: recipe pango-1.48.5-r0: task do_install: Started
NOTE: recipe pango-1.48.5-r0: task do_install: Succeeded
NOTE: Running task 3231 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.5-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3232 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_populate_sysroot)
NOTE: Running task 3233 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_package)
NOTE: recipe pango-1.48.5-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.5-r0: task do_package: Started
NOTE: recipe pango-1.48.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3234 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3235 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_configure)
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Started
NOTE: recipe pango-1.48.5-r0: task do_package: Succeeded
NOTE: Running task 3236 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_packagedata)
NOTE: recipe pango-1.48.5-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3237 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.5-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Succeeded
NOTE: Running task 3238 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_compile)
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Succeeded
NOTE: Running task 3239 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_install)
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Succeeded
NOTE: Running task 3240 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package)
NOTE: Running task 3241 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3242 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-tools-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3247 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_configure)
NOTE: recipe alsa-tools-1.2.5-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Succeeded
NOTE: Running task 3248 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Succeeded
NOTE: Running task 3252 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3253 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_compile)
NOTE: recipe alsa-tools-1.2.5-r0: task do_compile: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3254 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_install)
NOTE: recipe alsa-tools-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3255 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_package)
NOTE: Running task 3256 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_sysroot)
NOTE: recipe alsa-tools-1.2.5-r0: task do_package: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3257 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-tools-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3258 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_package_write_rpm)
NOTE: Running task 3259 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_package_qa)
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_qa: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_qa: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3260 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_build)
NOTE: Tasks Summary: Attempted 3260 tasks of which 2995 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 17 ERROR messages shown, returning a non-zero exit code.

--===============7000961810849828596==--
