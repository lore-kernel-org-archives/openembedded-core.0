Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.25792.1623000258224554248
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 1B85038C1256
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Jun 2021 17:24:18 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-tools: upgrading to 1.2.5 SUCCEEDED
Message-ID: <MADEUP.16860E22E1EE3968.23614@lists.openembedded.org>
X-Groupsio-MsgNum: 152733
Content-Type: multipart/mixed; boundary="===============4919812587736990985=="

--===============4919812587736990985==
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

--===============4919812587736990985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 816 .bb files complete (0 cached, 816 parsed). 1452 targets, 41 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-3e5e7733504192ac0cf3e2a2bb5295874303b151"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3e5e7733504192ac0cf3e2a2bb5295874303b151"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 723 Local 711 Network 0 Missed 12 Current 320 (98% match, 98% complete)
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
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 370 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 372 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 373 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 374 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 375 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 376 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 377 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 378 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 379 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 380 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 381 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 382 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 383 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 384 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 385 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 386 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 387 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 388 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 389 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 390 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 391 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 392 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 393 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 394 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 395 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 396 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 397 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 398 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 399 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 400 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 402 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 403 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 404 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 405 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 406 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 408 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 410 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_package_write_rpm_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 411 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 412 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 413 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 414 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 416 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 417 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 418 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 419 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 420 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 425 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 426 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.106-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 429 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 430 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 431 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 433 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 434 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 435 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 436 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 437 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 440 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 441 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 443 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 444 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 445 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm_setscene)
NOTE: recipe pango-1.48.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 446 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 447 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.106-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 448 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 449 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 450 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 451 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 452 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 453 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: Running setscene task 454 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 455 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 456 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 457 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 458 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 459 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 460 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 461 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 462 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 463 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 467 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.7.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 470 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 477 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 488 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 492 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 493 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 494 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 497 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 498 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 499 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 500 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 501 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 502 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 503 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 504 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 505 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 506 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 509 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 514 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 515 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 516 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 517 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 518 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 521 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 522 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 523 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 524 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 525 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 526 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 529 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_deploy_setscene: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 538 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 539 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 540 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 541 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 542 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_package_write_rpm_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 545 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe icu-69.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_deploy_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 554 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 555 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 556 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 557 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.49-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 558 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 559 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 567 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-69.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 577 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 580 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 586 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1116 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_fetch)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 613 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 615 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 621 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 625 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe alsa-tools-1.2.5-r0: task do_fetch: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 1455 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 640 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.48.5-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_unpack: Started
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 644 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.48.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 655 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 656 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 664 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 672 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.48.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 1574 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_patch)
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 686 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe alsa-tools-1.2.5-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 690 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 692 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 1591 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1592 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_lic)
NOTE: Running setscene task 699 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_lic: Started
NOTE: recipe pango-1.48.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 707 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_lic: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_lic unihash changed to a14572522eb191203c16efba153ccf1702b982b4294cb35b73f2167a5d451388
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 714 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-69.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-69.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 718 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-69.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 722 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 723 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 726 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 728 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 733 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 735 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 738 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 739 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 740 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 741 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 746 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 747 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_21.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 749 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-src went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
NOTE: recipe mesa-2_21.1.1-r0: task do_populate_sysroot_setscene: Started
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-dbg went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-staticdev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-dev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-doc went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Started
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-locale went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 753 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 755 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 756 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 757 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 759 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_21.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 760 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 761 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 762 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 764 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 766 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 768 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.106-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 770 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_21.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 772 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 773 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 774 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 775 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 776 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 777 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-69.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 779 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 781 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 783 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.106-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_21.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.106-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 787 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_21.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 789 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 791 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdrm-2.4.106-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 793 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 794 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 796 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 799 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 801 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 803 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 804 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 805 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 809 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 810 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 811 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 812 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 813 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 816 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 820 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 821 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 823 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 824 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 825 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 826 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 827 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 828 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 829 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 833 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 835 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 836 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 837 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 839 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 841 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 842 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 843 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 848 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 849 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 850 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 851 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 852 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 853 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 854 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 855 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 856 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 857 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 858 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 859 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 860 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 861 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_packagedata_setscene)
NOTE: Running setscene task 862 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 863 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 864 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1783 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 866 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: Running setscene task 868 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe libcap-2.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1790 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running task 1791 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 870 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.49-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 872 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 874 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 875 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 876 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 877 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 878 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 879 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 880 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 882 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 884 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: Running setscene task 886 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 888 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 889 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 890 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1819 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 892 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: Running setscene task 893 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 894 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 895 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 896 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 898 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 899 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 900 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 901 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 902 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 903 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 904 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 905 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 906 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1838 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 908 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 910 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 912 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1847 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 914 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 915 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 916 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 918 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 920 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 922 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 923 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 924 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 925 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 926 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: Running setscene task 928 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1856 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 930 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 932 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 934 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 935 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 936 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 937 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 938 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 939 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 940 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 941 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 942 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 943 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 944 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 945 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 946 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 947 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 948 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 949 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 950 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 951 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 952 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 955 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-3.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 962 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 963 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 964 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 965 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 966 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 967 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 968 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 969 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 971 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1895 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 972 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 974 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 975 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 976 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 977 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 978 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 979 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 980 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 981 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 982 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 983 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 984 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 986 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 988 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 990 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 992 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 993 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 994 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 996 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1952 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 998 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 999 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1000 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1001 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1002 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e4fc2bea8e1e3db5d8f7ac9d518459201e9f688ddc73f029dd979756a0d0ad5d
NOTE: Running task 1961 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1005 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1007 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1008 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1009 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1010 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1011 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1013 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1014 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1015 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1017 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1018 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1019 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1021 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1022 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1023 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1025 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1026 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1027 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1028 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1029 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1030 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1036 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1037 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1038 of 1043 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
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
NOTE: Running task 2303 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to ae023dad6456b560f7f98aa4e88b652beaab405a67ba50d2d02c6da8d168a200
NOTE: Running task 3210 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-tools-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3273 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_configure)
NOTE: recipe alsa-tools-1.2.5-r0: task do_configure: Started
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
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_qa: Succeeded
NOTE: Running noexec task 3281 of 3281 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_build)
NOTE: Tasks Summary: Attempted 3281 tasks of which 3255 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============4919812587736990985==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-alsa-tools-upgrade-1.2.2-1.2.5.patch"

