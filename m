Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.5171.1613463848621642100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id AA93338C1283
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:13 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pcmanfm: upgrading to 1.3.2 SUCCEEDED
Message-ID: <MADEUP.16642CD3A7C1D40A.16989@lists.openembedded.org>
X-Groupsio-MsgNum: 148150
Content-Type: multipart/mixed; boundary="===============7761768257534132174=="

--===============7761768257534132174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pcmanfm* to *1.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pcmanfm-upgrade-1.3.1-1.3.2.patch
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

--===============7761768257534132174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1428 targets, 41 skipped, 0 masked, 0 errors.
Removing 131 recipes from the core2-32 sysroot...done.
Removing 135 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-040df5f59654baa9b6466c033a69edb39753f57a"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:040df5f59654baa9b6466c033a69edb39753f57a"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 675 Found 623 Missed 52 Current 307 (92% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 308 of 982 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.10.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 311 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 313 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 314 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 315 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 316 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 317 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 318 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 319 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 320 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 321 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 322 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 323 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 326 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 328 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 329 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 331 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 332 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 333 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 335 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 336 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 337 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 338 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 341 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 342 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 343 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 344 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 345 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 347 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 349 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 351 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 352 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 353 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 354 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 355 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 356 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 357 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.10.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.10.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Started
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
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 358 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 359 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 361 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 362 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 363 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 364 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 365 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 366 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 367 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 368 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 369 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 370 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 371 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 372 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 373 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 374 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 375 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 376 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 378 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 380 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 381 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 382 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 383 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 384 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.4.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 385 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.10.0.bb:do_packagedata_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 386 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 387 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 389 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_package_write_rpm_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 390 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 392 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_package_write_rpm_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 393 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.45.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 394 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 396 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 397 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 398 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 399 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 400 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 401 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 402 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 406 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 408 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.10.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 409 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 411 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 412 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 413 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 414 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libepoxy-1.5.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 415 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 418 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 421 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 423 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 424 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 425 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 426 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.104-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_20.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 431 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 432 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 433 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 434 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 438 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 439 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 982 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.36.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 447 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_packagedata_setscene)
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: Running setscene task 451 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 458 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 462 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 463 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 466 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 467 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 468 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: Running setscene task 469 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 470 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 475 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 491 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 494 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 495 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 496 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 497 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 498 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libepoxy-1.5.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_20.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 499 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 500 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 501 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 502 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 503 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 504 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 505 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 506 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 507 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.47.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 509 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 518 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 543 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 546 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 547 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 548 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 549 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_deploy_setscene: Started
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 557 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 558 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 560 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe icu-68.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 561 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 562 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.47-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libepoxy-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 568 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 569 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 584 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 587 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_deploy_setscene: Succeeded
NOTE: recipe libcap-2.47-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 590 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 591 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 596 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 597 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 598 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 599 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-2.7.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 938 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_fetch)
NOTE: recipe libepoxy-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 963 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_fetch)
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 980 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 628 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running task 1033 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_fetch)
NOTE: Running task 1034 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_fetch)
NOTE: Running task 1035 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_fetch)
NOTE: Running task 1060 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_fetch)
NOTE: Running task 1061 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_fetch)
NOTE: Running task 1137 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_fetch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libfm-extra-1.3.1-r0: task do_fetch: Started
NOTE: Running setscene task 634 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: Running setscene task 635 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 636 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libfm-extra-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1244 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_unpack)
NOTE: recipe libexif-0.6.22-r0: task do_fetch: Started
NOTE: Running task 1245 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_unpack)
NOTE: Running task 1246 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe libexif-0.6.22-r0: task do_fetch: Succeeded
NOTE: recipe menu-cache-1.1.0-r0: task do_fetch: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-0.4.0-r0: task do_fetch: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libfm-1.3.1-r0: task do_fetch: Started
NOTE: recipe startup-notification-0.12-r2: task do_fetch: Started
NOTE: recipe libepoxy-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 641 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libfm-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1292 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_unpack)
NOTE: recipe startup-notification-0.12-r2: task do_fetch: Succeeded
NOTE: Running task 1293 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_unpack)
NOTE: Running task 1294 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_unpack)
NOTE: Running task 1309 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_unpack)
NOTE: Running task 1310 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 643 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 645 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 647 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 648 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 649 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 650 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 651 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe pcmanfm-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: Running task 1501 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_unpack)
NOTE: recipe libexif-0.6.22-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_unpack: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_unpack: Started
NOTE: recipe startup-notification-0.12-r2: task do_unpack: Started
NOTE: recipe libfm-1.3.1-r0: task do_unpack: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-2.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-util-0.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1514 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_patch)
NOTE: recipe startup-notification-0.12-r2: task do_unpack: Succeeded
NOTE: Running task 1515 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_patch)
NOTE: recipe startup-notification-0.12-r2: task do_patch: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1516 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe menu-cache-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libfm-extra-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1521 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_patch)
NOTE: Running task 1522 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_patch)
NOTE: recipe libexif-0.6.22-r0: task do_unpack: Succeeded
NOTE: Running task 1523 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1524 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_patch)
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe libfm-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1533 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_patch)
NOTE: Running task 1534 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-0.4.0-r0: task do_patch: Succeeded
NOTE: recipe menu-cache-1.1.0-r0: task do_patch: Started
NOTE: Running task 1535 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libfm-extra-1.3.1-r0: task do_patch: Started
NOTE: recipe libexif-0.6.22-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe startup-notification-0.12-r2: task do_patch: Succeeded
NOTE: recipe libfm-1.3.1-r0: task do_patch: Started
NOTE: Running task 1536 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-2.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe menu-cache-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-0.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1537 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libfm-extra-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 1538 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pcmanfm-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1539 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1540 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_populate_lic)
NOTE: recipe startup-notification-0.12-r2: task do_deploy_source_date_epoch: Started
NOTE: recipe libexif-0.6.22-r0: task do_patch: Succeeded
NOTE: recipe icu-68.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1541 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe menu-cache-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfm-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1542 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-0.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfm-extra-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_populate_lic: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 657 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libexif-0.6.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 662 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_populate_sysroot_setscene)
NOTE: recipe startup-notification-0.12-r2: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfm-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-2.7.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-68.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-68.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfm-extra-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_populate_lic: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_populate_lic unihash changed to fe861d90ad9d50f9be6276bc54a4a0850edd49fb20ebd2c17ff8f0f54d01eaeb
NOTE: recipe harfbuzz-2.7.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libexif-0.6.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfm-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 666 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 668 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 669 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_20.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_20.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 679 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 680 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.104-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 687 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_20.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.104-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 692 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 693 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdrm-2.4.104-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 695 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 698 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 699 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 700 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 701 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 704 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 705 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 708 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 709 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 710 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 713 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 716 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_unpack: Succeeded
NOTE: Running task 1593 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_patch)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 718 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 719 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 720 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.24-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-68.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 723 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_patch: Succeeded
NOTE: Running task 1627 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 729 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 730 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 731 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk+3-3.24.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-68.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 733 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 734 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 735 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 736 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 737 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 739 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 742 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-68.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 746 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 747 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 750 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-68.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 752 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 755 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 756 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 760 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 763 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 764 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 768 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 769 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 770 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 772 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 774 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 778 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 779 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 780 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 783 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 793 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 794 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 796 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.47.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 799 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 800 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 801 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 802 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 804 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 805 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.47.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 807 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 808 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 809 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.47-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1709 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe systemd-1_247.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 811 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 813 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 816 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 817 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running setscene task 819 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 820 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 821 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 822 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 825 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 826 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1719 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1720 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 827 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 829 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 831 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 832 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 833 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-2.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 835 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 836 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 837 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 838 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 839 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1756 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 841 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 842 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 843 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 844 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 845 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 846 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 847 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 848 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 849 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 851 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 853 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1766 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running setscene task 855 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 857 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 858 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 859 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: Running setscene task 861 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 864 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 865 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 866 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 867 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 868 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 869 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 871 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1784 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1805 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 873 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_packagedata_setscene)
NOTE: Running setscene task 874 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 875 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 876 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 877 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 878 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 880 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 882 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 883 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 884 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 885 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 891 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 895 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 896 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 897 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 898 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 899 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 900 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 901 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 902 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 903 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 904 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 906 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 907 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 908 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 909 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 910 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 911 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 912 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 913 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 914 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 916 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 917 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 918 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 919 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 920 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 921 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 922 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 923 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 924 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 925 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 927 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running setscene task 929 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1859 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 931 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 932 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 933 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 935 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 937 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 938 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 939 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 940 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 941 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 943 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 945 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 946 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 947 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 948 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 949 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 951 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 952 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 953 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1892 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 955 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 956 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 957 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 93e0e7aeb112d08033644aaddf772c7ec1b77e991074c4f3c566762e480becb9
NOTE: Running task 1898 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 960 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 961 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 962 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 964 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 965 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 966 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 967 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 968 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: Running setscene task 969 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 975 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 976 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 977 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 979 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 980 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 981 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 982 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 983 of 982 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2212 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2590 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2591 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libexif-0.6.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 055c4d134f82946839d7026b1c385802d69ba0394ea147e97f2f4e9ae021908c
NOTE: recipe libexif-0.6.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-util-0.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2973 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2976 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2981 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2991 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_configure)
NOTE: Running task 2992 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_configure)
NOTE: recipe libfm-extra-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libexif-0.6.22-r0: task do_configure: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3040 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3041 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_configure)
NOTE: recipe libfm-extra-1.3.1-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3042 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_configure)
NOTE: recipe gtk+3-3.24.24-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3043 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3044 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3045 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: Running task 3046 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3047 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe libexif-0.6.22-r0: task do_configure: Succeeded
NOTE: Running task 3048 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_compile)
NOTE: recipe libexif-0.6.22-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3049 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe libexif-0.6.22-r0: task do_compile: Succeeded
NOTE: Running task 3050 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_install)
NOTE: recipe libexif-0.6.22-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libexif-0.6.22-r0: task do_install: Succeeded
NOTE: Running task 3051 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_populate_sysroot)
NOTE: Running task 3052 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_package)
NOTE: recipe libexif-0.6.22-r0: task do_populate_sysroot: Started
NOTE: recipe libexif-0.6.22-r0: task do_package: Started
NOTE: recipe libexif-0.6.22-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xcb-util-0.4.0-r0: task do_configure: Succeeded
NOTE: Running task 3053 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_compile)
NOTE: recipe xcb-util-0.4.0-r0: task do_compile: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_compile: Succeeded
NOTE: Running task 3054 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_install)
NOTE: recipe xcb-util-0.4.0-r0: task do_install: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_install: Succeeded
NOTE: Running task 3055 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_populate_sysroot)
NOTE: Running task 3056 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_package)
NOTE: recipe xcb-util-0.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_package: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3057 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe startup-notification-0.12-r2: task do_prepare_recipe_sysroot: Started
NOTE: recipe libexif-0.6.22-r0: task do_package: Succeeded
NOTE: Running task 3058 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_packagedata)
NOTE: recipe startup-notification-0.12-r2: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3059 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_configure)
NOTE: recipe libexif-0.6.22-r0: task do_packagedata: Started
NOTE: recipe startup-notification-0.12-r2: task do_configure: Started
NOTE: recipe libexif-0.6.22-r0: task do_packagedata: Succeeded
NOTE: Running task 3060 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_package_write_rpm)
NOTE: recipe libexif-0.6.22-r0: task do_package_write_rpm: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_package: Succeeded
NOTE: Running task 3061 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_packagedata)
NOTE: recipe xcb-util-0.4.0-r0: task do_packagedata: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3062 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_package_write_rpm)
NOTE: recipe xcb-util-0.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe libexif-0.6.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xcb-util-0.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libfm-extra-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3063 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_compile)
NOTE: recipe libfm-extra-1.3.1-r0: task do_compile: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3064 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_install)
NOTE: recipe libfm-extra-1.3.1-r0: task do_install: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3065 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 3066 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_package)
NOTE: recipe libfm-extra-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_package: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3067 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe menu-cache-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 3068 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_packagedata)
NOTE: recipe menu-cache-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3069 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_configure)
NOTE: recipe libfm-extra-1.3.1-r0: task do_packagedata: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_configure: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3070 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_package_write_rpm)
NOTE: recipe libfm-extra-1.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe startup-notification-0.12-r2: task do_configure: Succeeded
NOTE: Running task 3071 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_compile)
NOTE: recipe libfm-extra-1.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe startup-notification-0.12-r2: task do_compile: Started
NOTE: recipe startup-notification-0.12-r2: task do_compile: Succeeded
NOTE: Running task 3072 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_install)
NOTE: recipe startup-notification-0.12-r2: task do_install: Started
NOTE: recipe startup-notification-0.12-r2: task do_install: Succeeded
NOTE: Running task 3073 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_package)
NOTE: Running task 3074 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_populate_sysroot)
NOTE: recipe startup-notification-0.12-r2: task do_populate_sysroot: Started
NOTE: recipe startup-notification-0.12-r2: task do_package: Started
NOTE: recipe startup-notification-0.12-r2: task do_populate_sysroot: Succeeded
NOTE: recipe startup-notification-0.12-r2: task do_package: Succeeded
NOTE: Running task 3075 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_packagedata)
NOTE: recipe startup-notification-0.12-r2: task do_packagedata: Started
NOTE: recipe startup-notification-0.12-r2: task do_packagedata: Succeeded
NOTE: Running task 3076 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_package_write_rpm)
NOTE: recipe startup-notification-0.12-r2: task do_package_write_rpm: Started
NOTE: recipe startup-notification-0.12-r2: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_configure: Succeeded
NOTE: Running task 3077 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_compile)
NOTE: recipe gtk+3-3.24.24-r0: task do_compile: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3078 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_compile)
NOTE: recipe menu-cache-1.1.0-r0: task do_compile: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3079 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_install)
NOTE: recipe menu-cache-1.1.0-r0: task do_install: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 3080 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 3081 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_package)
NOTE: recipe menu-cache-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_package: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe menu-cache-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 3082 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_packagedata)
NOTE: recipe menu-cache-1.1.0-r0: task do_packagedata: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3083 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_package_write_rpm)
NOTE: recipe menu-cache-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_compile: Succeeded
NOTE: Running task 3084 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_install)
NOTE: recipe gtk+3-3.24.24-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_install: Succeeded
NOTE: Running task 3085 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_populate_sysroot)
NOTE: Running task 3086 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_package)
NOTE: recipe gtk+3-3.24.24-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3087 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfm-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfm-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3092 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_configure)
NOTE: recipe libfm-1.3.1-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package: Succeeded
NOTE: Running task 3093 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.24-r0: task do_packagedata: Started
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
NOTE: recipe gtk+3-3.24.24-r0: task do_packagedata: Succeeded
NOTE: Running task 3097 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.24-r0: task do_package_write_rpm: Started
NOTE: recipe libfm-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3098 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_compile)
NOTE: recipe libfm-1.3.1-r0: task do_compile: Started
NOTE: recipe libfm-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3099 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_install)
NOTE: recipe libfm-1.3.1-r0: task do_install: Started
NOTE: recipe libfm-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3100 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_package)
NOTE: Running task 3101 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_populate_sysroot)
NOTE: recipe libfm-1.3.1-r0: task do_package: Started
NOTE: recipe libfm-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libfm-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3102 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pcmanfm-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3103 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_configure)
NOTE: recipe pcmanfm-1.3.2-r0: task do_configure: Started
NOTE: recipe libfm-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 3104 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_packagedata)
NOTE: recipe libfm-1.3.1-r0: task do_packagedata: Started
NOTE: recipe libfm-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3105 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_package_write_rpm)
NOTE: recipe libfm-1.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 3106 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_compile)
NOTE: recipe pcmanfm-1.3.2-r0: task do_compile: Started
NOTE: recipe libfm-1.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 3107 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_install)
NOTE: recipe pcmanfm-1.3.2-r0: task do_install: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 3108 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_package)
NOTE: Running task 3109 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_populate_sysroot)
NOTE: recipe pcmanfm-1.3.2-r0: task do_package: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 3110 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_packagedata)
NOTE: recipe pcmanfm-1.3.2-r0: task do_packagedata: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3111 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_package_write_rpm)
NOTE: Running task 3112 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_package_qa)
NOTE: recipe pcmanfm-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_package_qa: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_package_qa: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3113 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3113 tasks of which 2991 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 138 ERROR messages shown, returning a non-zero exit code.

