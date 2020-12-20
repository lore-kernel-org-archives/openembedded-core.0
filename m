Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.23992.1608473714053594195
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id A7ABF38C13B4
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:15 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 84cb4c6701e027090ff3fd955ce08065e20121b2 SUCCEEDED
Message-ID: <MADEUP.16527252CF3CE2AF.27420@lists.openembedded.org>
X-Groupsio-MsgNum: 145976
Content-Type: multipart/mixed; boundary="===============2550028149804578882=="

--===============2550028149804578882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *84cb4c6701e027090ff3fd955ce08065e20121b2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-puzzles-upgrade-to-latest-revision.patch
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

--===============2550028149804578882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (0 cached, 807 parsed). 1416 targets, 41 skipped, 0 masked, 0 errors.
Removing 130 recipes from the core2-32 sysroot...done.
Removing 134 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-2364c48eb2b5528a0bd8e1a005051104e1ad7a8a"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2364c48eb2b5528a0bd8e1a005051104e1ad7a8a"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 651 Found 639 Missed 12 Current 299 (98% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 300 of 950 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 301 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 302 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 305 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 306 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 307 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 308 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 311 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 312 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 313 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 314 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 315 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 316 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 317 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 318 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 319 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 320 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 321 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 322 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 323 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 326 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 328 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 332 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 333 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 335 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 336 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 337 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 338 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 339 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 341 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 342 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 343 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 344 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 345 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 347 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 349 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 351 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 352 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 353 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 354 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 355 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 356 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 357 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 358 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 359 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 360 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 361 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 362 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 363 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 364 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 365 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 366 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 368 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 369 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 370 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 371 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 373 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 374 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 375 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 376 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 377 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 378 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 379 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 380 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_package_write_rpm_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 381 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 382 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 385 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 386 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 388 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 389 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 390 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 397 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 398 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 399 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 400 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 401 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 402 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 403 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 404 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 405 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 406 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 407 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 408 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 411 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 412 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 415 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 417 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 418 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 419 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 421 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 422 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 425 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 427 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 428 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 429 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 430 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 431 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 432 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 433 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 950 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 451 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 452 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 453 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 454 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 455 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 458 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 464 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 473 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 478 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 482 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 484 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 485 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 486 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 487 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 488 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 489 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 490 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 492 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 493 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 494 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 495 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 496 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 497 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 498 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 509 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 510 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 511 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 512 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 514 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 515 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 516 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package_write_rpm_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 521 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_packagedata_setscene)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe icu-68.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 524 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 529 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 530 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 531 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running setscene task 534 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running setscene task 536 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 543 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe icu-68.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 546 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_packagedata_setscene)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running setscene task 548 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 554 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_deploy_source_date_epoch_setscene)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running setscene task 555 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 1068 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_fetch: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running setscene task 580 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running task 1427 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 587 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 589 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 590 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 596 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 598 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot_setscene)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_unpack: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1486 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: Running setscene task 603 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 605 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 608 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 611 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 613 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 614 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 616 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 617 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 621 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 625 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.1.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 627 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 628 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 629 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 631 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 634 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 636 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-68.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-68.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_patch: Succeeded
NOTE: Running task 1513 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1514 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_populate_lic: Started
NOTE: Running setscene task 639 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe icu-68.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 646 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 649 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 654 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 656 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-68.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 657 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to be466991359b4e2617da30c68e8a3c592c97542da2be86ffba1c1d36ab6a99f4
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 659 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 664 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-68.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 667 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-68.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 669 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 671 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_packagedata_setscene)
NOTE: Running setscene task 672 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_20.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 678 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 679 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 680 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 682 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 685 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 687 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 689 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 690 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 691 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 693 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 696 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 698 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 699 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 700 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 701 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 704 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 707 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 709 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 711 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 713 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 716 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 719 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 723 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 724 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 727 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 730 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 732 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 735 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 736 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 737 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 738 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 742 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 745 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 748 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 750 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 752 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 759 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 760 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 761 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 764 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 768 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 769 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 771 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 772 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 776 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1676 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 779 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 781 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: Running setscene task 783 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 784 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 786 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 787 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 788 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: Running setscene task 789 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 791 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 1686 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1687 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 795 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 797 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 799 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 800 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 801 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 803 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 805 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 806 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 807 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1726 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 809 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 810 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 811 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 812 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 813 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 814 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 815 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 816 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 817 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 819 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 821 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1733 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 823 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 825 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 826 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 827 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 829 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 831 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 833 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 834 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 835 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 836 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 837 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 839 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1746 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1768 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 841 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 843 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 845 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_packagedata_setscene)
NOTE: Running setscene task 846 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 847 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 848 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 849 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 850 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 851 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 852 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 853 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 856 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 864 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 865 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 866 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 867 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 868 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 869 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 870 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 871 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 872 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 873 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 875 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 876 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 877 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 878 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 879 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 880 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 881 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 882 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 883 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 884 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 885 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 886 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 887 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 888 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 889 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 890 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 891 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1786 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 892 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 895 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 897 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 898 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 899 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 900 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 901 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 903 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 905 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 906 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 907 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 908 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 909 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 911 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 913 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 914 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 915 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 916 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 917 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 919 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 920 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 921 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 923 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1863 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 924 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 925 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 927 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 928 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 929 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ac9535620c869a5ab0014bf3b6f9b8138e6f7b60a06f668c27308a6b7faf6f5c
NOTE: Running task 1867 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 932 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 933 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 934 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 935 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 936 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 937 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 943 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 944 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 945 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 947 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 948 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 949 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 950 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 951 of 950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2175 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 6c0422073d22e07b8d4a881cee113af4d2adac7abce1d859c2ffb593aace9791
NOTE: Running task 2972 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3021 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_configure: Succeeded
NOTE: Running task 3022 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_compile: Succeeded
NOTE: Running task 3023 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_install: Succeeded
NOTE: Running task 3024 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 3025 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package: Succeeded
NOTE: Running task 3026 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_packagedata: Succeeded
NOTE: Running task 3027 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 3028 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3029 of 3029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 3029 tasks of which 3003 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There were 138 ERROR messages shown, returning a non-zero exit code.

