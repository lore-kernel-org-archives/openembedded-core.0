Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.24166.1608473714406093511
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id B977938C1423
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:15 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] webkitgtk: upgrading to 2.30.4 SUCCEEDED
Message-ID: <MADEUP.16527252EBBB508A.27420@lists.openembedded.org>
X-Groupsio-MsgNum: 145988
Content-Type: multipart/mixed; boundary="===============2397562482392500626=="

--===============2397562482392500626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *webkitgtk* to *2.30.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-webkitgtk-upgrade-2.30.2-2.30.4.patch
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

--===============2397562482392500626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (0 cached, 807 parsed). 1416 targets, 41 skipped, 0 masked, 0 errors.
Removing 167 recipes from the core2-32 sysroot...done.
Removing 172 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-0dc7be73f056600e1b35ebc348932098deb9ee4e"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0dc7be73f056600e1b35ebc348932098deb9ee4e"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 868 Found 856 Missed 12 Current 322 (98% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 323 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 326 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 329 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 331 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 332 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 333 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 335 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 336 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 337 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 338 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 339 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 341 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 342 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 343 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 344 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 345 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 347 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 349 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 351 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 353 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 355 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 357 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 358 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 359 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 360 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 361 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 362 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 363 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 364 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 365 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 366 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 367 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 368 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 369 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 370 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 371 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 372 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 373 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 374 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.1.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bluez5-5.55-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 375 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 376 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 377 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 378 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 379 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 380 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 381 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 382 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: recipe vala-0.50.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 383 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 384 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 385 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 386 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 387 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 388 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 389 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 390 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 391 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 392 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 393 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 394 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 395 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 396 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 398 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 399 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 400 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 401 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 403 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 404 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 405 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 406 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_package_write_rpm_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 407 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 408 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_package_write_rpm_setscene)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 411 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgudev-234-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 412 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 413 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 414 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 415 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 416 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 417 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 418 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 419 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 420 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 421 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 422 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 423 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_package_write_rpm_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgudev-234-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 424 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 426 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 427 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 428 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe mesa-2_20.2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 429 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsecret-0.20.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 430 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 431 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 432 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 433 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 434 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 435 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 436 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 437 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 438 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 439 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 440 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 441 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 442 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 443 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 444 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: Running setscene task 445 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 446 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 448 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 449 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 450 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 451 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 452 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 453 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 454 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 455 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 456 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 457 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 458 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 461 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 464 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 465 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 466 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 467 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 468 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 469 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 470 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 471 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 472 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bluez5-5.55-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 473 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 474 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_packagedata_setscene)
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 475 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 476 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 479 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 480 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libxv-1.0.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.50.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 481 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb:do_package_write_rpm_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 485 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 486 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 487 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 488 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 489 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 490 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 491 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 492 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 495 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libogg-1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 500 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 501 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sbc-1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 505 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libwpe-1.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 506 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_populate_sysroot_setscene)
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 509 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 510 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 513 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsecret-0.20.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 515 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 516 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libwpe-1.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 517 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 518 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_package_write_rpm_setscene)
NOTE: recipe libsecret-0.20.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 519 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 520 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libtheora-1.1.1-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 521 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_package_write_rpm_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 522 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 523 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 524 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 525 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe aspell-0.60.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wpebackend-fdo-1.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 527 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_package_write_rpm_setscene)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnotify-0.7.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 528 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe libwebp-1.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 529 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.2.13.bb:do_package_write_rpm_setscene)
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 530 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 531 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe wpebackend-fdo-1.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 532 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb:do_packagedata_setscene)
NOTE: recipe libsecret-0.20.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 533 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 534 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 535 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 536 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe enchant2-2.2.13-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 537 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe wpebackend-fdo-1.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe enchant2-2.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 538 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 540 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.1.bb:do_package_write_rpm_setscene)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 542 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 543 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe enchant2-2.2.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 544 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.2.13.bb:do_packagedata_setscene)
NOTE: recipe wpebackend-fdo-1.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 547 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 548 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: recipe icu-68.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 549 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 550 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_package_write_rpm_setscene)
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe enchant2-2.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 551 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 552 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package_write_rpm_setscene)
NOTE: recipe enchant2-2.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 553 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 557 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 558 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 561 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 564 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.23.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 565 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 567 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 574 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 575 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 577 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package_write_rpm_setscene)
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 578 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 579 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libusb1-1.0.23-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnotify-0.7.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 581 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 582 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe aspell-0.60.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 583 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package_write_rpm_setscene)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 586 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_packagedata_setscene)
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.23-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 587 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 590 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 596 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe libxslt-1.1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 603 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_packagedata_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 604 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 605 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxslt-1.1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 609 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 611 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_packagedata_setscene)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 625 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 628 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwpe-1.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wpebackend-fdo-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libwpe-1.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe enchant2-2.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.2.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1095 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_fetch)
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libwpe-1.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe aspell-0.60.8-r0: task do_packagedata_setscene: Started
NOTE: recipe enchant2-2.2.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 657 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1310 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_unpack)
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe enchant2-2.2.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwpe-1.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 669 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxslt-1.1.34-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_unpack: Started
NOTE: Running setscene task 670 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwpe-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-68.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libwpe-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_20.2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 683 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 689 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe aspell-0.60.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 693 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 695 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 696 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 697 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsecret-0.20.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 707 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 709 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 710 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 711 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 717 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 721 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 722 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 729 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 730 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 731 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.23.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.50.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.50.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsecret-0.20.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.55-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-234-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-234-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 739 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bluez5-5.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.73.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.23-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 741 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 743 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 745 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-234-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.50.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sbc-1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 748 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 750 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 754 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 755 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vala-0.50.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 757 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 759 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 760 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 761 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 763 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 765 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 766 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-234-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 769 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 771 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 772 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.50.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bluez5-5.55-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 776 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 779 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sbc-1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 781 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 783 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 784 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vala-0.50.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-234-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bluez5-5.55-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-234-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_packagedata_setscene: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1686 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_patch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.55-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata_setscene: Succeeded
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
NOTE: Running setscene task 787 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 788 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 789 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch_setscene)
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 791 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 793 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 795 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libical-3.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 797 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 799 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 800 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 802 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 804 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 805 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 808 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 809 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 810 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 811 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 812 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 813 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 814 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 816 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 817 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 818 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 819 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 820 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 821 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 823 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 824 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 825 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flac-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 827 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 829 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pango-1.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1737 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_generate_toolchain_file)
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1738 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1739 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_populate_lic)
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_populate_lic: Started
NOTE: Running setscene task 833 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 834 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 835 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 837 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 838 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 839 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 840 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 841 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 843 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 844 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 845 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 846 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 847 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 848 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 849 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 851 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe webkitgtk-2.30.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_populate_lic: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_populate_lic unihash changed to 598fb62c1d96bfc805d6e345147e3aef7ae2599c533772e12c92b1f34371f1b2
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 853 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 855 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 857 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 859 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 860 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 861 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 863 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 864 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 865 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 867 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 868 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 869 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libogg-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 871 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 873 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 874 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.1.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 876 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 878 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 879 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 880 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 882 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 883 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-68.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 885 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 886 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 887 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 889 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-68.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 891 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 893 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libogg-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 895 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 897 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 898 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 899 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 900 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 901 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 902 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 903 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 906 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe icu-68.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 909 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 910 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 911 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-68.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 912 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 914 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 915 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 916 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 918 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-68.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-68.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 920 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_packagedata_setscene)
NOTE: Running setscene task 921 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 922 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 923 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 924 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_20.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 925 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 926 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 927 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 928 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 929 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 930 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 932 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 933 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 934 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_20.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 937 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 939 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 940 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 941 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 942 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 943 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 944 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 946 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 947 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 948 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 950 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 952 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 954 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 955 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 956 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 957 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 958 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 960 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 963 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 966 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 967 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 968 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 969 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 970 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 972 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 975 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 976 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 977 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 978 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 979 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 981 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 982 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 986 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 987 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 988 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 991 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 992 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 993 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 994 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 999 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1000 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 1001 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1002 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1003 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1004 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1005 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1006 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1007 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1008 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1009 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1010 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 1011 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1012 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 1013 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1015 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1016 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1017 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1965 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: Running setscene task 1019 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1021 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running setscene task 1023 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1024 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1025 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 1026 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1027 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1028 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: Running setscene task 1029 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: Running task 1974 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running setscene task 1031 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1975 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1033 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1035 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1037 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1039 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 1040 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 1041 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 2011 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1043 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 1044 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1045 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 1046 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1047 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 2014 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 2015 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 2016 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1049 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1051 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1053 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1055 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1056 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1057 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2025 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1059 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1060 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1061 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 1062 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1063 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1064 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1065 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1066 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1067 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1070 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1072 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1074 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1075 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1076 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1077 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1078 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1079 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1081 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_packagedata_setscene)
NOTE: Running setscene task 1082 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1083 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 1084 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1085 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1086 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1087 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1088 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1089 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2055 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1091 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1094 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1096 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ac9535620c869a5ab0014bf3b6f9b8138e6f7b60a06f668c27308a6b7faf6f5c
NOTE: Running task 2073 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1106 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1107 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1108 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1109 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1111 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1112 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1113 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1114 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1115 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1116 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1117 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1118 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1119 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1120 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1122 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1123 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1124 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1125 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1126 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1127 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1128 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1129 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1130 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1131 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1132 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1133 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1134 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1136 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1137 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1138 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1140 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1141 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1142 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1143 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1144 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1145 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1146 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1147 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1148 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1150 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1152 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1154 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1155 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1158 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1160 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1161 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1162 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1164 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1165 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1166 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1168 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1169 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1170 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1172 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1173 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1174 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1175 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1176 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1177 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1183 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1184 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1185 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1187 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1188 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1189 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1190 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1191 of 1190 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2466 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 6c0422073d22e07b8d4a881cee113af4d2adac7abce1d859c2ffb593aace9791
NOTE: Running task 3580 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe webkitgtk-2.30.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3667 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_configure)
NOTE: recipe webkitgtk-2.30.4-r0: task do_configure: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_configure: Succeeded
NOTE: Running task 3668 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_compile)
NOTE: recipe webkitgtk-2.30.4-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_compile: Succeeded
NOTE: Running task 3669 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_install)
NOTE: recipe webkitgtk-2.30.4-r0: task do_install: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_install: Succeeded
NOTE: Running task 3670 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_package)
NOTE: Running task 3671 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_populate_sysroot)
NOTE: recipe webkitgtk-2.30.4-r0: task do_package: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_package: Succeeded
NOTE: Running task 3672 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_packagedata)
NOTE: recipe webkitgtk-2.30.4-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3673 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_package_write_rpm)
NOTE: Running task 3674 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_package_qa)
NOTE: recipe webkitgtk-2.30.4-r0: task do_package_write_rpm: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_package_qa: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_package_qa: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3675 of 3675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_build)
NOTE: Tasks Summary: Attempted 3675 tasks of which 3648 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============2397562482392500626==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-webkitgtk-upgrade-2.30.2-2.30.4.patch"