--===============7761768257534132174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-sk: PKGSIZE changed from 12355 to 17119 (+39%)

--===============7761768257534132174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1428 targets, 49 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-040df5f59654baa9b6466c033a69edb39753f57a"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:040df5f59654baa9b6466c033a69edb39753f57a"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 56 Found 5 Missed 51 Current 911 (8% match, 94% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1073 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1836 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_fetch)
NOTE: Running task 1863 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_fetch)
NOTE: Running task 1912 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 1981 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_fetch)
NOTE: Running task 1982 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_fetch)
NOTE: Running task 1983 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_fetch)
NOTE: Running task 2042 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_fetch)
NOTE: Running task 2043 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_fetch)
NOTE: recipe libfm-extra-1.3.1-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_fetch: Started
NOTE: Running task 2168 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_fetch)
NOTE: recipe libfm-extra-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 2188 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2211 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe gtk+3-3.24.24-r0: task do_fetch: Succeeded
NOTE: Running task 2231 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_unpack)
NOTE: recipe menu-cache-1.1.0-r0: task do_fetch: Started
NOTE: recipe libexif-0.6.22-r0: task do_fetch: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_fetch: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_fetch: Succeeded
NOTE: recipe menu-cache-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libexif-0.6.22-r0: task do_fetch: Succeeded
NOTE: recipe startup-notification-0.12-r2: task do_fetch: Started
NOTE: Running task 2306 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_unpack)
NOTE: Running task 2307 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_unpack)
NOTE: Running task 2308 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_unpack)
NOTE: Running task 2309 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2310 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfm-1.3.1-r0: task do_fetch: Started
NOTE: recipe libfm-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe startup-notification-0.12-r2: task do_fetch: Succeeded
NOTE: Running task 2311 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_unpack)
NOTE: Running task 2335 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_unpack)
NOTE: recipe pcmanfm-1.3.2-r0: task do_fetch: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 2455 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_unpack)
NOTE: recipe gtk+3-3.24.24-r0: task do_unpack: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_unpack: Started
NOTE: recipe libexif-0.6.22-r0: task do_unpack: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_unpack: Started
NOTE: recipe libexif-0.6.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe startup-notification-0.12-r2: task do_unpack: Started
NOTE: recipe libfm-1.3.1-r0: task do_unpack: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_unpack: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_unpack: Started
NOTE: recipe startup-notification-0.12-r2: task do_unpack: Succeeded
NOTE: Running task 2734 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_patch)
NOTE: Running task 2757 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2835 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe libfm-extra-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 2836 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_patch)
NOTE: recipe xcb-util-0.4.0-r0: task do_patch: Started
NOTE: recipe startup-notification-0.12-r2: task do_patch: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2837 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 2838 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libexif-0.6.22-r0: task do_unpack: Succeeded
NOTE: recipe libfm-extra-1.3.1-r0: task do_patch: Started
NOTE: Running task 2839 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_patch)
NOTE: recipe libfm-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 2840 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_patch)
NOTE: recipe menu-cache-1.1.0-r0: task do_patch: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 2841 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_patch)
NOTE: recipe libexif-0.6.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe libexif-0.6.22-r0: task do_patch: Started
NOTE: Running task 2842 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libfm-1.3.1-r0: task do_patch: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_patch: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-0.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-util-0.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2843 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2844 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe startup-notification-0.12-r2: task do_patch: Succeeded
NOTE: Running task 2845 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libfm-extra-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2846 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libexif-0.6.22-r0: task do_patch: Succeeded
NOTE: Running task 2847 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_populate_lic)
NOTE: recipe xcb-util-0.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2848 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_deploy_source_date_epoch)
NOTE: recipe startup-notification-0.12-r2: task do_deploy_source_date_epoch: Started
NOTE: recipe libfm-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 2849 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2850 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2851 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe pcmanfm-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_populate_lic: Started
NOTE: recipe libexif-0.6.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfm-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe startup-notification-0.12-r2: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2852 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_configure)
NOTE: recipe pcmanfm-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_populate_lic unihash changed to fe861d90ad9d50f9be6276bc54a4a0850edd49fb20ebd2c17ff8f0f54d01eaeb
NOTE: recipe libexif-0.6.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2853 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_configure)
NOTE: recipe libfm-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-util-0.4.0-r0: task do_configure: Started
NOTE: recipe libexif-0.6.22-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 9be73892817ccae6a1679d6602b61f68cb686db2a571abe1d29b85f617ac1e25
NOTE: Running task 2921 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2924 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2925 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfm-extra-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2945 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_unpack: Succeeded
NOTE: Running task 2946 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_patch)
NOTE: recipe gtk+3-3.24.24-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 34ae1f9d59024cf3248f55464cec110c7b18e0eb3d540ee9ad905def0f031610
NOTE: Setscene tasks completed
NOTE: Running task 2981 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3000 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe libfm-extra-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3001 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_patch: Succeeded
NOTE: Running task 3002 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3003 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_configure)
NOTE: recipe gtk+3-3.24.24-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3004 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3005 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3006 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: Running task 3007 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe libexif-0.6.22-r0: task do_configure: Succeeded
NOTE: Running task 3008 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libexif-0.6.22-r0: task do_compile: Started
NOTE: recipe libexif-0.6.22-r0: task do_compile: Succeeded
NOTE: Running task 3009 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_install)
NOTE: recipe libexif-0.6.22-r0: task do_install: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_configure: Succeeded
NOTE: Running task 3010 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_compile)
NOTE: recipe libexif-0.6.22-r0: task do_install: Succeeded
NOTE: Running task 3011 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_populate_sysroot)
NOTE: Running task 3012 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_package)
NOTE: recipe xcb-util-0.4.0-r0: task do_compile: Started
NOTE: recipe libexif-0.6.22-r0: task do_populate_sysroot: Started
NOTE: recipe libexif-0.6.22-r0: task do_package: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_compile: Succeeded
NOTE: Running task 3013 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_install)
NOTE: recipe libexif-0.6.22-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xcb-util-0.4.0-r0: task do_install: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_install: Succeeded
NOTE: Running task 3014 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_populate_sysroot)
NOTE: Running task 3015 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_package)
NOTE: recipe xcb-util-0.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_package: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3016 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe startup-notification-0.12-r2: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3017 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe startup-notification-0.12-r2: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3018 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_configure)
NOTE: recipe startup-notification-0.12-r2: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3019 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe libexif-0.6.22-r0: task do_package: Succeeded
NOTE: Running task 3020 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_packagedata)
NOTE: recipe libexif-0.6.22-r0: task do_packagedata: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_package: Succeeded
NOTE: Running task 3021 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_packagedata)
NOTE: recipe xcb-util-0.4.0-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libexif-0.6.22-r0: task do_packagedata: Succeeded
NOTE: Running task 3022 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_package_write_rpm)
NOTE: recipe libexif-0.6.22-r0: task do_package_write_rpm: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3023 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_package_write_rpm)
NOTE: recipe xcb-util-0.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libexif-0.6.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libfm-extra-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3024 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_compile)
NOTE: recipe libfm-extra-1.3.1-r0: task do_compile: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3025 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_install)
NOTE: recipe libfm-extra-1.3.1-r0: task do_install: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3026 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 3027 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_package)
NOTE: recipe libfm-extra-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_package: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3028 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe startup-notification-0.12-r2: task do_configure: Succeeded
NOTE: Running task 3029 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_compile)
NOTE: recipe menu-cache-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe startup-notification-0.12-r2: task do_compile: Started
NOTE: recipe startup-notification-0.12-r2: task do_compile: Succeeded
NOTE: Running task 3030 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_install)
NOTE: recipe startup-notification-0.12-r2: task do_install: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3031 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_configure)
NOTE: recipe libfm-extra-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 3032 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_packagedata)
NOTE: recipe menu-cache-1.1.0-r0: task do_configure: Started
NOTE: recipe startup-notification-0.12-r2: task do_install: Succeeded
NOTE: recipe libfm-extra-1.3.1-r0: task do_packagedata: Started
NOTE: Running task 3033 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_package)
NOTE: Running task 3034 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_populate_sysroot)
NOTE: recipe startup-notification-0.12-r2: task do_package: Started
NOTE: recipe startup-notification-0.12-r2: task do_populate_sysroot: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3035 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_package_write_rpm)
NOTE: recipe libfm-extra-1.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe startup-notification-0.12-r2: task do_populate_sysroot: Succeeded
NOTE: recipe libfm-extra-1.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe startup-notification-0.12-r2: task do_package: Succeeded
NOTE: Running task 3036 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_packagedata)
NOTE: recipe startup-notification-0.12-r2: task do_packagedata: Started
NOTE: recipe startup-notification-0.12-r2: task do_packagedata: Succeeded
NOTE: Running task 3037 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_package_write_rpm)
NOTE: recipe startup-notification-0.12-r2: task do_package_write_rpm: Started
NOTE: recipe startup-notification-0.12-r2: task do_package_write_rpm: Succeeded
NOTE: recipe menu-cache-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3038 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_compile)
NOTE: recipe menu-cache-1.1.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_configure: Succeeded
NOTE: Running task 3039 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_compile)
NOTE: recipe menu-cache-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3040 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_install)
NOTE: recipe gtk+3-3.24.24-r0: task do_compile: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_install: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 3041 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 3042 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_package)
NOTE: recipe menu-cache-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_package: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe menu-cache-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 3043 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_packagedata)
NOTE: recipe menu-cache-1.1.0-r0: task do_packagedata: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3044 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_package_write_rpm)
NOTE: recipe menu-cache-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_compile: Succeeded
NOTE: Running task 3045 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_install)
NOTE: recipe gtk+3-3.24.24-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_install: Succeeded
NOTE: Running task 3046 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_populate_sysroot)
NOTE: Running task 3047 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_package)
NOTE: recipe gtk+3-3.24.24-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3048 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfm-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfm-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3053 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_configure)
NOTE: recipe libfm-1.3.1-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package: Succeeded
NOTE: Running task 3054 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.24-r0: task do_packagedata: Started
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
NOTE: recipe gtk+3-3.24.24-r0: task do_packagedata: Succeeded
NOTE: Running task 3058 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.24-r0: task do_package_write_rpm: Started
NOTE: recipe libfm-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3059 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_compile)
NOTE: recipe libfm-1.3.1-r0: task do_compile: Started
NOTE: recipe libfm-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3060 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_install)
NOTE: recipe libfm-1.3.1-r0: task do_install: Started
NOTE: recipe libfm-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3061 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_package)
NOTE: Running task 3062 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_populate_sysroot)
NOTE: recipe libfm-1.3.1-r0: task do_package: Started
NOTE: recipe libfm-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libfm-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3063 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pcmanfm-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3064 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_configure)
NOTE: recipe pcmanfm-1.3.2-r0: task do_configure: Started
NOTE: recipe libfm-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 3065 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_packagedata)
NOTE: recipe libfm-1.3.1-r0: task do_packagedata: Started
NOTE: recipe libfm-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3066 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_package_write_rpm)
NOTE: recipe libfm-1.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 3067 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_compile)
NOTE: recipe pcmanfm-1.3.2-r0: task do_compile: Started
NOTE: recipe libfm-1.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 3068 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_install)
NOTE: recipe pcmanfm-1.3.2-r0: task do_install: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 3069 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_package)
NOTE: Running task 3070 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_populate_sysroot)
NOTE: recipe pcmanfm-1.3.2-r0: task do_package: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 3071 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_packagedata)
NOTE: recipe pcmanfm-1.3.2-r0: task do_packagedata: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3072 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_package_write_rpm)
NOTE: Running task 3073 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_package_qa)
NOTE: recipe pcmanfm-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_package_qa: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_package_qa: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3074 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3074 tasks of which 2958 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 138 ERROR messages shown, returning a non-zero exit code.