From dc5220de513b8b4ec127f5b2e4b327a43f1b76d3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 6 Jun 2021 15:34:41 +0000
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


--===============4919812587736990985==
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
DISTRO_VERSION       = "3.3+snapshot-3e5e7733504192ac0cf3e2a2bb5295874303b151"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3e5e7733504192ac0cf3e2a2bb5295874303b151"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 23 Local 12 Network 0 Missed 11 Current 1005 (52% match, 98% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1011 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1012 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1014 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1021 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1023 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1024 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Started
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-src went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-src went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-dbg went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dbg went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-staticdev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-server went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-dev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-conf went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-doc went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package libatopology went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-locale went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-staticdev went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dev went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-doc went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-locale went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
NOTE: Running task 1109 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1026 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1028 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2311 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_fetch)
NOTE: recipe alsa-tools-1.2.5-r0: task do_fetch: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 2744 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 3036 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3037 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 3038 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_patch)
NOTE: recipe alsa-tools-1.2.5-r0: task do_patch: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 3039 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3040 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to a8696e704c99cc59615f43f4ade37486103a54ed0fa00837ab731a5a39076f1c
NOTE: Running task 3138 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-tools-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_lic: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3161 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_lic: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_lic unihash changed to a14572522eb191203c16efba153ccf1702b982b4294cb35b73f2167a5d451388
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f375887b6676e4b3e599da54f7d8296740821993a123d53f1b0a0f328db6805f
NOTE: Setscene tasks completed
NOTE: Running task 3217 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3234 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_configure)
NOTE: recipe alsa-tools-1.2.5-r0: task do_configure: Started
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
NOTE: Tasks Summary: Attempted 3242 tasks of which 3222 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 17 ERROR messages shown, returning a non-zero exit code.