From 18513525e056b7e11c848c6be684e09eeb15dccc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 12:46:10 +0000
Subject: [PATCH] webkitgtk: upgrade 2.30.2 -> 2.30.4

---
 ...er-exposes-FALSE-and-TRUE-macros-by-.patch | 180 ------------------
 ...ebkitgtk_2.30.2.bb => webkitgtk_2.30.4.bb} |   3 +-
 2 files changed, 1 insertion(+), 182 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-ICU-68.1-no-longer-exposes-FALSE-and-TRUE-macros-by-.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.30.2.bb => webkitgtk_2.30.4.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-ICU-68.1-no-longer-exposes-FALSE-and-TRUE-macros-by-.patch b/meta/recipes-sato/webkit/webkitgtk/0001-ICU-68.1-no-longer-exposes-FALSE-and-TRUE-macros-by-.patch
deleted file mode 100644
index 3a02253e5e..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-ICU-68.1-no-longer-exposes-FALSE-and-TRUE-macros-by-.patch
+++ /dev/null
@@ -1,180 +0,0 @@
-From 8d1c44a03c1870912991467f8d8cd8bb6f85efa5 Mon Sep 17 00:00:00 2001
-From: "stephan.szabo@sony.com" <stephan.szabo@sony.com>
-Date: Tue, 3 Nov 2020 20:06:15 +0000
-Subject: [PATCH] ICU 68.1 no longer exposes FALSE and TRUE macros by default
- https://bugs.webkit.org/show_bug.cgi?id=218522
-
-Reviewed by Don Olmstead.
-
-Source/WebCore:
-
-* platform/text/TextCodecICU.cpp: Replace use of TRUE with true
-
-Source/WebKit:
-
-* UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp: Replace FALSE with false
-
-Source/WTF:
-
-Replace uses of FALSE and TRUE with false and true.
-
-* wtf/text/icu/UTextProvider.h:
-* wtf/text/icu/UTextProviderLatin1.cpp:
-* wtf/text/icu/UTextProviderUTF16.cpp:
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-git-svn-id: https://svn.webkit.org/repository/webkit/trunk@269325 268f45cc-cd09-0410-ab3c-d52691b4dbfc
----
- Source/WTF/wtf/text/icu/UTextProvider.h            |  8 ++++----
- Source/WTF/wtf/text/icu/UTextProviderLatin1.cpp    | 14 +++++++-------
- Source/WTF/wtf/text/icu/UTextProviderUTF16.cpp     |  4 ++--
- Source/WebCore/platform/text/TextCodecICU.cpp      |  2 +-
- .../DrawingAreaProxyCoordinatedGraphics.cpp        |  2 +-
- 5 files changed, 15 insertions(+), 15 deletions(-)
-
-diff --git a/Source/WTF/wtf/text/icu/UTextProvider.h b/Source/WTF/wtf/text/icu/UTextProvider.h
-index c8f28d6e..3c6fbeab 100644
---- a/Source/WTF/wtf/text/icu/UTextProvider.h
-+++ b/Source/WTF/wtf/text/icu/UTextProvider.h
-@@ -79,12 +79,12 @@ inline bool uTextAccessInChunkOrOutOfRange(UText* text, int64_t nativeIndex, int
-             // Ensure chunk offset is well formed if computed offset exceeds int32_t range.
-             ASSERT(offset < std::numeric_limits<int32_t>::max());
-             text->chunkOffset = offset < std::numeric_limits<int32_t>::max() ? static_cast<int32_t>(offset) : 0;
--            isAccessible = TRUE;
-+            isAccessible = true;
-             return true;
-         }
-         if (nativeIndex >= nativeLength && text->chunkNativeLimit == nativeLength) {
-             text->chunkOffset = text->chunkLength;
--            isAccessible = FALSE;
-+            isAccessible = false;
-             return true;
-         }
-     } else {
-@@ -93,12 +93,12 @@ inline bool uTextAccessInChunkOrOutOfRange(UText* text, int64_t nativeIndex, int
-             // Ensure chunk offset is well formed if computed offset exceeds int32_t range.
-             ASSERT(offset < std::numeric_limits<int32_t>::max());
-             text->chunkOffset = offset < std::numeric_limits<int32_t>::max() ? static_cast<int32_t>(offset) : 0;
--            isAccessible = TRUE;
-+            isAccessible = true;
-             return true;
-         }
-         if (nativeIndex <= 0 && !text->chunkNativeStart) {
-             text->chunkOffset = 0;
--            isAccessible = FALSE;
-+            isAccessible = false;
-             return true;
-         }
-     }
-diff --git a/Source/WTF/wtf/text/icu/UTextProviderLatin1.cpp b/Source/WTF/wtf/text/icu/UTextProviderLatin1.cpp
-index 0a646b7f..49980f95 100644
---- a/Source/WTF/wtf/text/icu/UTextProviderLatin1.cpp
-+++ b/Source/WTF/wtf/text/icu/UTextProviderLatin1.cpp
-@@ -100,23 +100,23 @@ static UBool uTextLatin1Access(UText* uText, int64_t index, UBool forward)
-         if (index < uText->chunkNativeLimit && index >= uText->chunkNativeStart) {
-             // Already inside the buffer. Set the new offset.
-             uText->chunkOffset = static_cast<int32_t>(index - uText->chunkNativeStart);
--            return TRUE;
-+            return true;
-         }
-         if (index >= length && uText->chunkNativeLimit == length) {
-             // Off the end of the buffer, but we can't get it.
-             uText->chunkOffset = static_cast<int32_t>(index - uText->chunkNativeStart);
--            return FALSE;
-+            return false;
-         }
-     } else {
-         if (index <= uText->chunkNativeLimit && index > uText->chunkNativeStart) {
-             // Already inside the buffer. Set the new offset.
-             uText->chunkOffset = static_cast<int32_t>(index - uText->chunkNativeStart);
--            return TRUE;
-+            return true;
-         }
-         if (!index && !uText->chunkNativeStart) {
-             // Already at the beginning; can't go any farther.
-             uText->chunkOffset = 0;
--            return FALSE;
-+            return false;
-         }
-     }
-     
-@@ -144,7 +144,7 @@ static UBool uTextLatin1Access(UText* uText, int64_t index, UBool forward)
- 
-     uText->nativeIndexingLimit = uText->chunkLength;
- 
--    return TRUE;
-+    return true;
- }
- 
- static int32_t uTextLatin1Extract(UText* uText, int64_t start, int64_t limit, UChar* dest, int32_t destCapacity, UErrorCode* status)
-@@ -337,7 +337,7 @@ static int64_t uTextLatin1ContextAwareNativeLength(UText* text)
- static UBool uTextLatin1ContextAwareAccess(UText* text, int64_t nativeIndex, UBool forward)
- {
-     if (!text->context)
--        return FALSE;
-+        return false;
-     int64_t nativeLength = uTextLatin1ContextAwareNativeLength(text);
-     UBool isAccessible;
-     if (uTextAccessInChunkOrOutOfRange(text, nativeIndex, nativeLength, forward, isAccessible))
-@@ -357,7 +357,7 @@ static UBool uTextLatin1ContextAwareAccess(UText* text, int64_t nativeIndex, UBo
-         ASSERT(newContext == UTextProviderContext::PriorContext);
-         textLatin1ContextAwareSwitchToPriorContext(text, nativeIndex, nativeLength, forward);
-     }
--    return TRUE;
-+    return true;
- }
- 
- static int32_t uTextLatin1ContextAwareExtract(UText*, int64_t, int64_t, UChar*, int32_t, UErrorCode* errorCode)
-diff --git a/Source/WTF/wtf/text/icu/UTextProviderUTF16.cpp b/Source/WTF/wtf/text/icu/UTextProviderUTF16.cpp
-index 69c8d091..9c3fa709 100644
---- a/Source/WTF/wtf/text/icu/UTextProviderUTF16.cpp
-+++ b/Source/WTF/wtf/text/icu/UTextProviderUTF16.cpp
-@@ -126,7 +126,7 @@ static inline int64_t uTextUTF16ContextAwareNativeLength(UText* text)
- static UBool uTextUTF16ContextAwareAccess(UText* text, int64_t nativeIndex, UBool forward)
- {
-     if (!text->context)
--        return FALSE;
-+        return false;
-     int64_t nativeLength = uTextUTF16ContextAwareNativeLength(text);
-     UBool isAccessible;
-     if (uTextAccessInChunkOrOutOfRange(text, nativeIndex, nativeLength, forward, isAccessible))
-@@ -146,7 +146,7 @@ static UBool uTextUTF16ContextAwareAccess(UText* text, int64_t nativeIndex, UBoo
-         ASSERT(newContext == UTextProviderContext::PriorContext);
-         textUTF16ContextAwareSwitchToPriorContext(text, nativeIndex, nativeLength, forward);
-     }
--    return TRUE;
-+    return true;
- }
- 
- static int32_t uTextUTF16ContextAwareExtract(UText*, int64_t, int64_t, UChar*, int32_t, UErrorCode* errorCode)
-diff --git a/Source/WebCore/platform/text/TextCodecICU.cpp b/Source/WebCore/platform/text/TextCodecICU.cpp
-index c2684939..e716a6fb 100644
---- a/Source/WebCore/platform/text/TextCodecICU.cpp
-+++ b/Source/WebCore/platform/text/TextCodecICU.cpp
-@@ -240,7 +240,7 @@ void TextCodecICU::createICUConverter() const
-     UErrorCode error = U_ZERO_ERROR;
-     m_converter = ICUConverterPtr { ucnv_open(m_canonicalConverterName, &error), ucnv_close };
-     if (m_converter)
--        ucnv_setFallback(m_converter.get(), TRUE);
-+        ucnv_setFallback(m_converter.get(), true);
- }
- 
- int TextCodecICU::decodeToBuffer(UChar* target, UChar* targetLimit, const char*& source, const char* sourceLimit, int32_t* offsets, bool flush, UErrorCode& error)
-diff --git a/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp b/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp
-index 61e3f605..5a51b9ec 100644
---- a/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp
-+++ b/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp
-@@ -402,7 +402,7 @@ DrawingAreaProxyCoordinatedGraphics::DrawingMonitor::~DrawingMonitor()
- int DrawingAreaProxyCoordinatedGraphics::DrawingMonitor::webViewDrawCallback(DrawingAreaProxyCoordinatedGraphics::DrawingMonitor* monitor)
- {
-     monitor->didDraw();
--    return FALSE;
-+    return false;
- }
- 
- void DrawingAreaProxyCoordinatedGraphics::DrawingMonitor::start(WTF::Function<void(CallbackBase::Error)>&& callback)
--- 
-2.25.1
-
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.30.4.bb
index 31370f3239..a16a676d7a 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb
@@ -18,9 +18,8 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-build-with-musl.patch \
            file://include_array.patch \
            file://include_xutil.patch \