--===============7761768257534132174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1428 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-040df5f59654baa9b6466c033a69edb39753f57a"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:040df5f59654baa9b6466c033a69edb39753f57a"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 56 Found 5 Missed 51 Current 911 (8% match, 94% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1072 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1836 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_fetch)
NOTE: Running task 1863 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_fetch)
NOTE: Running task 1912 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 1981 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_fetch)
NOTE: Running task 1982 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_fetch)
NOTE: Running task 1983 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_fetch)
NOTE: Running task 2042 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_fetch)
NOTE: Running task 2043 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_fetch)
NOTE: recipe libfm-extra-1.3.1-r0: task do_fetch: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: Running task 2164 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_unpack)
NOTE: Running task 2169 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_fetch)
NOTE: recipe gtk+3-3.24.24-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2204 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe libexif-0.6.22-r0: task do_fetch: Started
NOTE: Running task 2226 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_unpack)
NOTE: recipe xcb-util-0.4.0-r0: task do_fetch: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_fetch: Started
NOTE: recipe libexif-0.6.22-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-0.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2284 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_unpack)
NOTE: recipe startup-notification-0.12-r2: task do_fetch: Started
NOTE: Running task 2285 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2286 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_unpack)
NOTE: Running task 2287 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe menu-cache-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libfm-1.3.1-r0: task do_fetch: Started
NOTE: Running task 2288 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_unpack)
NOTE: recipe libfm-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe startup-notification-0.12-r2: task do_fetch: Succeeded
NOTE: Running task 2303 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_unpack)
NOTE: Running task 2304 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_unpack)
NOTE: recipe libfm-extra-1.3.1-r0: task do_unpack: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 2417 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_unpack)
NOTE: recipe gtk+3-3.24.24-r0: task do_unpack: Started
NOTE: recipe libexif-0.6.22-r0: task do_unpack: Started
NOTE: recipe libexif-0.6.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_unpack: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_unpack: Started
NOTE: recipe startup-notification-0.12-r2: task do_unpack: Started
NOTE: recipe libfm-1.3.1-r0: task do_unpack: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_unpack: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_unpack: Succeeded
NOTE: recipe startup-notification-0.12-r2: task do_unpack: Succeeded
NOTE: Running task 2695 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_patch)
NOTE: Running task 2715 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2829 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe libfm-extra-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe xcb-util-0.4.0-r0: task do_patch: Started
NOTE: Running task 2836 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_patch)
NOTE: recipe startup-notification-0.12-r2: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2837 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_patch)
NOTE: recipe libexif-0.6.22-r0: task do_unpack: Succeeded
NOTE: Running task 2838 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_patch)
NOTE: recipe libfm-extra-1.3.1-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 2839 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libfm-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 2840 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_patch)
NOTE: recipe xcb-util-0.4.0-r0: task do_patch: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 2841 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2842 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libexif-0.6.22-r0: task do_patch: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_patch: Started
NOTE: recipe libexif-0.6.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 2843 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libfm-1.3.1-r0: task do_patch: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_patch: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libexif-0.6.22-r0: task do_patch: Succeeded
NOTE: recipe menu-cache-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe startup-notification-0.12-r2: task do_patch: Succeeded
NOTE: Running task 2844 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_deploy_source_date_epoch)
NOTE: Running task 2845 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2846 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-0.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2847 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_configure)
NOTE: Running task 2848 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2849 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe pcmanfm-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 2850 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2851 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_populate_lic)
NOTE: recipe libfm-extra-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libexif-0.6.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe startup-notification-0.12-r2: task do_deploy_source_date_epoch: Started
NOTE: recipe libfm-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 2852 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-0.4.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_populate_lic: Started
NOTE: recipe libfm-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libexif-0.6.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2853 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_configure)
NOTE: recipe startup-notification-0.12-r2: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe menu-cache-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_populate_lic: Succeeded
NOTE: recipe libexif-0.6.22-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_populate_lic unihash changed to fe861d90ad9d50f9be6276bc54a4a0850edd49fb20ebd2c17ff8f0f54d01eaeb
NOTE: recipe pcmanfm-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfm-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 947b3f3eeb0dfbbf6b71a2570cf7038cea898c207019c744a3a1ca5df19e8530
NOTE: Running task 2921 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2924 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2925 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfm-extra-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2945 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0b1db967e13a1cce76dacb0a93759952734dd0c6028b6c011e72a5e0f26fbaff
NOTE: Setscene tasks completed
NOTE: Running task 2980 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_unpack: Succeeded
NOTE: Running task 2999 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_patch)
NOTE: recipe gtk+3-3.24.24-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3000 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3001 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_configure)
NOTE: recipe libfm-extra-1.3.1-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_patch: Succeeded
NOTE: Running task 3002 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3003 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_configure)
NOTE: recipe gtk+3-3.24.24-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3004 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3005 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3006 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: Running task 3007 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libexif-0.6.22-r0: task do_configure: Succeeded
NOTE: Running task 3008 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_compile)
NOTE: recipe libexif-0.6.22-r0: task do_compile: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_configure: Succeeded
NOTE: Running task 3009 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_compile)
NOTE: recipe libexif-0.6.22-r0: task do_compile: Succeeded
NOTE: Running task 3010 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_install)
NOTE: recipe xcb-util-0.4.0-r0: task do_compile: Started
NOTE: recipe libexif-0.6.22-r0: task do_install: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_compile: Succeeded
NOTE: Running task 3011 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_install)
NOTE: recipe xcb-util-0.4.0-r0: task do_install: Started
NOTE: recipe libexif-0.6.22-r0: task do_install: Succeeded
NOTE: Running task 3012 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_populate_sysroot)
NOTE: Running task 3013 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_package)
NOTE: recipe libexif-0.6.22-r0: task do_populate_sysroot: Started
NOTE: recipe libexif-0.6.22-r0: task do_package: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_install: Succeeded
NOTE: Running task 3014 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_populate_sysroot)
NOTE: Running task 3015 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_package)
NOTE: recipe xcb-util-0.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_package: Started
NOTE: recipe libexif-0.6.22-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xcb-util-0.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3016 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe startup-notification-0.12-r2: task do_prepare_recipe_sysroot: Started
NOTE: recipe startup-notification-0.12-r2: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3017 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3018 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe startup-notification-0.12-r2: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3019 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_package: Succeeded
NOTE: Running task 3020 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_packagedata)
NOTE: recipe xcb-util-0.4.0-r0: task do_packagedata: Started
NOTE: recipe libexif-0.6.22-r0: task do_package: Succeeded
NOTE: Running task 3021 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_packagedata)
NOTE: recipe libexif-0.6.22-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xcb-util-0.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3022 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_package_write_rpm)
NOTE: recipe xcb-util-0.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe libexif-0.6.22-r0: task do_packagedata: Succeeded
NOTE: Running task 3023 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_package_write_rpm)
NOTE: recipe libexif-0.6.22-r0: task do_package_write_rpm: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libexif-0.6.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libfm-extra-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3024 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_compile)
NOTE: recipe libfm-extra-1.3.1-r0: task do_compile: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3025 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_install)
NOTE: recipe libfm-extra-1.3.1-r0: task do_install: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3026 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 3027 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_package)
NOTE: recipe libfm-extra-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_package: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3028 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe startup-notification-0.12-r2: task do_configure: Succeeded
NOTE: Running task 3029 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_compile)
NOTE: recipe menu-cache-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe startup-notification-0.12-r2: task do_compile: Started
NOTE: recipe startup-notification-0.12-r2: task do_compile: Succeeded
NOTE: Running task 3030 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_install)
NOTE: recipe startup-notification-0.12-r2: task do_install: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3031 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_configure)
NOTE: recipe startup-notification-0.12-r2: task do_install: Succeeded
NOTE: Running task 3032 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_package)
NOTE: Running task 3033 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_populate_sysroot)
NOTE: recipe menu-cache-1.1.0-r0: task do_configure: Started
NOTE: recipe startup-notification-0.12-r2: task do_populate_sysroot: Started
NOTE: recipe startup-notification-0.12-r2: task do_package: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 3034 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_packagedata)
NOTE: recipe libfm-extra-1.3.1-r0: task do_packagedata: Started
NOTE: recipe startup-notification-0.12-r2: task do_populate_sysroot: Succeeded
NOTE: recipe libfm-extra-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3035 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_package_write_rpm)
NOTE: recipe libfm-extra-1.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe startup-notification-0.12-r2: task do_package: Succeeded
NOTE: Running task 3036 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_packagedata)
NOTE: recipe startup-notification-0.12-r2: task do_packagedata: Started
NOTE: recipe startup-notification-0.12-r2: task do_packagedata: Succeeded
NOTE: Running task 3037 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_package_write_rpm)
NOTE: recipe startup-notification-0.12-r2: task do_package_write_rpm: Started
NOTE: recipe startup-notification-0.12-r2: task do_package_write_rpm: Succeeded
NOTE: recipe menu-cache-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3038 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_compile)
NOTE: recipe menu-cache-1.1.0-r0: task do_compile: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3039 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_install)
NOTE: recipe menu-cache-1.1.0-r0: task do_install: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 3040 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 3041 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_package)
NOTE: recipe menu-cache-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_package: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_configure: Succeeded
NOTE: Running task 3042 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_compile)
NOTE: recipe gtk+3-3.24.24-r0: task do_compile: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 3043 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_packagedata)
NOTE: recipe menu-cache-1.1.0-r0: task do_packagedata: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3044 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_package_write_rpm)
NOTE: recipe menu-cache-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_compile: Succeeded
NOTE: Running task 3045 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_install)
NOTE: recipe gtk+3-3.24.24-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_install: Succeeded
NOTE: Running task 3046 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_populate_sysroot)
NOTE: Running task 3047 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_package)
NOTE: recipe gtk+3-3.24.24-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3048 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfm-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfm-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3053 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_configure)
NOTE: recipe libfm-1.3.1-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package: Succeeded
NOTE: Running task 3054 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.24-r0: task do_packagedata: Started
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
NOTE: recipe gtk+3-3.24.24-r0: task do_packagedata: Succeeded
NOTE: Running task 3058 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.24-r0: task do_package_write_rpm: Started
NOTE: recipe libfm-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3059 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_compile)
NOTE: recipe libfm-1.3.1-r0: task do_compile: Started
NOTE: recipe libfm-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3060 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_install)
NOTE: recipe libfm-1.3.1-r0: task do_install: Started
NOTE: recipe libfm-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3061 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_package)
NOTE: Running task 3062 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_populate_sysroot)
NOTE: recipe libfm-1.3.1-r0: task do_package: Started
NOTE: recipe libfm-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libfm-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3063 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pcmanfm-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3064 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_configure)
NOTE: recipe pcmanfm-1.3.2-r0: task do_configure: Started
NOTE: recipe libfm-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 3065 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_packagedata)
NOTE: recipe libfm-1.3.1-r0: task do_packagedata: Started
NOTE: recipe libfm-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3066 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_package_write_rpm)
NOTE: recipe libfm-1.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 3067 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_compile)
NOTE: recipe pcmanfm-1.3.2-r0: task do_compile: Started
NOTE: recipe libfm-1.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 3068 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_install)
NOTE: recipe pcmanfm-1.3.2-r0: task do_install: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 3069 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_package)
NOTE: Running task 3070 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_populate_sysroot)
NOTE: recipe pcmanfm-1.3.2-r0: task do_package: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 3071 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_packagedata)
NOTE: recipe pcmanfm-1.3.2-r0: task do_packagedata: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3072 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_package_write_rpm)
NOTE: Running task 3073 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_package_qa)
NOTE: recipe pcmanfm-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_package_qa: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_package_qa: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3074 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3074 tasks of which 2958 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 138 ERROR messages shown, returning a non-zero exit code.