--===============4919812587736990985==
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
DISTRO_VERSION       = "3.3+snapshot-3e5e7733504192ac0cf3e2a2bb5295874303b151"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3e5e7733504192ac0cf3e2a2bb5295874303b151"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 23 Local 12 Network 0 Missed 11 Current 1005 (52% match, 98% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1011 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1012 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1014 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1021 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1109 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1023 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1024 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_packagedata_setscene)
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-src went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-dbg went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-staticdev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-dev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-doc went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-locale went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1026 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch_setscene)
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-src went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dbg went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-server went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-conf went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package libatopology went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-staticdev went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Started
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dev went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-doc went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-locale went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1028 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 2308 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_fetch: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 2556 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe alsa-tools-1.2.5-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 3036 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3037 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 3038 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_patch)
NOTE: recipe alsa-tools-1.2.5-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to af8664518cbc6402031640163c4390c955100a45cde311e8b3b1c7b30b30ef23
NOTE: Running task 3136 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-tools-1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 3137 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3160 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_lic)
NOTE: recipe alsa-tools-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3161 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_lic unihash changed to a14572522eb191203c16efba153ccf1702b982b4294cb35b73f2167a5d451388
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 93756c671474c35a2671dda5ef84a5d04884ce64292016de139a9612b8f1bfeb
NOTE: Setscene tasks completed
NOTE: Running task 3217 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3234 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_configure)
NOTE: recipe alsa-tools-1.2.5-r0: task do_configure: Started
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
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_package_qa: Succeeded
NOTE: Running noexec task 3242 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_build)
NOTE: Tasks Summary: Attempted 3242 tasks of which 3222 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 17 ERROR messages shown, returning a non-zero exit code.

--===============4919812587736990985==
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
DISTRO_VERSION       = "3.3+snapshot-3e5e7733504192ac0cf3e2a2bb5295874303b151"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3e5e7733504192ac0cf3e2a2bb5295874303b151"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 23 Local 12 Network 0 Missed 11 Current 1005 (52% match, 98% complete)
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1011 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1012 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1014 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1021 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1023 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1024 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata_setscene: Started
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-src went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-dbg went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-staticdev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-dev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-doc went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-src went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-locale went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dbg went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-server went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-conf went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package libatopology went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-staticdev went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dev went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-doc went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-locale went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
NOTE: Running task 1109 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Succeeded
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1026 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1028 of 1028 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2311 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_fetch)
NOTE: recipe alsa-tools-1.2.5-r0: task do_fetch: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 2706 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 3036 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3037 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe alsa-tools-1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 3038 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_patch: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 3039 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3040 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 18ff1335989c10daf887d231d18248f4253445e601e18dc205b8b6a777f9bd7f
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_lic: Started
NOTE: Running task 3138 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-tools-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_lic unihash changed to a14572522eb191203c16efba153ccf1702b982b4294cb35b73f2167a5d451388
NOTE: recipe alsa-tools-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3161 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b9e21ab3b31a31ce3eb7b137c75c027a08c8977bb36ec7d973653c0701679a8f
NOTE: Setscene tasks completed
NOTE: Running task 3217 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3234 of 3242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_configure)
NOTE: recipe alsa-tools-1.2.5-r0: task do_configure: Started
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
NOTE: Tasks Summary: Attempted 3242 tasks of which 3222 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 17 ERROR messages shown, returning a non-zero exit code.