-           file://0001-ICU-68.1-no-longer-exposes-FALSE-and-TRUE-macros-by-.patch \
            "
-SRC_URI[sha256sum] = "c467e0bc2bc610c2570928e3fd63cedaadc4719cbf9b04aa99f79dd71ad5682a"
+SRC_URI[sha256sum] = "d595a37c5001ff787266b155e303a5f2e5b48a6d466f2714c2f30c11392f7b24"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.20.1


--===============2397562482392500626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (0 cached, 807 parsed). 1416 targets, 48 skipped, 0 masked, 0 errors.
Removing 2 recipes from the armv7vet2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-0dc7be73f056600e1b35ebc348932098deb9ee4e"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0dc7be73f056600e1b35ebc348932098deb9ee4e"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 127 Found 116 Missed 11 Current 1048 (91% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1119 of 1175 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1120 of 1175 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1139 of 1175 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1140 of 1175 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sbc-1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1170 of 1175 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_packagedata_setscene)
NOTE: recipe sbc-1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1171 of 1175 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_packagedata_setscene)
NOTE: recipe sbc-1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-1.4-r0: task do_packagedata_setscene: Started
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
NOTE: recipe sbc-1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1173 of 1175 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_deploy_source_date_epoch_setscene)
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
NOTE: Running task 1084 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sbc-1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1175 of 1175 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2407 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_fetch)
NOTE: recipe webkitgtk-2.30.4-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_fetch: Succeeded
NOTE: Running task 2777 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_unpack)
NOTE: recipe webkitgtk-2.30.4-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 3303 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3304 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 4afa4bf6d6af0f9b0ec6cc54ada6a7b4e7df888546efb580903da42cd99138dd
NOTE: Running task 3483 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe webkitgtk-2.30.4-r0: task do_unpack: Succeeded
NOTE: Running task 3507 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_patch)
NOTE: recipe webkitgtk-2.30.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3508 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_patch: Succeeded
NOTE: Running task 3509 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_generate_toolchain_file)
NOTE: Running task 3510 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3511 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 1e18228b8ee309f68af63c67d03f1749bb3f69fe65279cea47e056c09bcfd14e
NOTE: recipe webkitgtk-2.30.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_populate_lic: Started
NOTE: Setscene tasks completed
NOTE: recipe webkitgtk-2.30.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 3594 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe webkitgtk-2.30.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_populate_lic unihash changed to 598fb62c1d96bfc805d6e345147e3aef7ae2599c533772e12c92b1f34371f1b2
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3628 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_configure)
NOTE: recipe webkitgtk-2.30.4-r0: task do_configure: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_configure: Succeeded
NOTE: Running task 3629 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_compile)
NOTE: recipe webkitgtk-2.30.4-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_compile: Succeeded
NOTE: Running task 3630 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_install)
NOTE: recipe webkitgtk-2.30.4-r0: task do_install: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_install: Succeeded
NOTE: Running task 3631 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_package)
NOTE: Running task 3632 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_populate_sysroot)
NOTE: recipe webkitgtk-2.30.4-r0: task do_package: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_package: Succeeded
NOTE: Running task 3633 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_packagedata)
NOTE: recipe webkitgtk-2.30.4-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3634 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_package_write_rpm)
NOTE: Running task 3635 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_package_qa)
NOTE: recipe webkitgtk-2.30.4-r0: task do_package_write_rpm: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_package_qa: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_package_qa: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3636 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_build)
NOTE: Tasks Summary: Attempted 3636 tasks of which 3615 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============2397562482392500626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (0 cached, 807 parsed). 1416 targets, 66 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-0dc7be73f056600e1b35ebc348932098deb9ee4e"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0dc7be73f056600e1b35ebc348932098deb9ee4e"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 122 Found 111 Missed 11 Current 1053 (90% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1124 of 1175 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1125 of 1175 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1173 of 1175 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_packagedata_setscene: Started
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1175 of 1175 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1084 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2407 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_fetch)
NOTE: recipe webkitgtk-2.30.4-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_fetch: Succeeded
NOTE: Running task 2806 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_unpack)
NOTE: recipe webkitgtk-2.30.4-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 3303 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3304 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 66ffbf0739ea4a70f7fc262363902d5eed0c8052d475b1a42659dcacb986d5de
NOTE: Running task 3483 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe webkitgtk-2.30.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3507 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_unpack: Succeeded
NOTE: Running task 3508 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_patch)
NOTE: recipe webkitgtk-2.30.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c23f7cf00e40a11df88ab6ad9600ca1a11c71db53b6ce62b3aebf6c2f935e59e
NOTE: Setscene tasks completed
NOTE: Running task 3595 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_patch: Succeeded
NOTE: Running task 3625 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_generate_toolchain_file)
NOTE: Running task 3626 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3627 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_populate_lic)
NOTE: recipe webkitgtk-2.30.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_populate_lic: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_populate_lic: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_populate_lic unihash changed to 598fb62c1d96bfc805d6e345147e3aef7ae2599c533772e12c92b1f34371f1b2
NOTE: Running task 3628 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_configure)
NOTE: recipe webkitgtk-2.30.4-r0: task do_configure: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_configure: Succeeded
NOTE: Running task 3629 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_compile)
NOTE: recipe webkitgtk-2.30.4-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_compile: Succeeded
NOTE: Running task 3630 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_install)
NOTE: recipe webkitgtk-2.30.4-r0: task do_install: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_install: Succeeded
NOTE: Running task 3631 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_package)
NOTE: Running task 3632 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_populate_sysroot)
NOTE: recipe webkitgtk-2.30.4-r0: task do_package: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_package: Succeeded
NOTE: Running task 3633 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_packagedata)
NOTE: recipe webkitgtk-2.30.4-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3634 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_package_write_rpm)
NOTE: Running task 3635 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_package_qa)
NOTE: recipe webkitgtk-2.30.4-r0: task do_package_write_rpm: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_package_qa: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_package_qa: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3636 of 3636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_build)
NOTE: Tasks Summary: Attempted 3636 tasks of which 3615 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============2397562482392500626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/webkitgtk: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk: SRC_URI changed from "https://www.webkitgtk.org/releases/webkitgtk-2.30.2.tar.xz file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch file://0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch file://0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch file://0001-Fix-build-with-musl.patch file://include_array.patch file://include_xutil.patch file://0001-ICU-68.1-no-longer-exposes-FALSE-and-TRUE-macros-by-.patch" to "https://www.webkitgtk.org/releases/webkitgtk-2.30.4.tar.xz file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch file://0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch file://0001-Enable-THREADS_PREFER_PTHREAD_FLAG.pa
 tch file://0001-Fix-build-with-musl.patch file://include_array.patch file://include_xutil.patch"