--===============7761768257534132174==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-pcmanfm-upgrade-1.3.1-1.3.2.patch"

From 4461c2e3de8332f0047c53515c67370e6ec4638c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 16 Feb 2021 05:44:21 +0000
Subject: [PATCH] pcmanfm: upgrade 1.3.1 -> 1.3.2

---
 .../pcmanfm/{pcmanfm_1.3.1.bb => pcmanfm_1.3.2.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-sato/pcmanfm/{pcmanfm_1.3.1.bb => pcmanfm_1.3.2.bb} (90%)

diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
similarity index 90%
rename from meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb
rename to meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
index 7885e0abae..37723e9320 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
@@ -16,8 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.xz \
 	   file://emblem-symbolic-link.png \
 	   file://no-desktop.patch"
 
-SRC_URI[md5sum] = "d32ad2c9c7c52bff2004bbc120b53420"
-SRC_URI[sha256sum] = "6804043b3ee3a703edde41c724946174b505fe958703eadbd7e0876ece836855"
+SRC_URI[sha256sum] = "14cb7b247493c4cce65fbb5902611e3ad00a7a870fbc1e50adc50428c5140cf7"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/"
 
-- 
2.17.1


--===============7761768257534132174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1428 targets, 58 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-040df5f59654baa9b6466c033a69edb39753f57a"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:040df5f59654baa9b6466c033a69edb39753f57a"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 56 Found 5 Missed 51 Current 911 (8% match, 94% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1072 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1836 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_fetch)
NOTE: Running task 1863 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_fetch)
NOTE: Running task 1912 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 1981 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_fetch)
NOTE: Running task 1982 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_fetch)
NOTE: Running task 1983 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_fetch)
NOTE: Running task 2042 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_fetch)
NOTE: Running task 2043 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_fetch)
NOTE: recipe libfm-extra-1.3.1-r0: task do_fetch: Started
NOTE: Running task 2168 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_fetch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_fetch: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 2217 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2243 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe gtk+3-3.24.24-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-0.4.0-r0: task do_fetch: Started
NOTE: Running task 2269 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_unpack)
NOTE: recipe menu-cache-1.1.0-r0: task do_fetch: Started
NOTE: recipe libexif-0.6.22-r0: task do_fetch: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_fetch: Succeeded
NOTE: recipe startup-notification-0.12-r2: task do_fetch: Started
NOTE: Running task 2309 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_unpack)
NOTE: Running task 2310 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe menu-cache-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libexif-0.6.22-r0: task do_fetch: Succeeded
NOTE: Running task 2336 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_unpack)
NOTE: recipe libfm-1.3.1-r0: task do_fetch: Started
NOTE: recipe startup-notification-0.12-r2: task do_fetch: Succeeded
NOTE: Running task 2337 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_unpack)
NOTE: Running task 2338 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2339 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_unpack)
NOTE: recipe libfm-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_fetch: Started
NOTE: Running task 2403 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_unpack)
NOTE: recipe libfm-extra-1.3.1-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 2472 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_unpack)
NOTE: recipe gtk+3-3.24.24-r0: task do_unpack: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_unpack: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_unpack: Started
NOTE: recipe libexif-0.6.22-r0: task do_unpack: Started
NOTE: recipe libexif-0.6.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe startup-notification-0.12-r2: task do_unpack: Started
NOTE: recipe libfm-1.3.1-r0: task do_unpack: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2755 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_patch)
NOTE: recipe pcmanfm-1.3.2-r0: task do_unpack: Started
NOTE: recipe startup-notification-0.12-r2: task do_unpack: Succeeded
NOTE: Running task 2818 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2835 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe xcb-util-0.4.0-r0: task do_patch: Started
NOTE: recipe startup-notification-0.12-r2: task do_patch: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe menu-cache-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2836 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_patch)
NOTE: Running task 2837 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe xcb-util-0.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2838 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libexif-0.6.22-r0: task do_unpack: Succeeded
NOTE: Running task 2839 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-0.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2840 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_patch)
NOTE: recipe libfm-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe menu-cache-1.1.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2841 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_patch)
NOTE: recipe libfm-extra-1.3.1-r0: task do_patch: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 2842 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_patch)
NOTE: recipe libexif-0.6.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libexif-0.6.22-r0: task do_patch: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libfm-1.3.1-r0: task do_patch: Started
NOTE: Running task 2843 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libfm-extra-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_patch: Started
NOTE: Running task 2844 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe startup-notification-0.12-r2: task do_patch: Succeeded
NOTE: Running task 2845 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe menu-cache-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfm-extra-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2846 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_configure)
NOTE: recipe startup-notification-0.12-r2: task do_deploy_source_date_epoch: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 2847 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2848 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libexif-0.6.22-r0: task do_patch: Succeeded
NOTE: Running task 2849 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2850 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2851 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_deploy_source_date_epoch)
NOTE: recipe libfm-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 2852 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-util-0.4.0-r0: task do_configure: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libexif-0.6.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfm-extra-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe startup-notification-0.12-r2: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfm-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_populate_lic unihash changed to fe861d90ad9d50f9be6276bc54a4a0850edd49fb20ebd2c17ff8f0f54d01eaeb
NOTE: recipe pcmanfm-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libexif-0.6.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2853 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 517200faa79489c03aaee74d243275f29de67290a89364e59cd5fcf52c63e1e4
NOTE: Running task 2921 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfm-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2924 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe libexif-0.6.22-r0: task do_configure: Started
NOTE: Running task 2925 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfm-extra-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2945 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 4d36386f84f1f8a6eeadb3b159bce7be17a46afff77c0a8da00b9ade299130f5
NOTE: Setscene tasks completed
NOTE: Running task 2979 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.24-r0: task do_unpack: Succeeded
NOTE: Running task 2999 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libfm-extra-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3000 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_configure)
NOTE: Running task 3001 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe libfm-extra-1.3.1-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_patch: Succeeded
NOTE: Running task 3002 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3003 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_configure)
NOTE: recipe gtk+3-3.24.24-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3004 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3005 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3006 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: Running task 3007 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libexif-0.6.22-r0: task do_configure: Succeeded
NOTE: Running task 3008 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_compile)
NOTE: recipe libexif-0.6.22-r0: task do_compile: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_configure: Succeeded
NOTE: Running task 3009 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_compile)
NOTE: recipe xcb-util-0.4.0-r0: task do_compile: Started
NOTE: recipe libexif-0.6.22-r0: task do_compile: Succeeded
NOTE: Running task 3010 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_install)
NOTE: recipe xcb-util-0.4.0-r0: task do_compile: Succeeded
NOTE: Running task 3011 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_install)
NOTE: recipe libexif-0.6.22-r0: task do_install: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_install: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_install: Succeeded
NOTE: Running task 3012 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_populate_sysroot)
NOTE: Running task 3013 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_package)
NOTE: recipe libexif-0.6.22-r0: task do_install: Succeeded
NOTE: Running task 3014 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_populate_sysroot)
NOTE: Running task 3015 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_package)
NOTE: recipe xcb-util-0.4.0-r0: task do_package: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe libexif-0.6.22-r0: task do_populate_sysroot: Started
NOTE: recipe libexif-0.6.22-r0: task do_package: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3016 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libexif-0.6.22-r0: task do_populate_sysroot: Succeeded
NOTE: recipe startup-notification-0.12-r2: task do_prepare_recipe_sysroot: Started
NOTE: recipe startup-notification-0.12-r2: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3017 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_configure)
NOTE: recipe startup-notification-0.12-r2: task do_configure: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_package: Succeeded
NOTE: Running task 3018 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_packagedata)
NOTE: recipe xcb-util-0.4.0-r0: task do_packagedata: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3019 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_package_write_rpm)
NOTE: recipe xcb-util-0.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe libexif-0.6.22-r0: task do_package: Succeeded
NOTE: Running task 3020 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_packagedata)
NOTE: recipe libexif-0.6.22-r0: task do_packagedata: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libexif-0.6.22-r0: task do_packagedata: Succeeded
NOTE: Running task 3021 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_package_write_rpm)
NOTE: recipe libexif-0.6.22-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3022 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe libexif-0.6.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3023 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3024 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_compile)
NOTE: recipe libfm-extra-1.3.1-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libfm-extra-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3025 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_install)
NOTE: recipe libfm-extra-1.3.1-r0: task do_install: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3026 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 3027 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_package)
NOTE: recipe libfm-extra-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_package: Started
NOTE: recipe startup-notification-0.12-r2: task do_configure: Succeeded
NOTE: Running task 3028 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_compile)
NOTE: recipe startup-notification-0.12-r2: task do_compile: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3029 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe menu-cache-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe startup-notification-0.12-r2: task do_compile: Succeeded
NOTE: Running task 3030 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_install)
NOTE: recipe startup-notification-0.12-r2: task do_install: Started
NOTE: recipe startup-notification-0.12-r2: task do_install: Succeeded
NOTE: Running task 3031 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_package)
NOTE: Running task 3032 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_populate_sysroot)
NOTE: recipe startup-notification-0.12-r2: task do_package: Started
NOTE: recipe startup-notification-0.12-r2: task do_populate_sysroot: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3033 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_configure)
NOTE: recipe libfm-extra-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 3034 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_packagedata)
NOTE: recipe menu-cache-1.1.0-r0: task do_configure: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_packagedata: Started
NOTE: recipe startup-notification-0.12-r2: task do_populate_sysroot: Succeeded
NOTE: recipe libfm-extra-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3035 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_package_write_rpm)
NOTE: recipe libfm-extra-1.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe startup-notification-0.12-r2: task do_package: Succeeded
NOTE: Running task 3036 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_packagedata)
NOTE: recipe startup-notification-0.12-r2: task do_packagedata: Started
NOTE: recipe startup-notification-0.12-r2: task do_packagedata: Succeeded
NOTE: Running task 3037 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_package_write_rpm)
NOTE: recipe startup-notification-0.12-r2: task do_package_write_rpm: Started
NOTE: recipe startup-notification-0.12-r2: task do_package_write_rpm: Succeeded
NOTE: recipe menu-cache-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3038 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_compile)
NOTE: recipe menu-cache-1.1.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_configure: Succeeded
NOTE: Running task 3039 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_compile)
NOTE: recipe gtk+3-3.24.24-r0: task do_compile: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3040 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_install)
NOTE: recipe menu-cache-1.1.0-r0: task do_install: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 3041 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 3042 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_package)
NOTE: recipe menu-cache-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_package: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe menu-cache-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 3043 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_packagedata)
NOTE: recipe menu-cache-1.1.0-r0: task do_packagedata: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3044 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_package_write_rpm)
NOTE: recipe menu-cache-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_compile: Succeeded
NOTE: Running task 3045 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_install)
NOTE: recipe gtk+3-3.24.24-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_install: Succeeded
NOTE: Running task 3046 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_populate_sysroot)
NOTE: Running task 3047 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_package)
NOTE: recipe gtk+3-3.24.24-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3048 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfm-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfm-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3053 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_configure)
NOTE: recipe libfm-1.3.1-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package: Succeeded
NOTE: Running task 3054 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.24-r0: task do_packagedata: Started
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
NOTE: recipe libfm-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3055 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_compile)
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
NOTE: recipe libfm-1.3.1-r0: task do_compile: Started
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
NOTE: recipe gtk+3-3.24.24-r0: task do_packagedata: Succeeded
NOTE: Running task 3059 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.24-r0: task do_package_write_rpm: Started
NOTE: recipe libfm-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3060 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_install)
NOTE: recipe libfm-1.3.1-r0: task do_install: Started
NOTE: recipe libfm-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3061 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_package)
NOTE: Running task 3062 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_populate_sysroot)
NOTE: recipe libfm-1.3.1-r0: task do_package: Started
NOTE: recipe libfm-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libfm-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3063 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pcmanfm-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3064 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_configure)
NOTE: recipe pcmanfm-1.3.2-r0: task do_configure: Started
NOTE: recipe libfm-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 3065 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_packagedata)
NOTE: recipe libfm-1.3.1-r0: task do_packagedata: Started
NOTE: recipe libfm-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3066 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_package_write_rpm)
NOTE: recipe libfm-1.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 3067 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_compile)
NOTE: recipe pcmanfm-1.3.2-r0: task do_compile: Started
NOTE: recipe libfm-1.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 3068 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_install)
NOTE: recipe gtk+3-3.24.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_install: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 3069 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_package)
NOTE: Running task 3070 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_populate_sysroot)
NOTE: recipe pcmanfm-1.3.2-r0: task do_package: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 3071 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_packagedata)
NOTE: recipe pcmanfm-1.3.2-r0: task do_packagedata: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3072 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_package_write_rpm)
NOTE: Running task 3073 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_package_qa)
NOTE: recipe pcmanfm-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_package_qa: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_package_qa: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3074 of 3074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3074 tasks of which 2958 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 138 ERROR messages shown, returning a non-zero exit code.