--===============2550028149804578882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (0 cached, 807 parsed). 1416 targets, 48 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-2364c48eb2b5528a0bd8e1a005051104e1ad7a8a"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2364c48eb2b5528a0bd8e1a005051104e1ad7a8a"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 115 Found 104 Missed 11 Current 820 (90% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 890 of 935 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 915 of 935 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1079 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 933 of 935 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2122 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_fetch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2550 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_unpack: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2815 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_patch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2816 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running setscene task 935 of 935 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 2817 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_patch: Succeeded
NOTE: Running task 2822 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2823 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 4afa4bf6d6af0f9b0ec6cc54ada6a7b4e7df888546efb580903da42cd99138dd
NOTE: Running task 2904 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2922 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_populate_lic: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to be466991359b4e2617da30c68e8a3c592c97542da2be86ffba1c1d36ab6a99f4
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 1e18228b8ee309f68af63c67d03f1749bb3f69fe65279cea47e056c09bcfd14e
NOTE: Setscene tasks completed
NOTE: Running task 2960 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2982 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_configure: Succeeded
NOTE: Running task 2983 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_compile: Succeeded
NOTE: Running task 2984 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_install: Succeeded
NOTE: Running task 2985 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2986 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package: Succeeded
NOTE: Running task 2987 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_packagedata: Succeeded
NOTE: Running task 2988 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2989 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2990 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2990 tasks of which 2970 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 138 ERROR messages shown, returning a non-zero exit code.

--===============2550028149804578882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (0 cached, 807 parsed). 1416 targets, 66 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-2364c48eb2b5528a0bd8e1a005051104e1ad7a8a"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2364c48eb2b5528a0bd8e1a005051104e1ad7a8a"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 115 Found 104 Missed 11 Current 820 (90% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 890 of 935 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 915 of 935 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1078 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 933 of 935 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata_setscene: Started
NOTE: Running task 2122 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_fetch: Succeeded
NOTE: Running task 2501 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_unpack: Succeeded
NOTE: Running task 2815 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2816 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2817 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_patch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2818 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2819 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 66ffbf0739ea4a70f7fc262363902d5eed0c8052d475b1a42659dcacb986d5de
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_deploy_source_date_epoch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_populate_lic: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to be466991359b4e2617da30c68e8a3c592c97542da2be86ffba1c1d36ab6a99f4
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_deploy_source_date_epoch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2908 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 935 of 935 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c23f7cf00e40a11df88ab6ad9600ca1a11c71db53b6ce62b3aebf6c2f935e59e
NOTE: Setscene tasks completed
NOTE: Running task 2944 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2960 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2982 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_configure: Succeeded
NOTE: Running task 2983 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_compile: Succeeded
NOTE: Running task 2984 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_install: Succeeded
NOTE: Running task 2985 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2986 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package: Succeeded
NOTE: Running task 2987 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_packagedata: Succeeded
NOTE: Running task 2988 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2989 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2990 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2990 tasks of which 2970 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 138 ERROR messages shown, returning a non-zero exit code.

--===============2550028149804578882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles: PKGV changed from 0.0+gitAUTOINC+9aa7b7cdfb [default] to 0.0+gitAUTOINC+84cb4c6701 [default]
packages/core2-32-poky-linux/puzzles: PV changed from "0.0+gitAUTOINC+9aa7b7cdfb" to "0.0+gitAUTOINC+84cb4c6701"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+9aa7b7cdfb to 0.0+git0+84cb4c6701
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 14353400 to 14405532 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PV changed from "0.0+gitAUTOINC+9aa7b7cdfb" to "0.0+gitAUTOINC+84cb4c6701"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+9aa7b7cdfb to 0.0+git0+84cb4c6701
packages/core2-32-poky-linux/puzzles/puzzles-dev: PV changed from "0.0+gitAUTOINC+9aa7b7cdfb" to "0.0+gitAUTOINC+84cb4c6701"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+9aa7b7cdfb to 0.0+git0+84cb4c6701
packages/core2-32-poky-linux/puzzles/puzzles-doc: PV changed from "0.0+gitAUTOINC+9aa7b7cdfb" to "0.0+gitAUTOINC+84cb4c6701"
packages/core2-32-poky-linux/puzzles/puzzles-extra: PKGV changed from 0.0+git0+9aa7b7cdfb to 0.0+git0+84cb4c6701
packages/core2-32-poky-linux/puzzles/puzzles-extra: PKGSIZE changed from 5474753 to 5487041 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles-extra: PV changed from "0.0+gitAUTOINC+9aa7b7cdfb" to "0.0+gitAUTOINC+84cb4c6701"
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+9aa7b7cdfb to 0.0+git0+84cb4c6701
packages/core2-32-poky-linux/puzzles/puzzles-locale: PV changed from "0.0+gitAUTOINC+9aa7b7cdfb" to "0.0+gitAUTOINC+84cb4c6701"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+9aa7b7cdfb to 0.0+git0+84cb4c6701
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3407572 to 3428603 (+1%)
packages/core2-32-poky-linux/puzzles/puzzles-src: PV changed from "0.0+gitAUTOINC+9aa7b7cdfb" to "0.0+gitAUTOINC+84cb4c6701"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+9aa7b7cdfb to 0.0+git0+84cb4c6701
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PV changed from "0.0+gitAUTOINC+9aa7b7cdfb" to "0.0+gitAUTOINC+84cb4c6701"
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+9aa7b7cdfb to 0.0+git0+84cb4c6701
packages/core2-32-poky-linux/puzzles/puzzles: PKGSIZE changed from 926860 to 930956 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles: PV changed from "0.0+gitAUTOINC+9aa7b7cdfb" to "0.0+gitAUTOINC+84cb4c6701"

--===============2550028149804578882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+9aa7b7cdfb to 0.0+git0+84cb4c6701
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+9aa7b7cdfb to 0.0+git0+84cb4c6701
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+9aa7b7cdfb to 0.0+git0+84cb4c6701
packages/core2-32-poky-linux/puzzles/puzzles-extra: PKGV changed from 0.0+git0+9aa7b7cdfb to 0.0+git0+84cb4c6701
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+9aa7b7cdfb to 0.0+git0+84cb4c6701
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+9aa7b7cdfb to 0.0+git0+84cb4c6701
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+9aa7b7cdfb to 0.0+git0+84cb4c6701
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+9aa7b7cdfb to 0.0+git0+84cb4c6701

--===============2550028149804578882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (0 cached, 807 parsed). 1416 targets, 57 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-2364c48eb2b5528a0bd8e1a005051104e1ad7a8a"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2364c48eb2b5528a0bd8e1a005051104e1ad7a8a"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 115 Found 104 Missed 11 Current 820 (90% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 890 of 935 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 915 of 935 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1079 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 933 of 935 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata_setscene: Started
NOTE: Running task 2122 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_fetch: Succeeded
NOTE: Running task 2520 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2815 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_patch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2816 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2817 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_patch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2818 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2819 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to bafeab211f96dcc2837ea65d9a9c6a333eccd590b0b8e09cccb3f79a13753554
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_populate_lic: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to be466991359b4e2617da30c68e8a3c592c97542da2be86ffba1c1d36ab6a99f4
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_deploy_source_date_epoch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2908 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 935 of 935 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 2918 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3ebd7986c834cbc527b39a873a77f5cc1ffb99642290f5adb5f91062e33f1954
NOTE: Setscene tasks completed
NOTE: Running task 2961 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2982 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_configure: Succeeded
NOTE: Running task 2983 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_compile: Succeeded
NOTE: Running task 2984 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_install: Succeeded
NOTE: Running task 2985 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2986 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package: Succeeded
NOTE: Running task 2987 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_packagedata: Succeeded
NOTE: Running task 2988 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2989 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2990 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2990 tasks of which 2970 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 138 ERROR messages shown, returning a non-zero exit code.

--===============2550028149804578882==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

From ca97ce2cfaf324dac7f5b10e55ada03ec6fd2f36 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 10:25:14 +0000
Subject: [PATCH] puzzles: upgrade to latest revision

---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 8e4d5b3349..5b65cf8655 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "9aa7b7cdfb2bcd200f45941a58d6ae698882a2d4"
+SRCREV = "84cb4c6701e027090ff3fd955ce08065e20121b2"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.20.1


--===============2550028149804578882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1416 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (806 cached, 1 parsed). 1416 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-2364c48eb2b5528a0bd8e1a005051104e1ad7a8a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2364c48eb2b5528a0bd8e1a005051104e1ad7a8a"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 115 Found 104 Missed 11 Current 824 (90% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 894 of 939 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 919 of 939 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1079 of 3008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2140 of 3008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 937 of 939 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_packagedata_setscene)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_fetch: Succeeded
NOTE: Running task 2553 of 3008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_unpack: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2833 of 3008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_patch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2834 of 3008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2835 of 3008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_patch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2836 of 3008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2837 of 3008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 939 of 939 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to a0fc48f856059ca7065fbf60cb17fa4a7fe9d06056f047e8ab270a0d74051002
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_populate_lic: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to be466991359b4e2617da30c68e8a3c592c97542da2be86ffba1c1d36ab6a99f4
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2926 of 3008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2936 of 3008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 11a36dd3e6523ca99b8465d468c380af9aea480f36275496f5948f18128795a3
NOTE: Setscene tasks completed
NOTE: Running task 2979 of 3008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3000 of 3008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_configure: Succeeded
NOTE: Running task 3001 of 3008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_compile: Succeeded
NOTE: Running task 3002 of 3008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_install: Succeeded
NOTE: Running task 3003 of 3008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 3004 of 3008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package: Succeeded
NOTE: Running task 3005 of 3008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_packagedata: Succeeded
NOTE: Running task 3006 of 3008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 3007 of 3008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+84cb4c6701-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3008 of 3008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 3008 tasks of which 2988 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 138 ERROR messages shown, returning a non-zero exit code.

--===============2550028149804578882==--