packages/core2-32-poky-linux/webkitgtk: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
Changes to packages/core2-32-poky-linux/webkitgtk (sysroot):
  /usr/lib/libjavascriptcoregtk-4.0.so.18 changed symlink target from libjavascriptcoregtk-4.0.so.18.17.10 to libjavascriptcoregtk-4.0.so.18.17.12
  /usr/lib/libwebkit2gtk-4.0.so.37 changed symlink target from libwebkit2gtk-4.0.so.37.49.6 to libwebkit2gtk-4.0.so.37.49.8
  /usr/lib/libjavascriptcoregtk-4.0.so.18.17.10 moved to /usr/lib/libjavascriptcoregtk-4.0.so.18.17.12
  /usr/lib/libwebkit2gtk-4.0.so.37.49.6 moved to /usr/lib/libwebkit2gtk-4.0.so.37.49.8
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dbg: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dbg: PKGSIZE changed from 2441215164 to 2441434876 (+0%)
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dbg: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dev: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dev: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-doc: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-doc: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ar: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ar: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-as: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-as: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-bg: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-bg: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ca: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ca: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-cs: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-cs: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-da: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-da: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-de: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-de: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-el: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-el: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-ca: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-ca: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-gb: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-gb: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eo: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eo: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-es: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-es: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-et: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-et: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eu: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eu: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fi: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fi: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fr: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fr: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gl: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gl: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gu: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gu: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-he: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-he: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hi: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hi: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hu: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hu: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-id: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-id: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-it: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-it: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ja: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ja: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-kn: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-kn: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ko: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ko: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lt: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lt: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lv: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lv: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ml: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ml: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-mr: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-mr: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nb: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nb: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nl: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nl: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-or: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-or: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pa: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pa: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pl: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pl: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt-br: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt-br: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ro: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ro: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ru: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ru: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sl: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sl: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr+latin: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr+latin: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sv: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sv: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ta: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ta: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-te: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-te: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-tr: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-tr: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-uk: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-uk: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-vi: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-vi: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-zh-cn: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-zh-cn: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-src: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-src: PKGSIZE changed from 135015775 to 135038408 (+0%)
packages/core2-32-poky-linux/webkitgtk/webkitgtk-src: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-staticdev: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-staticdev: PKGV changed from 2.30.2 [default] to 2.30.4 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk: PV changed from "2.30.2" to "2.30.4"
packages/core2-32-poky-linux/webkitgtk/webkitgtk: PKGSIZE changed from 71488916 to 71497108 (+0%)
packages/core2-32-poky-linux/webkitgtk/webkitgtk: PKGV changed from 2.30.2 [default] to 2.30.4 [default]