--===============7761768257534132174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1428 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (809 cached, 1 parsed). 1428 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-040df5f59654baa9b6466c033a69edb39753f57a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:040df5f59654baa9b6466c033a69edb39753f57a"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 56 Found 5 Missed 51 Current 915 (8% match, 94% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1072 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1854 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_fetch)
NOTE: Running task 1881 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_fetch)
NOTE: Running task 1930 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 1999 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_fetch)
NOTE: Running task 2000 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_fetch)
NOTE: Running task 2001 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_fetch)
NOTE: Running task 2060 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_fetch)
NOTE: Running task 2061 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_fetch)
NOTE: recipe libfm-extra-1.3.1-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_fetch: Started
NOTE: Running task 2186 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_fetch)
NOTE: recipe libfm-extra-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 2210 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe xcb-util-0.4.0-r0: task do_fetch: Started
NOTE: recipe libexif-0.6.22-r0: task do_fetch: Started
NOTE: Running task 2245 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe menu-cache-1.1.0-r0: task do_fetch: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libexif-0.6.22-r0: task do_fetch: Succeeded
NOTE: Running task 2301 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_unpack)
NOTE: Running task 2302 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_unpack)
NOTE: Running task 2303 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe menu-cache-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 2304 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe startup-notification-0.12-r2: task do_fetch: Started
NOTE: Running task 2305 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_unpack)
NOTE: recipe startup-notification-0.12-r2: task do_fetch: Succeeded
NOTE: recipe libfm-1.3.1-r0: task do_fetch: Started
NOTE: recipe libfm-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 2350 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_unpack)
NOTE: Running task 2361 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_unpack)
NOTE: recipe pcmanfm-1.3.2-r0: task do_fetch: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_unpack: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: Running task 2448 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_unpack)
NOTE: recipe xcb-util-0.4.0-r0: task do_unpack: Started
NOTE: recipe libexif-0.6.22-r0: task do_unpack: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libexif-0.6.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_fetch: Succeeded
NOTE: recipe menu-cache-1.1.0-r0: task do_unpack: Started
NOTE: recipe startup-notification-0.12-r2: task do_unpack: Started
NOTE: Running task 2600 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_unpack)
NOTE: recipe libfm-1.3.1-r0: task do_unpack: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2671 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_patch)
NOTE: recipe pcmanfm-1.3.2-r0: task do_unpack: Started
NOTE: recipe startup-notification-0.12-r2: task do_unpack: Succeeded
NOTE: Running task 2786 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2853 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe xcb-util-0.4.0-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_unpack: Started
NOTE: recipe startup-notification-0.12-r2: task do_patch: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 2854 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_patch)
NOTE: recipe menu-cache-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: Running task 2855 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_patch)
NOTE: recipe libexif-0.6.22-r0: task do_unpack: Succeeded
NOTE: Running task 2856 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 2857 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libexif-0.6.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libfm-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libfm-extra-1.3.1-r0: task do_patch: Started
NOTE: Running task 2858 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_patch)
NOTE: recipe pcmanfm-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 2859 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_patch)
NOTE: recipe xcb-util-0.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-util-0.4.0-r0: task do_patch: Succeeded
NOTE: recipe menu-cache-1.1.0-r0: task do_patch: Started
NOTE: Running task 2860 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libexif-0.6.22-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfm-1.3.1-r0: task do_patch: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 2861 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pcmanfm-1.3.2-r0: task do_patch: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2862 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe startup-notification-0.12-r2: task do_patch: Succeeded
NOTE: Running task 2863 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libexif-0.6.22-r0: task do_patch: Succeeded
NOTE: recipe libfm-extra-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2864 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_deploy_source_date_epoch)
NOTE: recipe pcmanfm-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2865 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2866 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_populate_lic)
NOTE: recipe menu-cache-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfm-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 2867 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe startup-notification-0.12-r2: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2868 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_configure)
NOTE: recipe libexif-0.6.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libfm-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2869 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2870 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libfm-extra-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe menu-cache-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-util-0.4.0-r0: task do_configure: Started
NOTE: recipe startup-notification-0.12-r2: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libexif-0.6.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2871 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_configure)
NOTE: recipe pcmanfm-1.3.2-r0: task do_populate_lic: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_populate_lic unihash changed to fe861d90ad9d50f9be6276bc54a4a0850edd49fb20ebd2c17ff8f0f54d01eaeb
NOTE: recipe pcmanfm-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfm-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libexif-0.6.22-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 2e06541ff4c1e71ad371a85f393c3f35ed840fa219ee311f9a83df5e15081efc
NOTE: Running task 2939 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2942 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2943 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfm-extra-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2963 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 664e107f7e4384d7a71270232afba85e211fe63f8509de7e39ef4650d4c4d829
NOTE: Setscene tasks completed
NOTE: Running task 2997 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_unpack: Succeeded
NOTE: Running task 3017 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_patch)
NOTE: recipe gtk+3-3.24.24-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libfm-extra-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3018 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_configure)
NOTE: Running task 3019 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe libfm-extra-1.3.1-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3020 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_patch: Succeeded
NOTE: Running task 3021 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3022 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_configure)
NOTE: recipe gtk+3-3.24.24-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3023 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3024 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: Running task 3025 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe libexif-0.6.22-r0: task do_configure: Succeeded
NOTE: Running task 3026 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libexif-0.6.22-r0: task do_compile: Started
NOTE: recipe libexif-0.6.22-r0: task do_compile: Succeeded
NOTE: Running task 3027 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_install)
NOTE: recipe libexif-0.6.22-r0: task do_install: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_configure: Succeeded
NOTE: Running task 3028 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_compile)
NOTE: recipe libexif-0.6.22-r0: task do_install: Succeeded
NOTE: Running task 3029 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_populate_sysroot)
NOTE: Running task 3030 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_package)
NOTE: recipe xcb-util-0.4.0-r0: task do_compile: Started
NOTE: recipe libexif-0.6.22-r0: task do_populate_sysroot: Started
NOTE: recipe libexif-0.6.22-r0: task do_package: Started
NOTE: recipe libexif-0.6.22-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xcb-util-0.4.0-r0: task do_compile: Succeeded
NOTE: Running task 3031 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_install)
NOTE: recipe xcb-util-0.4.0-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3032 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe xcb-util-0.4.0-r0: task do_install: Succeeded
NOTE: Running task 3033 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_populate_sysroot)
NOTE: Running task 3034 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3035 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe xcb-util-0.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3036 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe startup-notification-0.12-r2: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe startup-notification-0.12-r2: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3037 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_configure)
NOTE: recipe startup-notification-0.12-r2: task do_configure: Started
NOTE: recipe libexif-0.6.22-r0: task do_package: Succeeded
NOTE: Running task 3038 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_packagedata)
NOTE: recipe libexif-0.6.22-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xcb-util-0.4.0-r0: task do_package: Succeeded
NOTE: Running task 3039 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_packagedata)
NOTE: recipe xcb-util-0.4.0-r0: task do_packagedata: Started
NOTE: recipe libexif-0.6.22-r0: task do_packagedata: Succeeded
NOTE: Running task 3040 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libexif/libexif_0.6.22.bb:do_package_write_rpm)
NOTE: recipe libexif-0.6.22-r0: task do_package_write_rpm: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3041 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xcb-util_0.4.0.bb:do_package_write_rpm)
NOTE: recipe xcb-util-0.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe xcb-util-0.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libexif-0.6.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libfm-extra-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3042 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_compile)
NOTE: recipe libfm-extra-1.3.1-r0: task do_compile: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3043 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_install)
NOTE: recipe libfm-extra-1.3.1-r0: task do_install: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3044 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 3045 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_package)
NOTE: recipe libfm-extra-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_package: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3046 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe menu-cache-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3047 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_configure)
NOTE: recipe libfm-extra-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 3048 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_packagedata)
NOTE: recipe menu-cache-1.1.0-r0: task do_configure: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_packagedata: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3049 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm-extra_1.3.1.bb:do_package_write_rpm)
NOTE: recipe libfm-extra-1.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe startup-notification-0.12-r2: task do_configure: Succeeded
NOTE: Running task 3050 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_compile)
NOTE: recipe startup-notification-0.12-r2: task do_compile: Started
NOTE: recipe libfm-extra-1.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe startup-notification-0.12-r2: task do_compile: Succeeded
NOTE: Running task 3051 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_install)
NOTE: recipe startup-notification-0.12-r2: task do_install: Started
NOTE: recipe startup-notification-0.12-r2: task do_install: Succeeded
NOTE: Running task 3052 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_package)
NOTE: Running task 3053 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_populate_sysroot)
NOTE: recipe startup-notification-0.12-r2: task do_package: Started
NOTE: recipe startup-notification-0.12-r2: task do_populate_sysroot: Started
NOTE: recipe startup-notification-0.12-r2: task do_populate_sysroot: Succeeded
NOTE: recipe startup-notification-0.12-r2: task do_package: Succeeded
NOTE: Running task 3054 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_packagedata)
NOTE: recipe startup-notification-0.12-r2: task do_packagedata: Started
NOTE: recipe startup-notification-0.12-r2: task do_packagedata: Succeeded
NOTE: Running task 3055 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb:do_package_write_rpm)
NOTE: recipe startup-notification-0.12-r2: task do_package_write_rpm: Started
NOTE: recipe startup-notification-0.12-r2: task do_package_write_rpm: Succeeded
NOTE: recipe menu-cache-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3056 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_compile)
NOTE: recipe menu-cache-1.1.0-r0: task do_compile: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3057 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_install)
NOTE: recipe menu-cache-1.1.0-r0: task do_install: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 3058 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 3059 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_package)
NOTE: recipe menu-cache-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_package: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe menu-cache-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 3060 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_packagedata)
NOTE: recipe menu-cache-1.1.0-r0: task do_packagedata: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3061 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb:do_package_write_rpm)
NOTE: recipe menu-cache-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe menu-cache-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_configure: Succeeded
NOTE: Running task 3062 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_compile)
NOTE: recipe gtk+3-3.24.24-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_compile: Succeeded
NOTE: Running task 3063 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_install)
NOTE: recipe gtk+3-3.24.24-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_install: Succeeded
NOTE: Running task 3064 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_populate_sysroot)
NOTE: Running task 3065 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_package)
NOTE: recipe gtk+3-3.24.24-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3066 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfm-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfm-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3071 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_configure)
NOTE: recipe libfm-1.3.1-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package: Succeeded
NOTE: Running task 3072 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.24-r0: task do_packagedata: Started
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
ERROR: gtk+3-3.24.24-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.25-r0 to 0:3.24.24-r0) [version-going-backwards]
NOTE: recipe gtk+3-3.24.24-r0: task do_packagedata: Succeeded
NOTE: Running task 3076 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.24-r0: task do_package_write_rpm: Started
NOTE: recipe libfm-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3077 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_compile)
NOTE: recipe libfm-1.3.1-r0: task do_compile: Started
NOTE: recipe libfm-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3078 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_install)
NOTE: recipe libfm-1.3.1-r0: task do_install: Started
NOTE: recipe libfm-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3079 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_package)
NOTE: Running task 3080 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_populate_sysroot)
NOTE: recipe libfm-1.3.1-r0: task do_package: Started
NOTE: recipe libfm-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libfm-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3081 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pcmanfm-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3082 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_configure)
NOTE: recipe pcmanfm-1.3.2-r0: task do_configure: Started
NOTE: recipe libfm-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 3083 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_packagedata)
NOTE: recipe libfm-1.3.1-r0: task do_packagedata: Started
NOTE: recipe libfm-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3084 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libfm/libfm_1.3.1.bb:do_package_write_rpm)
NOTE: recipe libfm-1.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 3085 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_compile)
NOTE: recipe pcmanfm-1.3.2-r0: task do_compile: Started
NOTE: recipe libfm-1.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 3086 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_install)
NOTE: recipe pcmanfm-1.3.2-r0: task do_install: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 3087 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_package)
NOTE: Running task 3088 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_populate_sysroot)
NOTE: recipe pcmanfm-1.3.2-r0: task do_package: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 3089 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_packagedata)
NOTE: recipe pcmanfm-1.3.2-r0: task do_packagedata: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3090 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_package_write_rpm)
NOTE: Running task 3091 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_package_qa)
NOTE: recipe pcmanfm-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_package_qa: Started
NOTE: recipe pcmanfm-1.3.2-r0: task do_package_qa: Succeeded
NOTE: recipe pcmanfm-1.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3092 of 3092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3092 tasks of which 2976 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 138 ERROR messages shown, returning a non-zero exit code.