--===============4919812587736990985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1452 entries from dependency cache.
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
DISTRO_VERSION       = "3.3+snapshot-3e5e7733504192ac0cf3e2a2bb5295874303b151"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3e5e7733504192ac0cf3e2a2bb5295874303b151"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 23 Local 12 Network 0 Missed 11 Current 1009 (52% match, 98% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1015 of 1032 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1016 of 1032 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1018 of 1032 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1025 of 1032 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1027 of 1032 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1028 of 1032 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1110 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-src went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-dbg went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-staticdev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-dev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-doc went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi-locale went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata_setscene: QA Issue: Package version for package libxi went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-src went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dbg went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-server went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-conf went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package libatopology went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-staticdev went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Succeeded
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dev went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-doc went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-locale went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib went backwards which would break package feeds (from 0:1.2.5-r0 to 0:1.2.4-r0) [version-going-backwards]
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1030 of 1032 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1032 of 1032 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2329 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_fetch)
NOTE: recipe alsa-tools-1.2.5-r0: task do_fetch: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 2683 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 3054 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3055 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe alsa-tools-1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 3056 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_patch: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 3057 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3058 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 8e80df8e3c154258d07017b0fffc2fdf741c69e23789e2227ad5fca7b03eec1a
NOTE: Running task 3156 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-tools-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_lic: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-tools-1.2.5-r0: task do_populate_lic: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_populate_lic unihash changed to a14572522eb191203c16efba153ccf1702b982b4294cb35b73f2167a5d451388
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3179 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 70976806914b80e0b2d21ca75441b1fe883e77187b4c6b289081eb49492d3b04
NOTE: Setscene tasks completed
NOTE: Running task 3235 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-tools-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3252 of 3260 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb:do_configure)
NOTE: recipe alsa-tools-1.2.5-r0: task do_configure: Started
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
NOTE: Tasks Summary: Attempted 3260 tasks of which 3240 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 17 ERROR messages shown, returning a non-zero exit code.

--===============4919812587736990985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/alsa-tools/alsa-tools-dbg: PV changed from "1.2.2" to "1.2.5"
packages/core2-32-poky-linux/alsa-tools/alsa-tools-dbg: PKGV changed from 1.2.2 [default] to 1.2.5 [default]
packages/core2-32-poky-linux/alsa-tools/alsa-tools-dev: PV changed from "1.2.2" to "1.2.5"
packages/core2-32-poky-linux/alsa-tools/alsa-tools-dev: PKGV changed from 1.2.2 [default] to 1.2.5 [default]
packages/core2-32-poky-linux/alsa-tools/alsa-tools-doc: PV changed from "1.2.2" to "1.2.5"
packages/core2-32-poky-linux/alsa-tools/alsa-tools-doc: PKGV changed from 1.2.2 [default] to 1.2.5 [default]
packages/core2-32-poky-linux/alsa-tools/alsa-tools-locale: PV changed from "1.2.2" to "1.2.5"
packages/core2-32-poky-linux/alsa-tools/alsa-tools-locale: PKGV changed from 1.2.2 [default] to 1.2.5 [default]
packages/core2-32-poky-linux/alsa-tools/alsa-tools-src: PV changed from "1.2.2" to "1.2.5"
packages/core2-32-poky-linux/alsa-tools/alsa-tools-src: PKGV changed from 1.2.2 [default] to 1.2.5 [default]
packages/core2-32-poky-linux/alsa-tools/alsa-tools-staticdev: PV changed from "1.2.2" to "1.2.5"
packages/core2-32-poky-linux/alsa-tools/alsa-tools-staticdev: PKGV changed from 1.2.2 [default] to 1.2.5 [default]
packages/core2-32-poky-linux/alsa-tools/alsa-tools: PV changed from "1.2.2" to "1.2.5"
packages/core2-32-poky-linux/alsa-tools/alsa-tools: PKGV changed from 1.2.2 [default] to 1.2.5 [default]
packages/core2-32-poky-linux/alsa-tools: PV changed from "1.2.2" to "1.2.5"
packages/core2-32-poky-linux/alsa-tools: SRC_URI changed from "https://www.alsa-project.org/files/pub/tools/alsa-tools-1.2.2.tar.bz2" to "https://www.alsa-project.org/files/pub/tools/alsa-tools-1.2.5.tar.bz2"
packages/core2-32-poky-linux/alsa-tools: PKGV changed from 1.2.2 [default] to 1.2.5 [default]

--===============4919812587736990985==--