--===============2397562482392500626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/webkitgtk (sysroot):
  /usr/lib/libjavascriptcoregtk-4.0.so.18 changed symlink target from libjavascriptcoregtk-4.0.so.18.17.10 to libjavascriptcoregtk-4.0.so.18.17.12
  /usr/lib/libwebkit2gtk-4.0.so.37 changed symlink target from libwebkit2gtk-4.0.so.37.49.6 to libwebkit2gtk-4.0.so.37.49.8
  /usr/lib/libjavascriptcoregtk-4.0.so.18.17.10 moved to /usr/lib/libjavascriptcoregtk-4.0.so.18.17.12
  /usr/lib/libwebkit2gtk-4.0.so.37.49.6 moved to /usr/lib/libwebkit2gtk-4.0.so.37.49.8

--===============2397562482392500626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (0 cached, 807 parsed). 1416 targets, 57 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-0dc7be73f056600e1b35ebc348932098deb9ee4e"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0dc7be73f056600e1b35ebc348932098deb9ee4e"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 122 Found 111 Missed 11 Current 1046 (90% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1117 of 1168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1118 of 1168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1166 of 1168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_packagedata_setscene: Started
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1168 of 1168 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1084 of 3613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2387 of 3613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_fetch)
NOTE: recipe webkitgtk-2.30.4-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_fetch: Succeeded
NOTE: Running task 2739 of 3613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_unpack)
NOTE: recipe webkitgtk-2.30.4-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 3280 of 3613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3281 of 3613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to bafeab211f96dcc2837ea65d9a9c6a333eccd590b0b8e09cccb3f79a13753554
NOTE: Running task 3460 of 3613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe webkitgtk-2.30.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3484 of 3613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3ebd7986c834cbc527b39a873a77f5cc1ffb99642290f5adb5f91062e33f1954
NOTE: Setscene tasks completed
NOTE: recipe webkitgtk-2.30.4-r0: task do_unpack: Succeeded
NOTE: Running task 3552 of 3613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_patch)
NOTE: Running task 3572 of 3613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe webkitgtk-2.30.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_patch: Succeeded
NOTE: Running task 3602 of 3613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_generate_toolchain_file)
NOTE: Running task 3603 of 3613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3604 of 3613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_populate_lic)
NOTE: recipe webkitgtk-2.30.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_populate_lic: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_populate_lic unihash changed to 598fb62c1d96bfc805d6e345147e3aef7ae2599c533772e12c92b1f34371f1b2
NOTE: recipe webkitgtk-2.30.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3605 of 3613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_configure)
NOTE: recipe webkitgtk-2.30.4-r0: task do_configure: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_configure: Succeeded
NOTE: Running task 3606 of 3613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_compile)
NOTE: recipe webkitgtk-2.30.4-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_compile: Succeeded
NOTE: Running task 3607 of 3613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_install)
NOTE: recipe webkitgtk-2.30.4-r0: task do_install: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_install: Succeeded
NOTE: Running task 3608 of 3613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_package)
NOTE: Running task 3609 of 3613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_populate_sysroot)
NOTE: recipe webkitgtk-2.30.4-r0: task do_package: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_package: Succeeded
NOTE: Running task 3610 of 3613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_packagedata)
NOTE: recipe webkitgtk-2.30.4-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3611 of 3613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_package_write_rpm)
NOTE: Running task 3612 of 3613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_package_qa)
NOTE: recipe webkitgtk-2.30.4-r0: task do_package_write_rpm: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_package_qa: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_package_qa: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3613 of 3613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_build)
NOTE: Tasks Summary: Attempted 3613 tasks of which 3592 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============2397562482392500626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1416 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (806 cached, 1 parsed). 1416 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-0dc7be73f056600e1b35ebc348932098deb9ee4e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0dc7be73f056600e1b35ebc348932098deb9ee4e"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 127 Found 116 Missed 11 Current 1052 (91% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1123 of 1179 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1124 of 1179 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1143 of 1179 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1144 of 1179 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sbc-1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1174 of 1179 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1175 of 1179 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_packagedata_setscene)
NOTE: recipe sbc-1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_packagedata_setscene: Started
ERROR: sbc-1.4-r0 do_packagedata_setscene: QA Issue: Package version for package sbc-src went backwards which would break package feeds (from 0:1.5-r0 to 0:1.4-r0) [version-going-backwards]
ERROR: sbc-1.4-r0 do_packagedata_setscene: QA Issue: Package version for package sbc-dbg went backwards which would break package feeds (from 0:1.5-r0 to 0:1.4-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: sbc-1.4-r0 do_packagedata_setscene: QA Issue: Package version for package sbc-examples went backwards which would break package feeds (from 0:1.5-r0 to 0:1.4-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: sbc-1.4-r0 do_packagedata_setscene: QA Issue: Package version for package sbc-staticdev went backwards which would break package feeds (from 0:1.5-r0 to 0:1.4-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: sbc-1.4-r0 do_packagedata_setscene: QA Issue: Package version for package sbc-dev went backwards which would break package feeds (from 0:1.5-r0 to 0:1.4-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: sbc-1.4-r0 do_packagedata_setscene: QA Issue: Package version for package sbc-doc went backwards which would break package feeds (from 0:1.5-r0 to 0:1.4-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: sbc-1.4-r0 do_packagedata_setscene: QA Issue: Package version for package sbc-locale went backwards which would break package feeds (from 0:1.5-r0 to 0:1.4-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: sbc-1.4-r0 do_packagedata_setscene: QA Issue: Package version for package sbc went backwards which would break package feeds (from 0:1.5-r0 to 0:1.4-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1177 of 1179 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1179 of 1179 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sbc-1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1084 of 3654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe sbc-1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2425 of 3654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_fetch)
NOTE: recipe webkitgtk-2.30.4-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_fetch: Succeeded
NOTE: Running task 2773 of 3654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_unpack)
NOTE: recipe webkitgtk-2.30.4-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 3321 of 3654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3322 of 3654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to a0fc48f856059ca7065fbf60cb17fa4a7fe9d06056f047e8ab270a0d74051002
NOTE: Running task 3501 of 3654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3525 of 3654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe webkitgtk-2.30.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 11a36dd3e6523ca99b8465d468c380af9aea480f36275496f5948f18128795a3
NOTE: Setscene tasks completed
NOTE: Running task 3611 of 3654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe webkitgtk-2.30.4-r0: task do_unpack: Succeeded
NOTE: Running task 3642 of 3654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_patch: Succeeded
NOTE: Running task 3643 of 3654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_generate_toolchain_file)
NOTE: Running task 3644 of 3654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3645 of 3654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_populate_lic)
NOTE: recipe webkitgtk-2.30.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_populate_lic: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_populate_lic: Succeeded
NOTE: Running task 3646 of 3654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_populate_lic unihash changed to 598fb62c1d96bfc805d6e345147e3aef7ae2599c533772e12c92b1f34371f1b2
NOTE: recipe webkitgtk-2.30.4-r0: task do_configure: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_configure: Succeeded
NOTE: Running task 3647 of 3654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_compile)
NOTE: recipe webkitgtk-2.30.4-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_compile: Succeeded
NOTE: Running task 3648 of 3654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_install)
NOTE: recipe webkitgtk-2.30.4-r0: task do_install: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_install: Succeeded
NOTE: Running task 3649 of 3654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_package)
NOTE: Running task 3650 of 3654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_populate_sysroot)
NOTE: recipe webkitgtk-2.30.4-r0: task do_package: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_package: Succeeded
NOTE: Running task 3651 of 3654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_packagedata)
NOTE: recipe webkitgtk-2.30.4-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3652 of 3654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_package_write_rpm)
NOTE: Running task 3653 of 3654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_package_qa)
NOTE: recipe webkitgtk-2.30.4-r0: task do_package_write_rpm: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_package_qa: Started
NOTE: recipe webkitgtk-2.30.4-r0: task do_package_qa: Succeeded
NOTE: recipe webkitgtk-2.30.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3654 of 3654 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.30.4.bb:do_build)
NOTE: Tasks Summary: Attempted 3654 tasks of which 3633 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 15 ERROR messages shown, returning a non-zero exit code.

--===============2397562482392500626==--