--===============7761768257534132174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/pcmanfm: SRC_URI changed from "https://downloads.sourceforge.net/pcmanfm/pcmanfm-1.3.1.tar.xz file://gnome-fs-directory.png file://gnome-fs-regular.png file://gnome-mime-text-plain.png file://emblem-symbolic-link.png file://no-desktop.patch" to "https://downloads.sourceforge.net/pcmanfm/pcmanfm-1.3.2.tar.xz file://gnome-fs-directory.png file://gnome-fs-regular.png file://gnome-mime-text-plain.png file://emblem-symbolic-link.png file://no-desktop.patch"
packages/core2-32-poky-linux/pcmanfm: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-dbg: PKGSIZE changed from 579984 to 579720 (-0%)
packages/core2-32-poky-linux/pcmanfm/pcmanfm-dbg: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-dbg: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-dev: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-dev: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-doc: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-doc: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-ar: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-ar: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-be: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-be: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-bg: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-bg: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-bn: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-bn: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-ca: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-ca: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-cs: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-cs: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-da: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-da: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-de: PKGSIZE changed from 23668 to 24357 (+3%)
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-de: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-de: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-el: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-el: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-en-gb: PKGSIZE changed from 11191 to 11258 (+1%)
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-en-gb: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-en-gb: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-es: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-es: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-et: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-et: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-eu: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-eu: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-fa: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-fa: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-fi: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-fi: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-fo: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-fo: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-fr: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-fr: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-gl: PKGSIZE changed from 24629 to 24616 (-0%)
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-gl: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-gl: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-he: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-he: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-hr: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-hr: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-hu: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-hu: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-id: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-id: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-is: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-is: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-it: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-it: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-ja: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-ja: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-kk: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-kk: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-km: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-km: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-ko: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-ko: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-lg: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-lg: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-lt: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-lt: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-lv: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-lv: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-ms: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-ms: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-nl: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-nl: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-pa: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-pa: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-pl: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-pl: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-pt-br: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-pt-br: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-pt: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-pt: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-ro: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-ro: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-ru: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-ru: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-si: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-si: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-sk: PKGSIZE changed from 12355 to 17119 (+39%)
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-sk: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-sk: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-sl: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-sl: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-sr+latin: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-sr+latin: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-sr: PKGSIZE changed from 30878 to 30970 (+0%)
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-sr: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-sr: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-sv: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-sv: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-te: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-te: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-th: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-th: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-tr: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-tr: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-tt-ru: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-tt-ru: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-ug: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-ug: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-uk: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-uk: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-vi: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-vi: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-zh-cn: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-zh-cn: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-zh-tw: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-locale-zh-tw: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-src: PKGSIZE changed from 542184 to 542320 (+0%)
packages/core2-32-poky-linux/pcmanfm/pcmanfm-src: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-src: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm-staticdev: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm-staticdev: PV changed from "1.3.1" to "1.3.2"
packages/core2-32-poky-linux/pcmanfm/pcmanfm: PKGSIZE changed from 413961 to 414020 (+0%)
packages/core2-32-poky-linux/pcmanfm/pcmanfm: PKGV changed from 1.3.1 [default] to 1.3.2 [default]
packages/core2-32-poky-linux/pcmanfm/pcmanfm: PV changed from "1.3.1" to "1.3.2"

--===============7761768257534132174==--
