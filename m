Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.921.1608060223692003594
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id EC17938C11C0
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 19:23:45 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-examples: upgrading to 1.18.2 SUCCEEDED
Message-ID: <MADEUP.1650FA41915D3E46.1152@lists.openembedded.org>
X-Groupsio-MsgNum: 145718
Content-Type: multipart/mixed; boundary="===============7086066629678325851=="

--===============7086066629678325851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gst-examples* to *1.18.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gst-examples-upgrade-1.18.1-1.18.2.patch
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

--===============7086066629678325851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 1452 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (803 cached, 4 parsed). 1413 targets, 41 skipped, 0 masked, 0 errors.
Removing 187 recipes from the core2-32 sysroot...done.
Removing 191 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-2090c8f1f2c58d42bbf4e323c0fb1afd4c241375"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2090c8f1f2c58d42bbf4e323c0fb1afd4c241375"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 941 Found 816 Missed 125 Current 316 (86% match, 90% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 317 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 319 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 320 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 321 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 326 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 328 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 331 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 332 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 335 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 336 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 337 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 338 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 339 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 341 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 342 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 343 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 344 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 345 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 347 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/os-release/os-release.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 349 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 351 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 352 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 354 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 356 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 358 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 359 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 360 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 361 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 362 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 363 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 364 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 366 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 367 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 368 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 369 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 370 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 371 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 372 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 373 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from c75b52a47ebbc6faa045e2ae3fc35eb6727940ec35f372a58438339d8ca7b6c8 to 7efb79b7d53ef29dfaf066e3ad505ae885e133c4e5a8657a4775b57314b64119. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/os-release/os-release.bb:do_compile, the basehash value changed from ecff77b3e7e75245fab3613e214d22cc7151cb2b45f15cd50f4ec7a9590de53b to b6497688c7413d8f9ea7d8039d7f7ca74cb1382c2ec318d7e909b200aa5bd547. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake os-release -cdo_compile -Snone
ERROR: Then:
ERROR: $ bitbake os-release -cdo_compile -Sprintdiff

NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe os-release-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bluez5-5.55-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 374 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 375 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 376 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 378 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: recipe orc-0.4.32-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 379 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 380 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 381 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 382 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 383 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 384 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe os-release-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 385 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 387 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 388 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 390 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 391 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 392 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 393 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 394 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 395 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 396 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 397 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 398 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 399 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 401 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 402 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 403 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 404 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 406 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 407 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 408 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 409 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 411 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 412 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 413 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 414 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 415 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 416 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 417 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 418 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 419 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 420 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 421 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 422 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 423 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_packagedata_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe json-glib-1.6.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgudev-234-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 424 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 425 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 428 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package_write_rpm_setscene)
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 429 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 431 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 432 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 435 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 436 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 437 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_packagedata_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: Running setscene task 439 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 440 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 441 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 442 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 443 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 444 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 447 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 448 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 449 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 451 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 452 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 453 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Started
NOTE: recipe json-glib-1.6.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 454 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 455 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: recipe libgudev-234-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: Running setscene task 456 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 457 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 458 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 459 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 460 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 463 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 466 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 467 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 468 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: Running setscene task 472 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 473 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: Running setscene task 474 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package_write_rpm_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 475 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 481 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 482 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 483 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 486 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 487 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 490 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 491 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 492 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 493 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 494 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 495 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: Running setscene task 496 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 497 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 505 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 510 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 515 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 525 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 526 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 527 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 536 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 547 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 548 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 550 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm_setscene)
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 551 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package_write_rpm_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 554 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package_write_rpm_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 581 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 603 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 614 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 620 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 621 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 622 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 627 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 628 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 629 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_20.2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 642 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe json-glib-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 644 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 658 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 659 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe json-glib-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gstreamer1.0-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe libogg-1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 660 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 661 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 662 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 663 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sbc-1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 669 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 675 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 676 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 677 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: recipe libxv-1.0.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libwebp-1.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 678 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package_write_rpm_setscene)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 679 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 680 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_package_write_rpm_setscene)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 681 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe json-glib-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package_write_rpm_setscene)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 684 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_package_write_rpm_setscene)
NOTE: recipe icu-68.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 687 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 690 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 691 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 692 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 693 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 694 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 697 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.23.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 698 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 700 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 705 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 708 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_packagedata_setscene)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 713 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 719 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libusb1-1.0.23-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 725 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 728 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 729 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 734 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 921 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: Running task 922 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 923 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_fetch)
NOTE: Running task 946 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: Running task 947 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_fetch)
NOTE: Running task 948 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 966 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_fetch)
NOTE: recipe libusb1-1.0.23-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 999 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1034 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_fetch)
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1060 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_fetch)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: recipe ell-0.33-r0: task do_fetch: Started
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: recipe ell-0.33-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1080 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: recipe ofono-1.31-r0: task do_fetch: Started
NOTE: Running task 1081 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_fetch)
NOTE: Running task 1082 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_fetch)
NOTE: Running task 1083 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_fetch)
NOTE: Running task 1084 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_unpack)
NOTE: Running task 1085 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_fetch)
NOTE: Running task 1086 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_fetch)
NOTE: Running task 1089 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1126 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_fetch: Started
NOTE: recipe ofono-1.31-r0: task do_fetch: Succeeded
NOTE: Running task 1127 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_unpack)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: Running setscene task 755 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 756 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 757 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe pulseaudio-14.0-r0: task do_fetch: Started
NOTE: Running task 1129 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_fetch)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_fetch: Succeeded
NOTE: Running task 1148 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_fetch)
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1153 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: recipe pulseaudio-14.0-r0: task do_fetch: Succeeded
NOTE: Running task 1154 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_fetch: Started
NOTE: Running task 1166 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_unpack)
NOTE: Running task 1167 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: Running task 1188 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_fetch)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1202 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_fetch)
NOTE: recipe taglib-1.11.1-r0: task do_fetch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_fetch: Succeeded
NOTE: Running setscene task 760 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.1.bb:do_packagedata_setscene)
NOTE: Running task 1207 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_unpack)
NOTE: Running task 1208 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_fetch)
NOTE: Running task 1209 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_fetch)
NOTE: recipe taglib-1.11.1-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe mpg123-1.26.3-r0: task do_fetch: Started
NOTE: Running task 1224 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_unpack)
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_fetch: Started
NOTE: recipe ell-0.33-r0: task do_unpack: Started
NOTE: recipe mpg123-1.26.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1233 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: Running task 1234 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_unpack)
NOTE: recipe ffmpeg-4.3.1-r0: task do_fetch: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_fetch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1244 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: recipe liba52-0.7.4-r4: task do_fetch: Started
NOTE: Running task 1245 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_fetch)
NOTE: Running task 1246 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_fetch)
NOTE: Running task 1247 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: Running task 1250 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_unpack)
NOTE: recipe ffmpeg-4.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1266 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_unpack)
NOTE: recipe speex-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: recipe liba52-0.7.4-r4: task do_fetch: Succeeded
NOTE: Running setscene task 761 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: Running setscene task 762 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: Running task 1282 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1283 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_unpack)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pulseaudio-14.0-r0: task do_unpack: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_fetch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1320 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: Running task 1321 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_unpack)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_unpack: Started
NOTE: Running task 1338 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_fetch: Succeeded
NOTE: Running task 1345 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_fetch: Started
NOTE: recipe dbus-glib-0.110-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1372 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_unpack)
NOTE: recipe gst-examples-1.18.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_fetch: Started
NOTE: Running task 1373 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_fetch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe taglib-1.11.1-r0: task do_unpack: Started
NOTE: Running task 1385 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_unpack)
NOTE: Running task 1387 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_fetch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: Running task 1395 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: Running task 1401 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_unpack)
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_unpack: Started
NOTE: Running task 1432 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_unpack: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_unpack: Started
NOTE: Running task 1460 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_write_config)
NOTE: Running task 1461 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_write_config)
NOTE: Running task 1462 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_write_config)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe speex-1.2.0-r0: task do_unpack: Started
NOTE: recipe liba52-0.7.4-r4: task do_unpack: Started
NOTE: recipe taglib-1.11.1-r0: task do_unpack: Succeeded
NOTE: Running task 1481 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_unpack)
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_unpack: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1488 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_patch)
NOTE: Running task 1489 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: Running task 1499 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_unpack)
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: Running task 1521 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: recipe ell-0.33-r0: task do_unpack: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1535 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_patch)
NOTE: recipe speex-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: Running task 1536 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_patch)
NOTE: Running task 1543 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_patch)
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_unpack: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_unpack: Started
NOTE: Running task 1580 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_patch)
NOTE: recipe gst-examples-1.18.2-r0: task do_write_config: Started
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1605 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_unpack: Started
NOTE: recipe dbus-glib-0.110-r0: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_write_config: Started
NOTE: recipe taglib-1.11.1-r0: task do_patch: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_write_config: Started
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_write_config: Started
NOTE: recipe ell-0.33-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Started
NOTE: recipe liba52-0.7.4-r4: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: recipe ofono-1.31-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_write_config: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_patch: Started
NOTE: recipe speex-1.2.0-r0: task do_patch: Started
NOTE: Running task 1607 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: Running task 1608 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_write_config: Succeeded
NOTE: recipe ell-0.33-r0: task do_patch: Succeeded
NOTE: Running task 1610 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.26.3-r0: task do_unpack: Succeeded
NOTE: Running task 1614 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_patch)
NOTE: recipe dbus-glib-0.110-r0: task do_unpack: Succeeded
NOTE: Running task 1615 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_patch)
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 1620 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_patch)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1621 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe ofono-1.31-r0: task do_patch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.33-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1622 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_patch)
NOTE: recipe icu-68.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_unpack: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1623 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_patch)
NOTE: recipe dbus-glib-0.110-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 767 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_packagedata_setscene)
NOTE: recipe mpg123-1.26.3-r0: task do_patch: Started
NOTE: Running setscene task 768 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_patch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Started
NOTE: recipe ofono-1.31-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_patch: Succeeded
NOTE: Running task 1624 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_deploy_source_date_epoch)
NOTE: Running task 1625 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1626 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Started
NOTE: recipe pulseaudio-14.0-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 770 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1627 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pulseaudio-14.0-r0: task do_patch: Succeeded
NOTE: Running task 1628 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_deploy_source_date_epoch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 1629 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Started
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
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe pulseaudio-14.0-r0: task do_deploy_source_date_epoch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 1634 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_patch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_patch: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 1635 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 1636 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: Running task 1637 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_deploy_source_date_epoch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 1638 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_patch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe json-glib-1.6.0-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running setscene task 772 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 1640 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe speex-1.2.0-r0: task do_patch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 1641 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.11.1-r0: task do_patch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe mpg123-1.26.3-r0: task do_patch: Succeeded
NOTE: Running task 1642 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_generate_toolchain_file)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: Running task 1643 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1644 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_deploy_source_date_epoch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 1645 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_patch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe pulseaudio-14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1646 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_deploy_source_date_epoch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 1647 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_deploy_source_date_epoch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe liba52-0.7.4-r4: task do_deploy_source_date_epoch: Started
NOTE: Running task 1648 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_deploy_source_date_epoch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_patch: Succeeded
NOTE: Running task 1649 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_deploy_source_date_epoch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe json-glib-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_patch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe mpg123-1.26.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe taglib-1.11.1-r0: task do_generate_toolchain_file: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe taglib-1.11.1-r0: task do_deploy_source_date_epoch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe ffmpeg-4.3.1-r0: task do_unpack: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 1650 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_patch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe taglib-1.11.1-r0: task do_generate_toolchain_file: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe json-glib-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-glib-0.110-r0: task do_patch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 1655 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.1-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running setscene task 774 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 776 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 780 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 782 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 783 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 784 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 786 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 787 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 788 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 789 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 790 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 791 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.23.bb:do_populate_sysroot_setscene)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liba52-0.7.4-r4: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_unpack: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_patch: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_deploy_source_date_epoch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1677 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 798 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gst-examples-1.18.2-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running setscene task 800 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_deploy_source_date_epoch_setscene)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 1679 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_patch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1680 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_deploy_source_date_epoch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe taglib-1.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1681 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_patch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe mpeg2dec-0.5.1-r0: task do_patch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 1682 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_deploy_source_date_epoch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libgudev-234-r0: task do_populate_sysroot_setscene: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe bluez5-5.55-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe dbus-glib-0.110-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot_setscene: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-plugins-base-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-1.4-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-234-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-plugins-base-1.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libusb1-1.0.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bluez5-5.55-r0: task do_populate_sysroot_setscene: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libwebp-1.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1683 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_patch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe curl-7.73.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_patch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_patch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot_setscene: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_deploy_source_date_epoch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-234-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 804 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 805 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 806 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 807 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 808 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 809 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 810 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 811 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata_setscene)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_patch: Started
NOTE: Running setscene task 812 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-glib-0.110-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_patch: Succeeded
NOTE: Running task 1689 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_patch: Succeeded
NOTE: Running task 1690 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1695 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1696 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_populate_lic)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_populate_lic: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1705 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_populate_lic unihash changed to d6aeb421c2945907b67a825dec1cde5bf61181516fab4ecaf158ac07ea003950
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1706 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-234-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 817 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 818 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 819 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 821 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 823 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 825 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 826 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 827 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 828 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-7.73.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 830 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 832 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 833 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 834 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 835 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 836 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 838 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 839 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 840 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-234-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sbc-1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 842 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.1-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
NOTE: recipe libwebp-1.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata_setscene: Succeeded
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
NOTE: Running setscene task 844 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 845 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 846 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 847 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 848 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot_setscene)
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-234-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 851 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 853 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 855 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 856 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 857 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 858 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libical-3.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 861 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 862 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 863 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bluez5-5.55-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 865 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 868 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 871 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 872 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 873 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 874 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 875 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 876 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 877 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 879 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 880 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 881 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 882 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 883 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 884 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 885 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 886 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 887 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 888 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 889 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 890 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 891 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 892 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 893 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe pango-1.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-1.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 897 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flac-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 899 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 901 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 903 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 904 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 905 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 906 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 907 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 909 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 911 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 912 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 913 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 915 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 918 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 922 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 924 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pango-1.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 925 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 926 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 928 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 929 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 930 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 931 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 932 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 933 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 934 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 935 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 936 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 938 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 939 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 940 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 942 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 944 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 946 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 947 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.1.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-68.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 949 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 951 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-68.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 952 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 953 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 955 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-68.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 958 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 959 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 960 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 961 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 962 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 963 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 964 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 965 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libogg-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 967 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mesa-2_20.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 968 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 970 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 971 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 972 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 974 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 976 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_packagedata_setscene)
NOTE: Running setscene task 977 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 978 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 979 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 980 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 982 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 983 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 984 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 985 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 986 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 987 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 988 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 989 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 990 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 991 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 992 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 994 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 995 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 996 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-68.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 997 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1000 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1004 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 1005 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1006 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe icu-68.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_20.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1008 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1009 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1010 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1011 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1012 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1013 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1014 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1015 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1017 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1019 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1021 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1022 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1023 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1024 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1025 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1026 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1027 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-68.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1029 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1031 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1033 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1035 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1037 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1038 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1039 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1041 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 1042 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1044 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1045 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1046 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1049 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1052 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 1053 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 1054 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1055 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1056 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1057 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1058 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 1059 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_packagedata_setscene)
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from c75b52a47ebbc6faa045e2ae3fc35eb6727940ec35f372a58438339d8ca7b6c8 to 7efb79b7d53ef29dfaf066e3ad505ae885e133c4e5a8657a4775b57314b64119. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1061 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1064 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1065 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 1066 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: Running setscene task 1069 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1074 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1075 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1076 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1078 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1080 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 1081 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1083 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1084 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 1085 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1086 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1087 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1089 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1090 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1091 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1092 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1096 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1100 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1101 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1103 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1104 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1105 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1108 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1109 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1110 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1111 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1112 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1113 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1114 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1115 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1116 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1117 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from c75b52a47ebbc6faa045e2ae3fc35eb6727940ec35f372a58438339d8ca7b6c8 to 7efb79b7d53ef29dfaf066e3ad505ae885e133c4e5a8657a4775b57314b64119. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1118 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1119 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1121 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1122 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1123 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 1124 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1125 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1126 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1127 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1128 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1129 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1130 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1131 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1132 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1133 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1134 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1135 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1136 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1137 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1138 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1139 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from c75b52a47ebbc6faa045e2ae3fc35eb6727940ec35f372a58438339d8ca7b6c8 to 7efb79b7d53ef29dfaf066e3ad505ae885e133c4e5a8657a4775b57314b64119. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1141 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1142 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1143 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1144 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1145 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1146 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1147 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1148 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1153 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1154 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1155 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1159 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1160 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1161 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1162 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1163 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1164 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1165 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1166 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1167 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1169 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1170 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1172 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1173 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1174 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1175 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1179 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1182 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1183 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1184 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1185 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1186 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1187 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1188 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1189 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1190 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1191 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1192 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1193 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_populate_sysroot_setscene)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1196 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: recipe readline-8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1197 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1198 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1199 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1200 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1201 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1202 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1203 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1204 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1205 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1206 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1207 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1208 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1209 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1211 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-1.1.1h-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1212 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1213 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1h-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1214 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1215 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1216 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1217 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1218 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1220 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1221 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1222 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1223 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1224 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1225 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1226 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1227 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1229 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1230 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1231 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1232 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1234 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1235 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1236 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1240 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1241 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1242 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1243 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1244 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1245 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1246 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1249 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1250 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1251 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1253 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1254 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1255 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1256 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1257 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3024 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3025 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3027 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3072 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3073 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3178 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3203 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3271 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3272 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3273 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3274 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3292 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3345 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3346 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3347 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liba52-0.7.4-r4: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3389 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-glib-0.110-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3418 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3469 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: recipe liba52-0.7.4-r4: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3627 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_configure)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3642 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3663 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3664 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_configure)
NOTE: recipe taglib-1.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3665 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3666 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe liba52-0.7.4-r4: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3667 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_configure: Started
NOTE: recipe taglib-1.11.1-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: Running task 3668 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 3669 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe ell-0.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_configure: Succeeded
NOTE: Running task 3670 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_configure)
NOTE: recipe dbus-glib-0.110-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3671 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_compile)
NOTE: Running task 3672 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_compile: Started
NOTE: recipe ell-0.33-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.110-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 3673 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe taglib-1.11.1-r0: task do_configure: Succeeded
NOTE: Running task 3674 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_compile)
NOTE: recipe gst-examples-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3675 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe taglib-1.11.1-r0: task do_compile: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_configure: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3676 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_compile)
NOTE: recipe gst-examples-1.18.2-r0: task do_compile: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 3677 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_configure: Succeeded
NOTE: Running task 3678 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_compile: Succeeded
NOTE: Running task 3679 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_install: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3680 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_install: Succeeded
NOTE: Running task 3681 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 3682 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.11.1-r0: task do_compile: Succeeded
NOTE: Running task 3683 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_install)
NOTE: recipe taglib-1.11.1-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_install: Succeeded
NOTE: Running task 3684 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_package)
NOTE: Running task 3685 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_populate_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_install: Succeeded
NOTE: Running task 3686 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: Running task 3687 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_package)
NOTE: Running task 3688 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_populate_sysroot)
NOTE: recipe gst-examples-1.18.2-r0: task do_package: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.11.1-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_packagedata: Started
NOTE: recipe taglib-1.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_packagedata: Succeeded
NOTE: Running task 3689 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package_write_rpm: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_configure: Succeeded
NOTE: Running task 3690 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_compile)
NOTE: recipe liba52-0.7.4-r4: task do_compile: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3691 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_packagedata)
NOTE: recipe taglib-1.11.1-r0: task do_package: Succeeded
NOTE: Running task 3692 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_packagedata)
NOTE: recipe gst-examples-1.18.2-r0: task do_packagedata: Started
NOTE: recipe taglib-1.11.1-r0: task do_packagedata: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 3693 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_packagedata: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3694 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_compile)
NOTE: recipe taglib-1.11.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3695 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_package_write_rpm)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_compile: Started
NOTE: recipe taglib-1.11.1-r0: task do_package_write_rpm: Started
NOTE: recipe liba52-0.7.4-r4: task do_compile: Succeeded
NOTE: Running task 3696 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 3697 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe liba52-0.7.4-r4: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3698 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe liba52-0.7.4-r4: task do_install: Succeeded
NOTE: Running task 3699 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_package)
NOTE: Running task 3700 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_populate_sysroot)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 3701 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 3702 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe liba52-0.7.4-r4: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe liba52-0.7.4-r4: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe liba52-0.7.4-r4: task do_populate_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 3703 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3704 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 3705 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_compile: Succeeded
NOTE: Running task 3706 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_install: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_install: Succeeded
NOTE: Running task 3707 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_populate_sysroot)
NOTE: Running task 3708 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_package)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_populate_sysroot: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3709 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3710 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe ffmpeg-4.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe taglib-1.11.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3711 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_configure)
NOTE: recipe ffmpeg-4.3.1-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3712 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3713 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe liba52-0.7.4-r4: task do_package: Succeeded
NOTE: Running task 3714 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: Running task 3715 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe liba52-0.7.4-r4: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3716 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3717 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liba52-0.7.4-r4: task do_packagedata: Succeeded
NOTE: Running task 3718 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_package_write_rpm)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3719 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3720 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_configure)
NOTE: recipe liba52-0.7.4-r4: task do_package_write_rpm: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: recipe speex-1.2.0-r0: task do_configure: Started
NOTE: recipe ell-0.33-r0: task do_configure: Succeeded
NOTE: Running task 3721 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_compile)
NOTE: recipe ell-0.33-r0: task do_compile: Started
NOTE: recipe liba52-0.7.4-r4: task do_package_write_rpm: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 3722 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 3723 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3724 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_install: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package: Succeeded
NOTE: Running task 3725 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_packagedata)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_packagedata: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_install: Succeeded
NOTE: Running task 3726 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package)
NOTE: Running task 3727 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_populate_sysroot)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 3728 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 3729 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe ell-0.33-r0: task do_compile: Succeeded
NOTE: Running task 3730 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_packagedata: Succeeded
NOTE: Running task 3731 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_package_write_rpm)
NOTE: recipe ell-0.33-r0: task do_install: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.110-r0: task do_configure: Succeeded
NOTE: Running task 3732 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3733 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 3734 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 3735 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe dbus-glib-0.110-r0: task do_compile: Started
NOTE: recipe ell-0.33-r0: task do_install: Succeeded
NOTE: Running task 3736 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_populate_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: Running task 3737 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_package)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe ell-0.33-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: Running task 3738 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: Running task 3739 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: recipe ell-0.33-r0: task do_package: Started
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3740 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 3741 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3742 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.33-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3743 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: Running task 3744 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3745 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3746 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3747 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3748 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: Running task 3749 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_configure)
NOTE: recipe dbus-glib-0.110-r0: task do_compile: Succeeded
NOTE: Running task 3750 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_install)
NOTE: recipe dbus-glib-0.110-r0: task do_install: Started
NOTE: recipe ofono-1.31-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package: Succeeded
NOTE: Running task 3751 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3752 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_configure)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.110-r0: task do_install: Succeeded
NOTE: Running task 3753 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_package)
NOTE: Running task 3754 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.110-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-glib-0.110-r0: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 3755 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3756 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.110-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3757 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 3758 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: Running task 3759 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: Running task 3760 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package_write_rpm)
NOTE: recipe lame-3.100-r0: task do_package_write_rpm: Started
NOTE: recipe ell-0.33-r0: task do_package: Succeeded
NOTE: Running task 3761 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_packagedata)
NOTE: recipe ell-0.33-r0: task do_packagedata: Started
NOTE: recipe ell-0.33-r0: task do_packagedata: Succeeded
NOTE: Running task 3762 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3763 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe ell-0.33-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.110-r0: task do_package: Succeeded
NOTE: Running task 3764 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_packagedata)
NOTE: recipe dbus-glib-0.110-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_packagedata: Succeeded
NOTE: Running task 3765 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.110-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_configure: Succeeded
NOTE: Running task 3766 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_compile: Started
NOTE: recipe ell-0.33-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3767 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_compile)
NOTE: recipe ffmpeg-4.3.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_compile: Succeeded
NOTE: Running task 3768 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_install: Succeeded
NOTE: Running task 3769 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3770 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_compile)
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3771 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Started
NOTE: recipe speex-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3772 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_compile)
NOTE: recipe speex-1.2.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_package: Succeeded
NOTE: Running task 3773 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_packagedata: Started
NOTE: recipe speex-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3774 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_install)
NOTE: recipe speex-1.2.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3775 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_package_write_rpm)
NOTE: recipe speex-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3776 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_package_write_rpm: Started
NOTE: Running task 3777 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_populate_sysroot)
NOTE: recipe speex-1.2.0-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_configure: Succeeded
NOTE: Running task 3778 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_compile)
NOTE: recipe ofono-1.31-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3779 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_install)
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3780 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_install)
NOTE: recipe speex-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3781 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Started
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3782 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3783 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package_write_rpm)
NOTE: recipe speex-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.31-r0: task do_compile: Succeeded
NOTE: Running task 3784 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_install)
NOTE: recipe ofono-1.31-r0: task do_install: Started
NOTE: recipe ofono-1.31-r0: task do_install: Succeeded
NOTE: Running task 3785 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_populate_sysroot)
NOTE: recipe speex-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3786 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package)
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3787 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package)
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Started
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3788 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3789 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3790 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3791 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 3792 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3793 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_packagedata)
NOTE: recipe pulseaudio-14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3794 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_configure)
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-14.0-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3795 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 3796 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package_write_rpm)
NOTE: Running task 3797 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.31-r0: task do_package: Succeeded
NOTE: Running task 3798 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_packagedata)
NOTE: recipe ofono-1.31-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 3799 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.31-r0: task do_packagedata: Succeeded
NOTE: Running task 3800 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package_write_rpm)
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3801 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3802 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_install)
NOTE: recipe ffmpeg-4.3.1-r0: task do_install: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_install: Succeeded
NOTE: Running task 3803 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_package)
NOTE: Running task 3804 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_populate_sysroot)
NOTE: recipe ffmpeg-4.3.1-r0: task do_package: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3805 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3806 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_configure: Succeeded
NOTE: Running task 3807 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_compile)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_compile: Succeeded
NOTE: Running task 3808 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_install)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_install: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_package: Succeeded
NOTE: Running task 3809 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_packagedata)
NOTE: recipe ffmpeg-4.3.1-r0: task do_packagedata: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3810 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_package)
NOTE: Running task 3811 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_package: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_package: Succeeded
NOTE: Running task 3812 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3813 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_configure: Succeeded
NOTE: Running task 3814 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_compile)
NOTE: recipe pulseaudio-14.0-r0: task do_compile: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_compile: Succeeded
NOTE: Running task 3815 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_install)
NOTE: recipe pulseaudio-14.0-r0: task do_install: Started
NOTE: recipe pulseaudio-14.0-r0: task do_install: Succeeded
NOTE: Running task 3816 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_populate_sysroot)
NOTE: Running task 3817 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_package)
NOTE: recipe pulseaudio-14.0-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package: Started
NOTE: recipe pulseaudio-14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3818 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3819 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.26.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3820 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_configure)
NOTE: recipe mpg123-1.26.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3821 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Started
NOTE: recipe mpg123-1.26.3-r0: task do_configure: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package: Succeeded
NOTE: Running task 3822 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_packagedata)
NOTE: recipe pulseaudio-14.0-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-14.0-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 3823 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 3824 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_install)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 3825 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Started
NOTE: recipe mpg123-1.26.3-r0: task do_configure: Succeeded
NOTE: Running task 3826 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_compile)
NOTE: recipe mpg123-1.26.3-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 3827 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_packagedata)
NOTE: recipe mpg123-1.26.3-r0: task do_compile: Succeeded
NOTE: Running task 3828 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_install)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.26.3-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3829 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package_write_rpm)
NOTE: Running task 3830 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.26.3-r0: task do_install: Succeeded
NOTE: Running task 3831 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_package)
NOTE: Running task 3832 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.26.3-r0: task do_package: Started
NOTE: recipe mpg123-1.26.3-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.26.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3833 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3834 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_configure: Started
NOTE: recipe mpg123-1.26.3-r0: task do_package: Succeeded
NOTE: Running task 3835 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_packagedata)
NOTE: recipe mpg123-1.26.3-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.26.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3836 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_package_write_rpm)
NOTE: recipe mpg123-1.26.3-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.26.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_configure: Succeeded
NOTE: Running task 3837 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_compile: Succeeded
NOTE: Running task 3838 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_install: Succeeded
NOTE: Running task 3839 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_package: Succeeded
NOTE: Running task 3840 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3841 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_package_write_rpm)
NOTE: Running task 3842 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_package_write_rpm)
NOTE: Running task 3843 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_package_qa: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_package_qa: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3844 of 3844 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3844 tasks of which 3532 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 170 ERROR messages shown, returning a non-zero exit code.

--===============7086066629678325851==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-gst-examples-upgrade-1.18.1-1.18.2.patch"

From fe11c23f1b75f3a7145d74160afa37999c8a902a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 15 Dec 2020 15:11:02 +0000
Subject: [PATCH] gst-examples: upgrade 1.18.1 -> 1.18.2

---
 .../{gst-examples_1.18.1.bb => gst-examples_1.18.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.18.1.bb => gst-examples_1.18.2.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb
index 048b45a08f..54a4b5df15 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=http
            file://gst-player.desktop \
            "
 
-SRCREV = "998ee69af18a5928759dbe17fffbceebbc8d72d0"
+SRCREV = "45086d8ef2d75244d9d5c8f69c0f0e1dfd4200b3"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


--===============7086066629678325851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gst-examples/gst-examples-dbg: PKGV changed from 1.18.1 [default] to 1.18.2 [default]
packages/core2-32-poky-linux/gst-examples/gst-examples-dbg: PV changed from "1.18.1" to "1.18.2"
packages/core2-32-poky-linux/gst-examples/gst-examples-dev: PKGV changed from 1.18.1 [default] to 1.18.2 [default]
packages/core2-32-poky-linux/gst-examples/gst-examples-dev: PV changed from "1.18.1" to "1.18.2"
packages/core2-32-poky-linux/gst-examples/gst-examples-doc: PKGV changed from 1.18.1 [default] to 1.18.2 [default]
packages/core2-32-poky-linux/gst-examples/gst-examples-doc: PV changed from "1.18.1" to "1.18.2"
packages/core2-32-poky-linux/gst-examples/gst-examples-locale: PKGV changed from 1.18.1 [default] to 1.18.2 [default]
packages/core2-32-poky-linux/gst-examples/gst-examples-locale: PV changed from "1.18.1" to "1.18.2"
packages/core2-32-poky-linux/gst-examples/gst-examples-src: PKGV changed from 1.18.1 [default] to 1.18.2 [default]
packages/core2-32-poky-linux/gst-examples/gst-examples-src: PV changed from "1.18.1" to "1.18.2"
packages/core2-32-poky-linux/gst-examples/gst-examples-staticdev: PKGV changed from 1.18.1 [default] to 1.18.2 [default]
packages/core2-32-poky-linux/gst-examples/gst-examples-staticdev: PV changed from "1.18.1" to "1.18.2"
packages/core2-32-poky-linux/gst-examples/gst-examples: PKGV changed from 1.18.1 [default] to 1.18.2 [default]
packages/core2-32-poky-linux/gst-examples/gst-examples: PV changed from "1.18.1" to "1.18.2"
packages/core2-32-poky-linux/gst-examples: PKGV changed from 1.18.1 [default] to 1.18.2 [default]
packages/core2-32-poky-linux/gst-examples: PV changed from "1.18.1" to "1.18.2"

--===============7086066629678325851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 1453 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (803 cached, 4 parsed). 1413 targets, 49 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-2090c8f1f2c58d42bbf4e323c0fb1afd4c241375"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2090c8f1f2c58d42bbf4e323c0fb1afd4c241375"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 150 Found 26 Missed 124 Current 1100 (17% match, 90% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1116 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1117 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1118 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1134 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1245 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1246 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_packagedata_setscene)
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1248 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_deploy_source_date_epoch_setscene: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
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
NOTE: Running task 2030 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: Running task 2034 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 2040 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_fetch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2097 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_fetch)
NOTE: Running task 2098 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: Running task 2099 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
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
NOTE: Running task 2192 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_fetch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_fetch: Started
NOTE: recipe ell-0.33-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.33-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2253 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2254 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2262 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: Running task 2273 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe ofono-1.31-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2287 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2288 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2290 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe ofono-1.31-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2291 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_unpack)
NOTE: Running task 2292 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2313 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2354 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_fetch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe pulseaudio-14.0-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe ell-0.33-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_unpack: Started
NOTE: Running task 2392 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2393 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe pulseaudio-14.0-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2410 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_unpack)
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: Running task 2425 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_fetch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2426 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2433 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe ell-0.33-r0: task do_prepare_recipe_sysroot: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: recipe ofono-1.31-r0: task do_unpack: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_fetch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2502 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_fetch)
NOTE: Running task 2503 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2504 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_fetch)
NOTE: Running task 2505 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_fetch)
NOTE: Running task 2506 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_fetch)
NOTE: Running task 2507 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_fetch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2526 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2561 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_unpack)
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2571 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_fetch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe taglib-1.11.1-r0: task do_fetch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2608 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe taglib-1.11.1-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2635 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_unpack)
NOTE: Running task 2653 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_fetch)
NOTE: Running task 2654 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_patch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_unpack: Started
NOTE: Running task 2712 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_fetch)
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1250 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 2756 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_fetch)
NOTE: Running task 2757 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_fetch)
NOTE: Running task 2758 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_fetch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe liba52-0.7.4-r4: task do_fetch: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_fetch: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_fetch: Started
NOTE: recipe speex-1.2.0-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_fetch: Started
NOTE: Running task 2801 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: Running task 2807 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-glib-0.110-r0: task do_fetch: Started
NOTE: recipe speex-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_fetch: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_fetch: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_fetch: Started
NOTE: Running task 2815 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_unpack)
NOTE: recipe taglib-1.11.1-r0: task do_unpack: Started
NOTE: Running task 2816 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 2817 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_unpack)
NOTE: Running task 2818 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_unpack)
NOTE: Running task 2819 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.26.3-r0: task do_fetch: Succeeded
NOTE: Running task 2820 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_unpack)
NOTE: Running task 2821 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_unpack)
NOTE: Running task 2822 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-glib-0.110-r0: task do_fetch: Succeeded
NOTE: Running task 2823 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_unpack)
NOTE: Running task 2824 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.33-r0: task do_unpack: Succeeded
NOTE: Running task 2825 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_patch)
NOTE: recipe gst-examples-1.18.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_fetch: Started
NOTE: Running task 2837 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: Running task 2845 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_unpack)
NOTE: Running task 2848 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_fetch)
NOTE: Running task 2849 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_fetch)
NOTE: Running task 2850 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_fetch: Started
NOTE: Running task 2902 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_unpack)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: Running task 2919 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: recipe taglib-1.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liba52-0.7.4-r4: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 2920 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: Running task 2933 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: recipe taglib-1.11.1-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_unpack: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_unpack: Started
NOTE: recipe dbus-glib-0.110-r0: task do_unpack: Started
NOTE: Running task 2942 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_patch)
NOTE: recipe ffmpeg-4.3.1-r0: task do_unpack: Started
NOTE: recipe liba52-0.7.4-r4: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.33-r0: task do_patch: Started
NOTE: recipe speex-1.2.0-r0: task do_unpack: Started
NOTE: recipe ofono-1.31-r0: task do_unpack: Succeeded
NOTE: Running task 2955 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_unpack)
NOTE: Running task 2956 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_unpack)
NOTE: Running task 2957 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_unpack)
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2970 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_patch)
NOTE: recipe gst-examples-1.18.2-r0: task do_unpack: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe liba52-0.7.4-r4: task do_unpack: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Started
NOTE: Running task 3038 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_patch)
NOTE: Running task 3071 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_write_config)
NOTE: Running task 3072 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Started
NOTE: recipe dbus-glib-0.110-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: Running task 3073 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: recipe speex-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 3096 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3097 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_patch)
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3098 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_unpack)
NOTE: Running task 3099 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: recipe taglib-1.11.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_unpack: Started
NOTE: recipe ofono-1.31-r0: task do_patch: Started
NOTE: Running task 3162 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_write_config)
NOTE: Running task 3163 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_write_config)
NOTE: Running task 3164 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_write_config)
NOTE: recipe liba52-0.7.4-r4: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: Running task 3202 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_write_config: Started
NOTE: Running task 3222 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 3272 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_patch)
NOTE: recipe gst-examples-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speex-1.2.0-r0: task do_patch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Started
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_write_config: Succeeded
NOTE: Running task 3326 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_patch)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_write_config: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-glib-0.110-r0: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: recipe ofono-1.31-r0: task do_patch: Succeeded
NOTE: Running task 3450 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_patch)
NOTE: Running task 3460 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_deploy_source_date_epoch)
NOTE: Running task 3461 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_write_config: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_write_config: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: Running task 3528 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3610 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe dbus-glib-0.110-r0: task do_patch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 3611 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_patch)
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe pulseaudio-14.0-r0: task do_unpack: Succeeded
NOTE: Running task 3612 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_patch)
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 3613 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_patch)
NOTE: Running task 3614 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_unpack)
NOTE: recipe speex-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 3615 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 3616 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: recipe mpg123-1.26.3-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 3617 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_patch)
NOTE: Running task 3618 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_patch)
NOTE: Running task 3619 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_patch)
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 3620 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: recipe liba52-0.7.4-r4: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_unpack: Succeeded
NOTE: Running task 3621 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_patch)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Started
NOTE: recipe pulseaudio-14.0-r0: task do_patch: Started
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_patch: Succeeded
NOTE: Running task 3622 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Started
NOTE: recipe mpg123-1.26.3-r0: task do_patch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: Running task 3623 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_patch: Succeeded
NOTE: Running task 3624 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gst-examples-1.18.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 3625 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3626 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_patch)
NOTE: recipe liba52-0.7.4-r4: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-14.0-r0: task do_patch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3627 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 3628 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 3629 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_patch)
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3630 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_deploy_source_date_epoch)
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: Running task 3631 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3632 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 3633 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3634 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.26.3-r0: task do_patch: Succeeded
NOTE: Running task 3635 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_patch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Started
NOTE: recipe liba52-0.7.4-r4: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_patch: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3636 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_configure)
NOTE: Running task 3637 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_generate_toolchain_file)
NOTE: Running task 3638 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_deploy_source_date_epoch)
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: Running task 3639 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.26.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3640 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe taglib-1.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liba52-0.7.4-r4: task do_configure: Started
NOTE: recipe taglib-1.11.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe ell-0.33-r0: task do_patch: Succeeded
NOTE: Running task 3641 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3642 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_patch: Succeeded
NOTE: Running task 3643 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3644 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 3645 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3646 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3647 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: recipe ell-0.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3648 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.33-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3649 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_configure)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3650 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3651 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3652 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_configure)
NOTE: recipe taglib-1.11.1-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3653 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.33-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 3654 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: recipe dbus-glib-0.110-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_patch: Succeeded
NOTE: Running task 3655 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_patch)
NOTE: Running task 3656 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_configure)
NOTE: Running task 3657 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_patch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.110-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 3658 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe dbus-glib-0.110-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3659 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_configure)
NOTE: recipe ffmpeg-4.3.1-r0: task do_patch: Succeeded
NOTE: Running task 3660 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe dbus-glib-0.110-r0: task do_configure: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_patch: Succeeded
NOTE: Running task 3661 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3662 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_populate_lic)
NOTE: recipe gst-examples-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_populate_lic: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_configure: Succeeded
NOTE: Running task 3663 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_compile)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_configure: Succeeded
NOTE: Running task 3664 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_compile)
NOTE: recipe gst-examples-1.18.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_populate_lic unihash changed to d6aeb421c2945907b67a825dec1cde5bf61181516fab4ecaf158ac07ea003950
NOTE: recipe gst-examples-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3665 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_configure)
NOTE: recipe taglib-1.11.1-r0: task do_compile: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_compile: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 3666 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_configure: Succeeded
NOTE: Running task 3667 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_compile: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_compile: Succeeded
NOTE: Running task 3668 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_install: Succeeded
NOTE: Running task 3669 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 3670 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_populate_sysroot: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_compile: Succeeded
NOTE: Running task 3671 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package: Succeeded
NOTE: Running task 3672 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe taglib-1.11.1-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_packagedata: Started
NOTE: recipe taglib-1.11.1-r0: task do_install: Succeeded
NOTE: Running task 3673 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_package)
NOTE: Running task 3674 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_populate_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_packagedata: Succeeded
NOTE: Running task 3675 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm)
NOTE: recipe gst-examples-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3676 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_compile)
NOTE: recipe taglib-1.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.11.1-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_compile: Started
NOTE: recipe taglib-1.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3677 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_install)
NOTE: recipe gst-examples-1.18.2-r0: task do_install: Started
NOTE: recipe taglib-1.11.1-r0: task do_package: Succeeded
NOTE: Running task 3678 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_packagedata)
NOTE: recipe gst-examples-1.18.2-r0: task do_install: Succeeded
NOTE: Running task 3679 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_package)
NOTE: Running task 3680 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_populate_sysroot)
NOTE: recipe taglib-1.11.1-r0: task do_packagedata: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_package: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.11.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3681 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_package_write_rpm)
NOTE: recipe taglib-1.11.1-r0: task do_package_write_rpm: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 3682 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe liba52-0.7.4-r4: task do_configure: Succeeded
NOTE: Running task 3683 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_compile)
NOTE: recipe gst-examples-1.18.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe liba52-0.7.4-r4: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 3684 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 3685 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 3686 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3687 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_compile: Started
NOTE: recipe liba52-0.7.4-r4: task do_compile: Succeeded
NOTE: Running task 3688 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_install)
NOTE: recipe liba52-0.7.4-r4: task do_install: Started
NOTE: recipe liba52-0.7.4-r4: task do_install: Succeeded
NOTE: Running task 3689 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_package)
NOTE: Running task 3690 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_populate_sysroot)
NOTE: recipe liba52-0.7.4-r4: task do_populate_sysroot: Started
NOTE: recipe liba52-0.7.4-r4: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 3691 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe liba52-0.7.4-r4: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3692 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe taglib-1.11.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3693 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 3694 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: Running task 3695 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe ell-0.33-r0: task do_configure: Succeeded
NOTE: Running task 3696 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_compile)
NOTE: recipe ell-0.33-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3697 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3698 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe liba52-0.7.4-r4: task do_package: Succeeded
NOTE: Running task 3699 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_packagedata)
NOTE: recipe liba52-0.7.4-r4: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3700 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3701 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_compile: Succeeded
NOTE: Running task 3702 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_install)
NOTE: recipe liba52-0.7.4-r4: task do_packagedata: Succeeded
NOTE: Running task 3703 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_package_write_rpm)
NOTE: recipe gst-examples-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3704 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_install: Started
NOTE: recipe liba52-0.7.4-r4: task do_package_write_rpm: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_packagedata: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_install: Succeeded
NOTE: Running task 3705 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_populate_sysroot)
NOTE: Running task 3706 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3707 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3708 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_populate_sysroot: Started
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_packagedata: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3709 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_configure)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3710 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_install)
NOTE: recipe ell-0.33-r0: task do_compile: Succeeded
NOTE: Running task 3711 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_install)
NOTE: recipe dbus-glib-0.110-r0: task do_configure: Succeeded
NOTE: Running task 3712 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_compile)
NOTE: recipe liba52-0.7.4-r4: task do_package_write_rpm: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_configure: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_install: Started
NOTE: recipe ell-0.33-r0: task do_install: Started
NOTE: recipe dbus-glib-0.110-r0: task do_compile: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3713 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ffmpeg-4.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 3714 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe ell-0.33-r0: task do_install: Succeeded
NOTE: Running task 3715 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_populate_sysroot)
NOTE: Running task 3716 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_package)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_install: Succeeded
NOTE: Running task 3717 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: Running task 3718 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_populate_sysroot)
NOTE: recipe ell-0.33-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.33-r0: task do_package: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 3719 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_populate_sysroot: Started
NOTE: Running task 3720 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe ffmpeg-4.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3721 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 3722 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 3723 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3724 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe ell-0.33-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: Running task 3725 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 3726 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 3727 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3728 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3729 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: Running task 3730 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: Running task 3731 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3732 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3733 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3734 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_configure)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_compile: Succeeded
NOTE: Running task 3735 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_packagedata)
NOTE: Running task 3736 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_install)
NOTE: recipe ofono-1.31-r0: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3737 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_configure)
NOTE: recipe dbus-glib-0.110-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3738 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_configure)
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_packagedata: Succeeded
NOTE: Running task 3739 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_package_write_rpm)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.110-r0: task do_install: Succeeded
NOTE: Running task 3740 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_package)
NOTE: Running task 3741 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_populate_sysroot)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package: Succeeded
NOTE: Running task 3742 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_packagedata)
NOTE: recipe dbus-glib-0.110-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-glib-0.110-r0: task do_package: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: Running task 3743 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 3744 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe dbus-glib-0.110-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3745 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.33-r0: task do_package: Succeeded
NOTE: Running task 3746 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_packagedata)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3747 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.33-r0: task do_packagedata: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3748 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 3749 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe ell-0.33-r0: task do_packagedata: Succeeded
NOTE: Running task 3750 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe ell-0.33-r0: task do_package_write_rpm: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: Running task 3751 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: recipe ell-0.33-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_package: Succeeded
NOTE: Running task 3752 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_packagedata)
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: Running task 3753 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.110-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.110-r0: task do_packagedata: Succeeded
NOTE: Running task 3754 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.110-r0: task do_package_write_rpm: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lame-3.100-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_configure: Succeeded
NOTE: Running task 3755 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3756 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_compile: Started
NOTE: recipe dbus-glib-0.110-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_compile: Succeeded
NOTE: Running task 3757 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3758 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_compile)
NOTE: Running task 3759 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Started
NOTE: recipe ofono-1.31-r0: task do_configure: Succeeded
NOTE: Running task 3760 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_compile)
NOTE: recipe ofono-1.31-r0: task do_compile: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_install: Succeeded
NOTE: Running task 3761 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_package: Started
NOTE: recipe ofono-1.31-r0: task do_compile: Succeeded
NOTE: Running task 3762 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_install)
NOTE: recipe ofono-1.31-r0: task do_install: Started
NOTE: recipe ofono-1.31-r0: task do_install: Succeeded
NOTE: Running task 3763 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_populate_sysroot)
NOTE: Running task 3764 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package)
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_package: Started
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3765 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speex-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3766 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_compile)
NOTE: recipe speex-1.2.0-r0: task do_compile: Started
NOTE: recipe speex-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3767 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_package: Succeeded
NOTE: Running task 3768 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_packagedata)
NOTE: recipe speex-1.2.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_packagedata: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3769 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3770 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package)
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3771 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_install)
NOTE: Running task 3772 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3773 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_install)
NOTE: recipe ffmpeg-4.3.1-r0: task do_compile: Started
NOTE: recipe speex-1.2.0-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3774 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_package_write_rpm)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3775 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Started
NOTE: recipe pulseaudio-14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3776 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_configure)
NOTE: recipe pulseaudio-14.0-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3777 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package)
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3778 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_packagedata)
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3779 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Started
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3780 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package_write_rpm)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.31-r0: task do_package: Succeeded
NOTE: Running task 3781 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_packagedata)
NOTE: recipe ofono-1.31-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3782 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3783 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Started
NOTE: recipe ofono-1.31-r0: task do_packagedata: Succeeded
NOTE: Running task 3784 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package_write_rpm)
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3785 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 3786 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package_write_rpm)
NOTE: Running task 3787 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3788 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 3789 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 3790 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3791 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3792 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_install)
NOTE: recipe ffmpeg-4.3.1-r0: task do_install: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_install: Succeeded
NOTE: Running task 3793 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_package)
NOTE: Running task 3794 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_populate_sysroot)
NOTE: recipe ffmpeg-4.3.1-r0: task do_package: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3795 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3796 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_configure: Succeeded
NOTE: Running task 3797 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_compile)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_compile: Succeeded
NOTE: Running task 3798 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_install)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_install: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_configure: Succeeded
NOTE: Running task 3799 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_compile)
NOTE: recipe pulseaudio-14.0-r0: task do_compile: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package: Succeeded
NOTE: Running task 3800 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_packagedata)
NOTE: recipe ffmpeg-4.3.1-r0: task do_packagedata: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3801 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_package)
NOTE: Running task 3802 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_package: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.0-r0: task do_compile: Succeeded
NOTE: Running task 3803 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_install)
NOTE: recipe pulseaudio-14.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_package: Succeeded
NOTE: Running task 3804 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3805 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.0-r0: task do_install: Succeeded
NOTE: Running task 3806 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_populate_sysroot)
NOTE: Running task 3807 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_package)
NOTE: recipe pulseaudio-14.0-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3808 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3809 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.26.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.26.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3810 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3811 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_configure)
NOTE: recipe mpg123-1.26.3-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package: Succeeded
NOTE: Running task 3812 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_packagedata)
NOTE: recipe pulseaudio-14.0-r0: task do_packagedata: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 3813 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 3814 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_install)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 3815 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Started
NOTE: recipe mpg123-1.26.3-r0: task do_configure: Succeeded
NOTE: Running task 3816 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_compile)
NOTE: recipe mpg123-1.26.3-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 3817 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_packagedata)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3818 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package_write_rpm)
NOTE: Running task 3819 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_compile: Succeeded
NOTE: Running task 3820 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_install)
NOTE: recipe mpg123-1.26.3-r0: task do_install: Started
NOTE: recipe mpg123-1.26.3-r0: task do_install: Succeeded
NOTE: Running task 3821 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_package)
NOTE: Running task 3822 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.26.3-r0: task do_package: Started
NOTE: recipe mpg123-1.26.3-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.26.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3823 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3824 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_configure: Started
NOTE: recipe mpg123-1.26.3-r0: task do_package: Succeeded
NOTE: Running task 3825 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_packagedata)
NOTE: recipe mpg123-1.26.3-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.26.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3826 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_package_write_rpm)
NOTE: recipe mpg123-1.26.3-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.26.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_configure: Succeeded
NOTE: Running task 3827 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_compile: Succeeded
NOTE: Running task 3828 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_install: Succeeded
NOTE: Running task 3829 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_package: Succeeded
NOTE: Running task 3830 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3831 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_package_write_rpm)
NOTE: Running task 3832 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_package_write_rpm)
NOTE: Running task 3833 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_package_qa: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_package_qa: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3834 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3834 tasks of which 3522 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 145 ERROR messages shown, returning a non-zero exit code.

--===============7086066629678325851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 1453 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (803 cached, 4 parsed). 1413 targets, 57 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-2090c8f1f2c58d42bbf4e323c0fb1afd4c241375"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2090c8f1f2c58d42bbf4e323c0fb1afd4c241375"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 150 Found 26 Missed 124 Current 1093 (17% match, 90% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1109 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1110 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1111 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1127 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1238 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1239 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_packagedata_setscene)
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1241 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_deploy_source_date_epoch_setscene: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
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
NOTE: Running task 2026 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2030 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 2036 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_fetch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2091 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 2092 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_fetch)
NOTE: Running task 2093 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2180 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_fetch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_fetch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: recipe ell-0.33-r0: task do_fetch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.33-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2235 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: Running task 2236 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2245 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: Running task 2253 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: recipe ofono-1.31-r0: task do_fetch: Started
NOTE: Running task 2267 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: Running task 2268 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2269 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: Running task 2271 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe ofono-1.31-r0: task do_fetch: Succeeded
NOTE: Running task 2272 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_unpack)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 2293 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe pulseaudio-14.0-r0: task do_fetch: Started
NOTE: Running task 2334 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_fetch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: recipe ell-0.33-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_unpack: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: recipe pulseaudio-14.0-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2372 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2373 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_unpack)
NOTE: Running task 2374 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2383 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2388 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2405 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_fetch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe ell-0.33-r0: task do_prepare_recipe_sysroot: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe ofono-1.31-r0: task do_unpack: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2441 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_unpack: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_fetch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2455 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2482 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_fetch)
NOTE: Running task 2483 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2484 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_fetch)
NOTE: Running task 2485 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_fetch)
NOTE: Running task 2486 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_fetch)
NOTE: Running task 2487 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_fetch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2510 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_unpack)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe pulseaudio-14.0-r0: task do_unpack: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe taglib-1.11.1-r0: task do_fetch: Started
NOTE: Running task 2550 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_fetch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe taglib-1.11.1-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe ell-0.33-r0: task do_unpack: Succeeded
NOTE: Running task 2573 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_unpack)
NOTE: Running task 2578 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_patch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2589 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe mpg123-1.26.3-r0: task do_fetch: Started
NOTE: recipe speex-1.2.0-r0: task do_fetch: Started
NOTE: recipe liba52-0.7.4-r4: task do_fetch: Started
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_fetch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: recipe mpg123-1.26.3-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2630 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_unpack)
NOTE: recipe speex-1.2.0-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2634 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_fetch)
NOTE: Running task 2635 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_fetch: Succeeded
NOTE: Running task 2636 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: Running task 2637 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2638 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_unpack)
NOTE: Running task 2639 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_unpack)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 2643 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_unpack)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: Running task 2653 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: recipe ffmpeg-4.3.1-r0: task do_fetch: Started
NOTE: recipe dbus-glib-0.110-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_unpack: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_fetch: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.33-r0: task do_patch: Started
NOTE: Running setscene task 1243 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ofono-1.31-r0: task do_unpack: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2683 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_patch)
NOTE: Running task 2684 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_unpack)
NOTE: Running task 2685 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_unpack)
NOTE: Running task 2702 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_fetch)
NOTE: recipe gst-examples-1.18.2-r0: task do_fetch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.26.3-r0: task do_unpack: Started
NOTE: recipe taglib-1.11.1-r0: task do_unpack: Succeeded
NOTE: Running task 2715 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_patch)
NOTE: recipe liba52-0.7.4-r4: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe speex-1.2.0-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: Running task 2724 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gst-examples-1.18.2-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: Running task 2742 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_unpack)
NOTE: Running task 2749 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_fetch)
NOTE: Running task 2750 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_fetch)
NOTE: Running task 2751 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_fetch)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_unpack: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: Running task 2760 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_patch)
NOTE: Running task 2768 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_unpack: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2789 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_patch)
NOTE: recipe ofono-1.31-r0: task do_patch: Started
NOTE: Running task 2790 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_patch)
NOTE: recipe dbus-glib-0.110-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: Running task 2803 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2804 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: Running task 2805 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Started
NOTE: Running task 2806 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2807 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.11.1-r0: task do_patch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2812 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_patch)
NOTE: Running task 2813 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_unpack)
NOTE: recipe ffmpeg-4.3.1-r0: task do_unpack: Started
NOTE: recipe dbus-glib-0.110-r0: task do_unpack: Succeeded
NOTE: Running task 2822 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_patch)
NOTE: Running task 2829 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: recipe gst-examples-1.18.2-r0: task do_unpack: Started
NOTE: recipe pulseaudio-14.0-r0: task do_unpack: Succeeded
NOTE: Running task 2839 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_patch)
NOTE: Running task 2840 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_fetch)
NOTE: Running task 2841 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_fetch)
NOTE: Running task 2842 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_fetch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_patch: Started
NOTE: recipe ofono-1.31-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_fetch: Started
NOTE: recipe mpg123-1.26.3-r0: task do_unpack: Succeeded
NOTE: Running task 2872 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_deploy_source_date_epoch)
NOTE: Running task 2878 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_fetch: Started
NOTE: recipe speex-1.2.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_fetch: Succeeded
NOTE: Running task 2912 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_prepare_recipe_sysroot)
NOTE: recipe taglib-1.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: recipe mpeg2dec-0.5.1-r0: task do_patch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Started
NOTE: recipe liba52-0.7.4-r4: task do_patch: Started
NOTE: recipe liba52-0.7.4-r4: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Started
NOTE: Running task 2955 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe pulseaudio-14.0-r0: task do_patch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 2964 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_unpack)
NOTE: Running task 2965 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_unpack)
NOTE: Running task 2966 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_unpack)
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_patch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_unpack: Succeeded
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2990 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_patch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 2998 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.26.3-r0: task do_patch: Started
NOTE: Running task 3003 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: Running task 3012 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_unpack)
NOTE: Running task 3013 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: recipe dbus-glib-0.110-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3065 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_write_config)
NOTE: Running task 3066 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe taglib-1.11.1-r0: task do_patch: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 3067 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: Running task 3068 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_generate_toolchain_file)
NOTE: Running task 3069 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_unpack: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_patch: Started
NOTE: Running task 3070 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: Running task 3071 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_patch)
NOTE: Running task 3072 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_unpack)
NOTE: recipe pulseaudio-14.0-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3095 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_unpack: Started
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: Running task 3135 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_write_config: Started
NOTE: Running task 3159 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_write_config)
NOTE: Running task 3160 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_write_config)
NOTE: Running task 3161 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_write_config)
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3181 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_deploy_source_date_epoch)
NOTE: recipe liba52-0.7.4-r4: task do_patch: Succeeded
NOTE: Running task 3192 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.33-r0: task do_patch: Succeeded
NOTE: Running task 3212 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.11.1-r0: task do_generate_toolchain_file: Started
NOTE: Running task 3221 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: Running task 3237 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_patch)
NOTE: Running task 3238 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: Running task 3240 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Started
NOTE: recipe taglib-1.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3271 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe taglib-1.11.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe ell-0.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_patch: Succeeded
NOTE: Running task 3322 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_write_config: Started
NOTE: recipe liba52-0.7.4-r4: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_write_config: Started
NOTE: recipe mpg123-1.26.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.33-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liba52-0.7.4-r4: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3367 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_patch)
NOTE: recipe dbus-glib-0.110-r0: task do_patch: Succeeded
NOTE: Running task 3386 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_deploy_source_date_epoch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_write_config: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3425 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_patch)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_write_config: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3432 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_patch: Succeeded
NOTE: Running task 3502 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_patch: Succeeded
NOTE: Running task 3512 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 3543 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: Running task 3544 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_patch)
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 3562 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_patch: Started
NOTE: Running task 3575 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3598 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_configure)
NOTE: recipe dbus-glib-0.110-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.26.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_patch: Succeeded
NOTE: recipe ell-0.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3611 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3612 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3613 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_patch: Started
NOTE: Running task 3621 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_populate_lic)
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 3622 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe liba52-0.7.4-r4: task do_configure: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.11.1-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_unpack: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_populate_lic: Started
NOTE: Running task 3623 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_patch)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3624 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.33-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_patch: Succeeded
NOTE: Running task 3625 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3626 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 3627 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-glib-0.110-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3628 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_configure)
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3629 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 3630 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gst-examples-1.18.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_populate_lic unihash changed to d6aeb421c2945907b67a825dec1cde5bf61181516fab4ecaf158ac07ea003950
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3631 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_configure: Started
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_patch: Succeeded
NOTE: Running task 3632 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3633 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: Running task 3634 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe ffmpeg-4.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 3635 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_patch)
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 3636 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe ffmpeg-4.3.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_patch: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3637 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3638 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-glib-0.110-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 3639 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe ffmpeg-4.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_configure: Succeeded
NOTE: Running task 3640 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_compile)
NOTE: recipe taglib-1.11.1-r0: task do_configure: Succeeded
NOTE: Running task 3641 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_compile)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_compile: Started
NOTE: recipe taglib-1.11.1-r0: task do_compile: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3642 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_configure)
NOTE: recipe gst-examples-1.18.2-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 3643 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_configure: Succeeded
NOTE: Running task 3644 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe gst-examples-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3645 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_compile: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_compile: Succeeded
NOTE: Running task 3646 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_install: Succeeded
NOTE: Running task 3647 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 3648 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package: Succeeded
NOTE: Running task 3649 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_packagedata: Started
NOTE: recipe taglib-1.11.1-r0: task do_compile: Succeeded
NOTE: Running task 3650 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_install)
NOTE: recipe gst-examples-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3651 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_install)
NOTE: recipe taglib-1.11.1-r0: task do_install: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_packagedata: Succeeded
NOTE: Running task 3652 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm)
NOTE: recipe taglib-1.11.1-r0: task do_install: Succeeded
NOTE: Running task 3653 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_package)
NOTE: Running task 3654 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_populate_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package_write_rpm: Started
NOTE: recipe taglib-1.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.11.1-r0: task do_package: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_install: Succeeded
NOTE: Running task 3655 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_package)
NOTE: Running task 3656 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_populate_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package_write_rpm: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_populate_sysroot: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_package: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_configure: Succeeded
NOTE: Running task 3657 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 3658 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe liba52-0.7.4-r4: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe taglib-1.11.1-r0: task do_package: Succeeded
NOTE: Running task 3659 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_packagedata)
NOTE: recipe taglib-1.11.1-r0: task do_packagedata: Started
NOTE: recipe taglib-1.11.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3660 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_package_write_rpm)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 3661 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe taglib-1.11.1-r0: task do_package_write_rpm: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 3662 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 3663 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe liba52-0.7.4-r4: task do_compile: Succeeded
NOTE: Running task 3664 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3665 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_compile)
NOTE: recipe liba52-0.7.4-r4: task do_install: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_compile: Started
NOTE: recipe liba52-0.7.4-r4: task do_install: Succeeded
NOTE: Running task 3666 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_package)
NOTE: Running task 3667 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_populate_sysroot)
NOTE: recipe liba52-0.7.4-r4: task do_package: Started
NOTE: recipe liba52-0.7.4-r4: task do_populate_sysroot: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3668 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_packagedata)
NOTE: recipe gst-examples-1.18.2-r0: task do_packagedata: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_packagedata: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3669 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3670 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: Running task 3671 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe liba52-0.7.4-r4: task do_populate_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe taglib-1.11.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3672 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 3673 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe liba52-0.7.4-r4: task do_package: Succeeded
NOTE: Running task 3674 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_packagedata)
NOTE: recipe ell-0.33-r0: task do_configure: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: Running task 3675 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe liba52-0.7.4-r4: task do_packagedata: Started
NOTE: recipe ell-0.33-r0: task do_compile: Started
NOTE: recipe liba52-0.7.4-r4: task do_packagedata: Succeeded
NOTE: Running task 3676 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_package_write_rpm)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_package_write_rpm: Started
NOTE: Running task 3677 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_compile: Succeeded
NOTE: Running task 3678 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_install)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_install: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3679 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_populate_sysroot)
NOTE: Running task 3680 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_package)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_populate_sysroot: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3681 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3682 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe liba52-0.7.4-r4: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_configure: Succeeded
NOTE: Running task 3683 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe dbus-glib-0.110-r0: task do_compile: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3684 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3685 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe ffmpeg-4.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.33-r0: task do_compile: Succeeded
NOTE: Running task 3686 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_install)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3687 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3688 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe ell-0.33-r0: task do_install: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_install: Started
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.33-r0: task do_install: Succeeded
NOTE: Running task 3689 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_populate_sysroot)
NOTE: Running task 3690 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_package)
NOTE: recipe ell-0.33-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.33-r0: task do_package: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_install: Succeeded
NOTE: Running task 3691 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package)
NOTE: Running task 3692 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_populate_sysroot)
NOTE: recipe ffmpeg-4.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3693 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_configure)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3694 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_configure)
NOTE: recipe ffmpeg-4.3.1-r0: task do_configure: Started
NOTE: recipe ell-0.33-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3695 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe speex-1.2.0-r0: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 3696 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 3697 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 3698 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 3699 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 3700 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 3701 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3702 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_configure)
NOTE: recipe dbus-glib-0.110-r0: task do_compile: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 3703 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_install)
NOTE: Running task 3704 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3705 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.110-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3706 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package: Succeeded
NOTE: Running task 3707 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_packagedata)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_packagedata: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3708 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3709 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.110-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3710 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_package)
NOTE: Running task 3711 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_populate_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_packagedata: Succeeded
NOTE: Running task 3712 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.110-r0: task do_package: Started
NOTE: recipe dbus-glib-0.110-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3713 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package_write_rpm: Started
NOTE: Running task 3714 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_configure)
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package: Succeeded
NOTE: Running task 3715 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_packagedata)
NOTE: recipe dbus-glib-0.110-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3716 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3717 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package_write_rpm)
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: recipe ell-0.33-r0: task do_package: Succeeded
NOTE: Running task 3718 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: Running task 3719 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_packagedata)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe ell-0.33-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.33-r0: task do_packagedata: Succeeded
NOTE: Running task 3720 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: Running task 3721 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_package_write_rpm)
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 3722 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: Running task 3723 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe ell-0.33-r0: task do_package_write_rpm: Started
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3724 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 3725 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: Running task 3726 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: Running task 3727 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_package: Succeeded
NOTE: Running task 3728 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_packagedata)
NOTE: recipe ell-0.33-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3729 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.110-r0: task do_packagedata: Succeeded
NOTE: Running task 3730 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.110-r0: task do_package_write_rpm: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: Running task 3731 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_configure: Succeeded
NOTE: Running task 3732 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_compile: Started
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: Running task 3733 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package_write_rpm)
NOTE: recipe lame-3.100-r0: task do_package_write_rpm: Started
NOTE: recipe lame-3.100-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_compile: Succeeded
NOTE: Running task 3734 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_install)
NOTE: recipe ofono-1.31-r0: task do_configure: Succeeded
NOTE: Running task 3735 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_install: Started
NOTE: recipe ofono-1.31-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3736 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_compile)
NOTE: Running task 3737 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3738 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_install: Succeeded
NOTE: Running task 3739 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_package: Started
NOTE: recipe ofono-1.31-r0: task do_compile: Succeeded
NOTE: Running task 3740 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_install)
NOTE: recipe ofono-1.31-r0: task do_install: Started
NOTE: recipe ofono-1.31-r0: task do_install: Succeeded
NOTE: Running task 3741 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_populate_sysroot)
NOTE: Running task 3742 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package)
NOTE: recipe ofono-1.31-r0: task do_package: Started
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3743 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_package: Succeeded
NOTE: Running task 3744 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_packagedata: Started
NOTE: recipe speex-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3745 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_compile)
NOTE: recipe speex-1.2.0-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3746 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_configure)
NOTE: recipe pulseaudio-14.0-r0: task do_configure: Started
NOTE: recipe speex-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3747 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_install)
NOTE: recipe speex-1.2.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3748 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_package_write_rpm)
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3749 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3750 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_install)
NOTE: recipe speex-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3751 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package)
NOTE: Running task 3752 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_populate_sysroot)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Started
NOTE: recipe speex-1.2.0-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3753 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Started
NOTE: recipe ofono-1.31-r0: task do_package: Succeeded
NOTE: Running task 3754 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_packagedata)
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-1.31-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3755 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package)
NOTE: recipe speex-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3756 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Started
NOTE: recipe ofono-1.31-r0: task do_packagedata: Succeeded
NOTE: Running task 3757 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package_write_rpm)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3758 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_packagedata)
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3759 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package_write_rpm)
NOTE: recipe speex-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3760 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe speex-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3761 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3762 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3763 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 3764 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package_write_rpm)
NOTE: Running task 3765 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: Running task 3766 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 3767 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3768 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3769 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_install)
NOTE: recipe ffmpeg-4.3.1-r0: task do_install: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_install: Succeeded
NOTE: Running task 3770 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_package)
NOTE: Running task 3771 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_populate_sysroot)
NOTE: recipe ffmpeg-4.3.1-r0: task do_package: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3772 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3773 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_configure: Succeeded
NOTE: Running task 3774 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_compile)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_compile: Succeeded
NOTE: Running task 3775 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_install)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_install: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_configure: Succeeded
NOTE: Running task 3776 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_compile)
NOTE: recipe pulseaudio-14.0-r0: task do_compile: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package: Succeeded
NOTE: Running task 3777 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_packagedata)
NOTE: recipe ffmpeg-4.3.1-r0: task do_packagedata: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3778 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_package)
NOTE: Running task 3779 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_package: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_package: Succeeded
NOTE: Running task 3780 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3781 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_compile: Succeeded
NOTE: Running task 3782 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_install)
NOTE: recipe pulseaudio-14.0-r0: task do_install: Started
NOTE: recipe pulseaudio-14.0-r0: task do_install: Succeeded
NOTE: Running task 3783 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_populate_sysroot)
NOTE: Running task 3784 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_package)
NOTE: recipe pulseaudio-14.0-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package: Started
NOTE: recipe pulseaudio-14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3785 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3786 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.26.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3787 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_configure)
NOTE: recipe mpg123-1.26.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3788 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Started
NOTE: recipe mpg123-1.26.3-r0: task do_configure: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_package: Succeeded
NOTE: Running task 3789 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_packagedata)
NOTE: recipe pulseaudio-14.0-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-14.0-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 3790 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 3791 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_install)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 3792 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Started
NOTE: recipe mpg123-1.26.3-r0: task do_configure: Succeeded
NOTE: Running task 3793 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_compile)
NOTE: recipe mpg123-1.26.3-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 3794 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_packagedata)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3795 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package_write_rpm)
NOTE: Running task 3796 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.26.3-r0: task do_compile: Succeeded
NOTE: Running task 3797 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_install)
NOTE: recipe mpg123-1.26.3-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_install: Succeeded
NOTE: Running task 3798 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_package)
NOTE: Running task 3799 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.26.3-r0: task do_package: Started
NOTE: recipe mpg123-1.26.3-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.26.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3800 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3801 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_configure: Started
NOTE: recipe mpg123-1.26.3-r0: task do_package: Succeeded
NOTE: Running task 3802 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_packagedata)
NOTE: recipe mpg123-1.26.3-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.26.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3803 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_package_write_rpm)
NOTE: recipe mpg123-1.26.3-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.26.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_configure: Succeeded
NOTE: Running task 3804 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_compile: Succeeded
NOTE: Running task 3805 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_install: Succeeded
NOTE: Running task 3806 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_package: Succeeded
NOTE: Running task 3807 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3808 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_package_write_rpm)
NOTE: Running task 3809 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_package_write_rpm)
NOTE: Running task 3810 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_package_qa: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_package_qa: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3811 of 3811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3811 tasks of which 3499 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 145 ERROR messages shown, returning a non-zero exit code.

--===============7086066629678325851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 1453 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (803 cached, 4 parsed). 1413 targets, 66 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-2090c8f1f2c58d42bbf4e323c0fb1afd4c241375"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2090c8f1f2c58d42bbf4e323c0fb1afd4c241375"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 150 Found 26 Missed 124 Current 1100 (17% match, 90% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1116 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1117 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1118 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1134 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1245 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
NOTE: Running setscene task 1246 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1248 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
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
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1250 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 2030 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: Running task 2034 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 2040 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_fetch)
NOTE: Running task 2097 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_fetch)
NOTE: Running task 2098 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: Running task 2099 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 2192 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_fetch)
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.33-r0: task do_fetch: Started
NOTE: Running task 2213 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_fetch: Succeeded
NOTE: Running task 2234 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: recipe ell-0.33-r0: task do_fetch: Succeeded
NOTE: Running task 2241 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_unpack)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: recipe ofono-1.31-r0: task do_fetch: Started
NOTE: Running task 2273 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: Running task 2287 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.31-r0: task do_fetch: Succeeded
NOTE: Running task 2288 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_unpack)
NOTE: Running task 2289 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: Running task 2290 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2292 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: recipe pulseaudio-14.0-r0: task do_fetch: Started
NOTE: Running task 2296 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_unpack: Started
NOTE: recipe ell-0.33-r0: task do_unpack: Started
NOTE: recipe pulseaudio-14.0-r0: task do_fetch: Succeeded
NOTE: Running task 2335 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_unpack)
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: Running task 2358 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: Running task 2369 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_fetch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_unpack: Started
NOTE: Running task 2407 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2408 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2411 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: recipe ell-0.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2440 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_fetch)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_unpack: Succeeded
NOTE: Running task 2469 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: Running task 2503 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: Running task 2518 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_fetch)
NOTE: Running task 2519 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_fetch)
NOTE: Running task 2520 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_fetch)
NOTE: Running task 2521 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2522 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_fetch)
NOTE: Running task 2523 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_fetch)
NOTE: recipe pulseaudio-14.0-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_fetch: Started
NOTE: Running task 2587 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_fetch)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_fetch: Succeeded
NOTE: Running task 2596 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_unpack)
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.11.1-r0: task do_fetch: Started
NOTE: Running task 2625 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.33-r0: task do_unpack: Succeeded
NOTE: Running task 2626 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_patch)
NOTE: recipe taglib-1.11.1-r0: task do_fetch: Succeeded
NOTE: Running task 2646 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_patch: Started
NOTE: recipe liba52-0.7.4-r4: task do_fetch: Started
NOTE: Running task 2673 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_fetch)
NOTE: Running task 2674 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: recipe dbus-glib-0.110-r0: task do_fetch: Started
NOTE: recipe liba52-0.7.4-r4: task do_fetch: Succeeded
NOTE: Running task 2730 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_unpack)
NOTE: Running task 2733 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_fetch)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_fetch: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_fetch: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe mpg123-1.26.3-r0: task do_fetch: Started
NOTE: Running task 2756 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_unpack)
NOTE: recipe speex-1.2.0-r0: task do_fetch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_unpack: Started
NOTE: recipe dbus-glib-0.110-r0: task do_fetch: Succeeded
NOTE: Running task 2778 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_fetch)
NOTE: Running task 2779 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_fetch)
NOTE: Running task 2780 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_fetch)
NOTE: Running task 2787 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_unpack)
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_fetch: Succeeded
NOTE: Running task 2811 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: Running task 2812 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: recipe ffmpeg-4.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 2813 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2814 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_unpack)
NOTE: Running task 2815 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_unpack)
NOTE: recipe ofono-1.31-r0: task do_unpack: Succeeded
NOTE: Running task 2819 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_unpack)
NOTE: Running task 2835 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2836 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_patch)
NOTE: Running task 2837 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.33-r0: task do_patch: Started
NOTE: Running task 2838 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-examples-1.18.2-r0: task do_fetch: Started
NOTE: Running task 2839 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe taglib-1.11.1-r0: task do_unpack: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2858 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: Running task 2868 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_fetch)
NOTE: Running task 2869 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_fetch)
NOTE: Running task 2870 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: recipe gst-examples-1.18.2-r0: task do_fetch: Succeeded
NOTE: Running task 2885 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_unpack)
NOTE: recipe dbus-glib-0.110-r0: task do_unpack: Started
NOTE: recipe liba52-0.7.4-r4: task do_unpack: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_fetch: Started
NOTE: recipe taglib-1.11.1-r0: task do_unpack: Succeeded
NOTE: Running task 2935 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: Running task 2940 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: recipe mpg123-1.26.3-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_fetch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_fetch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: Running task 2941 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2942 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_patch)
NOTE: recipe liba52-0.7.4-r4: task do_unpack: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_unpack: Started
NOTE: recipe ofono-1.31-r0: task do_patch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2944 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_patch)
NOTE: Running task 2945 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_unpack: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_unpack: Started
NOTE: recipe liba52-0.7.4-r4: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2967 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_patch)
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2977 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_patch)
NOTE: Running task 2979 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_unpack)
NOTE: Running task 2980 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_unpack)
NOTE: Running task 2981 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_unpack)
NOTE: recipe gst-examples-1.18.2-r0: task do_unpack: Started
NOTE: recipe taglib-1.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.11.1-r0: task do_patch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_unpack: Succeeded
NOTE: Running task 3075 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: Running task 3076 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_write_config)
NOTE: Running task 3077 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Started
NOTE: recipe dbus-glib-0.110-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 3078 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 3079 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_patch)
NOTE: Running task 3080 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_patch)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_patch: Started
NOTE: recipe liba52-0.7.4-r4: task do_patch: Started
NOTE: Running task 3081 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: recipe ofono-1.31-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_unpack: Started
NOTE: Running task 3082 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_deploy_source_date_epoch)
NOTE: Running task 3083 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_unpack)
NOTE: Running task 3084 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_unpack)
NOTE: Running task 3085 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Started
NOTE: recipe pulseaudio-14.0-r0: task do_patch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_unpack: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_write_config: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: Running task 3170 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_write_config)
NOTE: Running task 3171 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_write_config)
NOTE: Running task 3172 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_write_config)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_unpack: Succeeded
NOTE: Running task 3178 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 3179 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3231 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-examples-1.18.2-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: Running task 3243 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: Running task 3244 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_patch)
NOTE: Running task 3245 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: recipe speex-1.2.0-r0: task do_patch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Started
NOTE: recipe dbus-glib-0.110-r0: task do_patch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_write_config: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-14.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_write_config: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_patch: Started
NOTE: Running task 3396 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_write_config: Succeeded
NOTE: Running task 3401 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_write_config: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 3436 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 3454 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_write_config: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 3506 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_patch)
NOTE: recipe taglib-1.11.1-r0: task do_patch: Succeeded
NOTE: Running task 3553 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_generate_toolchain_file)
NOTE: Running task 3554 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3575 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3599 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_patch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_patch: Started
NOTE: recipe pulseaudio-14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_patch: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3625 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe speex-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 3626 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3627 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_patch)
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_patch: Succeeded
NOTE: Running task 3628 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liba52-0.7.4-r4: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_configure: Started
NOTE: recipe mpg123-1.26.3-r0: task do_patch: Succeeded
NOTE: Running task 3629 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: Running task 3630 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: recipe liba52-0.7.4-r4: task do_patch: Succeeded
NOTE: Running task 3631 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_deploy_source_date_epoch)
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3632 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Started
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_patch: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3633 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 3634 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_patch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 3635 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 3636 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: Running task 3637 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gst-examples-1.18.2-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3638 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3639 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_populate_lic)
NOTE: Running task 3640 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_configure)
NOTE: recipe mpg123-1.26.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3641 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_patch: Started
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3642 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe taglib-1.11.1-r0: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: Running task 3643 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.33-r0: task do_patch: Succeeded
NOTE: Running task 3644 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: Running task 3645 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.26.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3646 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 3647 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_configure)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_populate_lic: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_populate_lic unihash changed to d6aeb421c2945907b67a825dec1cde5bf61181516fab4ecaf158ac07ea003950
NOTE: Running task 3648 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3649 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_patch: Succeeded
NOTE: Running task 3650 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.33-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3651 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: Running task 3652 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_configure: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3653 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3654 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe ell-0.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3655 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 3656 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.33-r0: task do_configure: Started
NOTE: Running task 3657 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_configure)
NOTE: recipe ffmpeg-4.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 3658 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_configure: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_patch: Started
NOTE: recipe dbus-glib-0.110-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_patch: Succeeded
NOTE: Running task 3659 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 3660 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe dbus-glib-0.110-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: Running task 3661 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ffmpeg-4.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-glib-0.110-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3662 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_configure)
NOTE: recipe ffmpeg-4.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_configure: Started
NOTE: recipe taglib-1.11.1-r0: task do_configure: Succeeded
NOTE: Running task 3663 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_compile)
NOTE: recipe taglib-1.11.1-r0: task do_compile: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_configure: Succeeded
NOTE: Running task 3664 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_compile)
NOTE: recipe gst-examples-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_compile: Started
NOTE: Running task 3665 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_configure)
NOTE: recipe gst-examples-1.18.2-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 3666 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_configure: Succeeded
NOTE: Running task 3667 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_compile: Succeeded
NOTE: Running task 3668 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_install: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3669 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_install: Succeeded
NOTE: Running task 3670 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 3671 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe gst-examples-1.18.2-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_populate_sysroot: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_compile: Succeeded
NOTE: Running task 3672 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_install)
NOTE: recipe taglib-1.11.1-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package: Succeeded
NOTE: Running task 3673 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_packagedata: Started
NOTE: recipe taglib-1.11.1-r0: task do_install: Succeeded
NOTE: Running task 3674 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_package)
NOTE: Running task 3675 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_populate_sysroot)
NOTE: recipe taglib-1.11.1-r0: task do_package: Started
NOTE: recipe taglib-1.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_packagedata: Succeeded
NOTE: Running task 3676 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package_write_rpm: Started
NOTE: recipe taglib-1.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3677 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_install)
NOTE: recipe gst-examples-1.18.2-r0: task do_install: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_install: Succeeded
NOTE: Running task 3678 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_package)
NOTE: Running task 3679 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_populate_sysroot)
NOTE: recipe gst-examples-1.18.2-r0: task do_package: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.11.1-r0: task do_package: Succeeded
NOTE: Running task 3680 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_packagedata)
NOTE: recipe taglib-1.11.1-r0: task do_packagedata: Started
NOTE: recipe taglib-1.11.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3681 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_package_write_rpm)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 3682 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe gst-examples-1.18.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_package_write_rpm: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe liba52-0.7.4-r4: task do_configure: Succeeded
NOTE: Running task 3683 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_compile)
NOTE: recipe liba52-0.7.4-r4: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 3684 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 3685 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 3686 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3687 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_compile)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_compile: Started
NOTE: recipe liba52-0.7.4-r4: task do_compile: Succeeded
NOTE: Running task 3688 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_install)
NOTE: recipe liba52-0.7.4-r4: task do_install: Started
NOTE: recipe liba52-0.7.4-r4: task do_install: Succeeded
NOTE: Running task 3689 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_package)
NOTE: Running task 3690 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_populate_sysroot)
NOTE: recipe liba52-0.7.4-r4: task do_package: Started
NOTE: recipe liba52-0.7.4-r4: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3691 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe liba52-0.7.4-r4: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe taglib-1.11.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 3692 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 3693 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3694 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: Running task 3695 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3696 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_packagedata)
NOTE: recipe gst-examples-1.18.2-r0: task do_packagedata: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3697 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.33-r0: task do_configure: Succeeded
NOTE: Running task 3698 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_compile)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_compile: Succeeded
NOTE: Running task 3699 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_install)
NOTE: recipe ell-0.33-r0: task do_compile: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3700 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe liba52-0.7.4-r4: task do_package: Succeeded
NOTE: Running task 3701 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_install: Succeeded
NOTE: Running task 3702 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_populate_sysroot)
NOTE: Running task 3703 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_package)
NOTE: recipe liba52-0.7.4-r4: task do_packagedata: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_populate_sysroot: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_packagedata: Succeeded
NOTE: Running task 3704 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_package_write_rpm)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3705 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3706 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe liba52-0.7.4-r4: task do_package_write_rpm: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3707 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3708 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_install)
NOTE: recipe ffmpeg-4.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3709 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe dbus-glib-0.110-r0: task do_configure: Succeeded
NOTE: Running task 3710 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_compile)
NOTE: recipe ell-0.33-r0: task do_compile: Succeeded
NOTE: Running task 3711 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_install)
NOTE: recipe ffmpeg-4.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3712 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_configure)
NOTE: recipe liba52-0.7.4-r4: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_compile: Started
NOTE: recipe ell-0.33-r0: task do_install: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_configure: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_install: Succeeded
NOTE: Running task 3713 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package)
NOTE: Running task 3714 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_populate_sysroot)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.33-r0: task do_install: Succeeded
NOTE: Running task 3715 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_populate_sysroot)
NOTE: Running task 3716 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_package)
NOTE: recipe ell-0.33-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.33-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 3717 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 3718 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 3719 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe ell-0.33-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3720 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 3721 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3722 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: Running task 3723 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3724 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package: Succeeded
NOTE: Running task 3725 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 3726 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: Running task 3727 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_packagedata: Started
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3728 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_configure)
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3729 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_configure)
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3730 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe speex-1.2.0-r0: task do_configure: Started
NOTE: recipe ofono-1.31-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 3731 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3732 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_packagedata: Succeeded
NOTE: Running task 3733 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_package_write_rpm)
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package_write_rpm: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3734 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3735 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.110-r0: task do_compile: Succeeded
NOTE: Running task 3736 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_install)
NOTE: recipe dbus-glib-0.110-r0: task do_install: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package: Succeeded
NOTE: Running task 3737 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_packagedata)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3738 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_configure)
NOTE: Running task 3739 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_configure)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3740 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.110-r0: task do_install: Succeeded
NOTE: Running task 3741 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_package)
NOTE: Running task 3742 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_populate_sysroot)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: Running task 3743 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: recipe dbus-glib-0.110-r0: task do_package: Started
NOTE: recipe dbus-glib-0.110-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3744 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3745 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.110-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3746 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.33-r0: task do_package: Succeeded
NOTE: Running task 3747 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_configure: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe ell-0.33-r0: task do_packagedata: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ell-0.33-r0: task do_packagedata: Succeeded
NOTE: Running task 3748 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 3749 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: Running task 3750 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe ell-0.33-r0: task do_package_write_rpm: Started
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 3751 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: Running task 3752 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe lame-3.100-r0: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3753 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe ell-0.33-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_package: Succeeded
NOTE: Running task 3754 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_packagedata)
NOTE: recipe dbus-glib-0.110-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.110-r0: task do_packagedata: Succeeded
NOTE: Running task 3755 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.110-r0: task do_package_write_rpm: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_configure: Succeeded
NOTE: Running task 3756 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_compile: Started
NOTE: recipe dbus-glib-0.110-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_compile: Succeeded
NOTE: Running task 3757 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_install: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3758 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_compile)
NOTE: recipe ffmpeg-4.3.1-r0: task do_compile: Started
NOTE: recipe ofono-1.31-r0: task do_configure: Succeeded
NOTE: Running task 3759 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_compile)
NOTE: recipe ofono-1.31-r0: task do_compile: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3760 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3761 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_compile)
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_install: Succeeded
NOTE: Running task 3762 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_package: Started
NOTE: recipe ofono-1.31-r0: task do_compile: Succeeded
NOTE: Running task 3763 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_install)
NOTE: recipe ofono-1.31-r0: task do_install: Started
NOTE: recipe ofono-1.31-r0: task do_install: Succeeded
NOTE: Running task 3764 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_populate_sysroot)
NOTE: Running task 3765 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package)
NOTE: recipe ofono-1.31-r0: task do_package: Started
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_package: Succeeded
NOTE: Running task 3766 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_packagedata: Started
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3767 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3768 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3769 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_configure)
NOTE: recipe pulseaudio-14.0-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3770 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_install)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3771 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_install)
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Started
NOTE: recipe speex-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3772 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_compile)
NOTE: recipe speex-1.2.0-r0: task do_compile: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3773 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3774 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_install)
NOTE: recipe speex-1.2.0-r0: task do_install: Started
NOTE: recipe ofono-1.31-r0: task do_package: Succeeded
NOTE: Running task 3775 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_packagedata)
NOTE: recipe ofono-1.31-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3776 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Started
NOTE: Running task 3777 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_packagedata)
NOTE: recipe ofono-1.31-r0: task do_packagedata: Succeeded
NOTE: Running task 3778 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package_write_rpm)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Started
NOTE: recipe speex-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3779 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package)
NOTE: Running task 3780 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_populate_sysroot)
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Started
NOTE: recipe speex-1.2.0-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3781 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3782 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_packagedata)
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3783 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3784 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package_write_rpm)
NOTE: recipe speex-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3785 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 3786 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3787 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 3788 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package_write_rpm)
NOTE: Running task 3789 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 3790 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3791 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3792 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_install)
NOTE: recipe ffmpeg-4.3.1-r0: task do_install: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_install: Succeeded
NOTE: Running task 3793 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_package)
NOTE: Running task 3794 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_populate_sysroot)
NOTE: recipe pulseaudio-14.0-r0: task do_configure: Succeeded
NOTE: Running task 3795 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_compile)
NOTE: recipe ffmpeg-4.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package: Started
NOTE: recipe pulseaudio-14.0-r0: task do_compile: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3796 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3797 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_configure: Succeeded
NOTE: Running task 3798 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_compile)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.0-r0: task do_compile: Succeeded
NOTE: Running task 3799 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_install)
NOTE: recipe pulseaudio-14.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_compile: Succeeded
NOTE: Running task 3800 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_install)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_install: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_install: Succeeded
NOTE: Running task 3801 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_populate_sysroot)
NOTE: Running task 3802 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_package)
NOTE: recipe pulseaudio-14.0-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package: Started
NOTE: recipe pulseaudio-14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3803 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3804 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.26.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.26.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3805 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3806 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_configure)
NOTE: recipe mpg123-1.26.3-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package: Succeeded
NOTE: Running task 3807 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_packagedata)
NOTE: recipe ffmpeg-4.3.1-r0: task do_packagedata: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3808 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_package)
NOTE: Running task 3809 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_package: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_package: Succeeded
NOTE: Running task 3810 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3811 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_package: Succeeded
NOTE: Running task 3812 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_packagedata)
NOTE: recipe pulseaudio-14.0-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-14.0-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 3813 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 3814 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_install)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 3815 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 3816 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_packagedata)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.26.3-r0: task do_configure: Succeeded
NOTE: Running task 3817 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_compile)
NOTE: recipe mpg123-1.26.3-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3818 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package_write_rpm)
NOTE: Running task 3819 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_compile: Succeeded
NOTE: Running task 3820 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_install)
NOTE: recipe mpg123-1.26.3-r0: task do_install: Started
NOTE: recipe mpg123-1.26.3-r0: task do_install: Succeeded
NOTE: Running task 3821 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_package)
NOTE: Running task 3822 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.26.3-r0: task do_package: Started
NOTE: recipe mpg123-1.26.3-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.26.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3823 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3824 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_configure: Started
NOTE: recipe mpg123-1.26.3-r0: task do_package: Succeeded
NOTE: Running task 3825 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_packagedata)
NOTE: recipe mpg123-1.26.3-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.26.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3826 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_package_write_rpm)
NOTE: recipe mpg123-1.26.3-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_configure: Succeeded
NOTE: Running task 3827 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_compile: Succeeded
NOTE: Running task 3828 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_install: Succeeded
NOTE: Running task 3829 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_package: Succeeded
NOTE: Running task 3830 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3831 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_package_write_rpm)
NOTE: Running task 3832 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_package_write_rpm)
NOTE: Running task 3833 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_package_qa: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_package_qa: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3834 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3834 tasks of which 3522 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 145 ERROR messages shown, returning a non-zero exit code.

--===============7086066629678325851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1489 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (806 cached, 1 parsed). 1413 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-2090c8f1f2c58d42bbf4e323c0fb1afd4c241375"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2090c8f1f2c58d42bbf4e323c0fb1afd4c241375"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 150 Found 26 Missed 124 Current 1100 (17% match, 90% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1116 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1117 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1118 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1134 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1245 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1246 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_packagedata_setscene)
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.2.154.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.2.162.0-r0 to 0:1.2.154.0-r0) [version-going-backwards]
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1248 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-headers-1.2.154.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
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
NOTE: Running task 2048 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: Running task 2052 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2058 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_fetch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: Running task 2115 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 2116 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: Running task 2117 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_fetch)
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
ERROR: gtk+3-3.24.23-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.24-r0 to 0:3.24.23-r0) [version-going-backwards]
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: recipe ell-0.33-r0: task do_fetch: Started
NOTE: Running task 2210 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_fetch)
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2265 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1250 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: recipe ofono-1.31-r0: task do_fetch: Started
NOTE: recipe ell-0.33-r0: task do_fetch: Succeeded
NOTE: Running task 2282 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_unpack)
NOTE: Running task 2288 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: Running task 2302 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2304 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: Running task 2305 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: recipe ofono-1.31-r0: task do_fetch: Succeeded
NOTE: Running task 2328 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_unpack)
NOTE: recipe pulseaudio-14.0-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 2363 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_fetch)
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: Running task 2369 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: recipe ell-0.33-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: Running task 2402 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.0-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 2403 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_unpack)
NOTE: Running task 2404 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2435 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_fetch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: recipe ell-0.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_fetch: Succeeded
NOTE: Running task 2454 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 2455 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.31-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: Running task 2477 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_fetch: Started
NOTE: Running task 2513 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_fetch)
NOTE: Running task 2514 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2515 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_fetch)
NOTE: Running task 2516 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_fetch)
NOTE: Running task 2517 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_fetch)
NOTE: Running task 2518 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_fetch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: Running task 2528 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe taglib-1.11.1-r0: task do_fetch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_fetch: Succeeded
NOTE: Running task 2565 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_unpack)
NOTE: recipe pulseaudio-14.0-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.11.1-r0: task do_fetch: Succeeded
NOTE: Running task 2579 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: Running task 2580 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_unpack)
NOTE: Running task 2588 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_fetch)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_unpack: Started
NOTE: recipe liba52-0.7.4-r4: task do_fetch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: recipe liba52-0.7.4-r4: task do_fetch: Succeeded
NOTE: Running task 2625 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: Running task 2653 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_unpack)
NOTE: recipe ell-0.33-r0: task do_unpack: Succeeded
NOTE: Running task 2663 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_patch)
NOTE: recipe mpg123-1.26.3-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: recipe speex-1.2.0-r0: task do_fetch: Started
NOTE: Running task 2673 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_fetch)
NOTE: Running task 2674 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe ffmpeg-4.3.1-r0: task do_fetch: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_fetch: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_fetch: Started
NOTE: Running task 2683 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2684 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_unpack)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_unpack: Started
NOTE: recipe speex-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2714 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_unpack)
NOTE: recipe ffmpeg-4.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 2735 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_fetch)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 2736 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_unpack)
NOTE: Running task 2744 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_unpack)
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: Running task 2781 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_fetch)
NOTE: Running task 2782 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_fetch)
NOTE: Running task 2783 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_fetch)
NOTE: recipe taglib-1.11.1-r0: task do_unpack: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.33-r0: task do_patch: Started
NOTE: recipe dbus-glib-0.110-r0: task do_fetch: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_fetch: Started
NOTE: recipe mpg123-1.26.3-r0: task do_unpack: Started
NOTE: recipe liba52-0.7.4-r4: task do_unpack: Started
NOTE: Running task 2831 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2832 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2833 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_fetch: Succeeded
NOTE: Running task 2834 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2835 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2836 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_unpack)
NOTE: recipe speex-1.2.0-r0: task do_unpack: Started
NOTE: Running task 2855 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: Running task 2865 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_fetch)
NOTE: Running task 2866 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_fetch)
NOTE: Running task 2867 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_unpack: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_unpack: Started
NOTE: recipe dbus-glib-0.110-r0: task do_fetch: Succeeded
NOTE: Running task 2927 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_unpack)
NOTE: Running task 2936 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_fetch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_fetch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Started
NOTE: recipe taglib-1.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liba52-0.7.4-r4: task do_unpack: Succeeded
NOTE: Running task 2952 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_unpack: Started
NOTE: recipe taglib-1.11.1-r0: task do_unpack: Succeeded
NOTE: Running task 2970 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_unpack)
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: Running task 2971 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_patch)
NOTE: recipe speex-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_fetch: Succeeded
NOTE: Running task 2972 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_unpack)
NOTE: Running task 2974 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_unpack)
NOTE: Running task 2985 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_patch)
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: Running task 3005 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Started
NOTE: Running task 3069 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_write_config)
NOTE: Running task 3070 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_unpack: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_unpack: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_patch: Started
NOTE: Running task 3071 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_patch)
NOTE: Running task 3072 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: Running task 3115 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_unpack: Started
NOTE: recipe speex-1.2.0-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3158 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_write_config)
NOTE: Running task 3159 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_write_config)
NOTE: Running task 3160 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_write_config)
NOTE: recipe taglib-1.11.1-r0: task do_patch: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_write_config: Started
NOTE: Running task 3217 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_write_config: Succeeded
NOTE: Running task 3282 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_unpack)
NOTE: recipe dbus-glib-0.110-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3283 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_patch: Started
NOTE: Running task 3294 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: Running task 3295 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_write_config: Started
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 3348 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_unpack)
NOTE: Running task 3357 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: recipe ofono-1.31-r0: task do_unpack: Succeeded
NOTE: Running task 3396 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_write_config: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_unpack: Succeeded
NOTE: Running task 3429 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: Running task 3507 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_write_config: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 3608 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3609 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: recipe speex-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_patch: Started
NOTE: Running task 3610 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 3611 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_patch)
NOTE: recipe ofono-1.31-r0: task do_patch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_unpack: Succeeded
NOTE: Running task 3612 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_patch: Started
NOTE: recipe liba52-0.7.4-r4: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_patch: Succeeded
NOTE: Running task 3613 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_patch: Succeeded
NOTE: Running task 3614 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_deploy_source_date_epoch)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ofono-1.31-r0: task do_patch: Succeeded
NOTE: Running task 3615 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_patch: Succeeded
NOTE: Running task 3616 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liba52-0.7.4-r4: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_unpack: Succeeded
NOTE: Running task 3617 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 3618 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: Running task 3619 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-14.0-r0: task do_unpack: Succeeded
NOTE: Running task 3620 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_patch)
NOTE: recipe dbus-glib-0.110-r0: task do_unpack: Succeeded
NOTE: Running task 3621 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_patch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_patch: Succeeded
NOTE: Running task 3622 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: recipe pulseaudio-14.0-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3623 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_patch)
NOTE: recipe dbus-glib-0.110-r0: task do_patch: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_unpack: Succeeded
NOTE: Running task 3624 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_patch)
NOTE: recipe mpg123-1.26.3-r0: task do_patch: Succeeded
NOTE: Running task 3625 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3626 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_configure)
NOTE: recipe taglib-1.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 3627 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_patch)
NOTE: recipe gst-examples-1.18.2-r0: task do_patch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Started
NOTE: recipe mpg123-1.26.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 3628 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_configure: Started
NOTE: Running task 3629 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_patch: Succeeded
NOTE: Running task 3630 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3631 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_configure)
NOTE: recipe taglib-1.11.1-r0: task do_patch: Succeeded
NOTE: Running task 3632 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_generate_toolchain_file)
NOTE: Running task 3633 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_deploy_source_date_epoch)
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3634 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_patch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_patch: Succeeded
NOTE: Running task 3635 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_patch)
NOTE: Running task 3636 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.26.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Started
NOTE: recipe taglib-1.11.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe taglib-1.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 3637 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: recipe taglib-1.11.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: Running task 3638 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_patch: Succeeded
NOTE: Running task 3639 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3640 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3641 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3642 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3643 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3644 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.33-r0: task do_patch: Succeeded
NOTE: Running task 3645 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_patch: Succeeded
NOTE: Running task 3646 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_configure: Started
NOTE: recipe taglib-1.11.1-r0: task do_configure: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_unpack: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3647 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_patch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3648 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: recipe ell-0.33-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 3649 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: Running task 3650 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: Running task 3651 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe ell-0.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_patch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3652 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 3653 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.33-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: Running task 3654 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe ffmpeg-4.3.1-r0: task do_patch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3655 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3656 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_configure: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3657 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 3658 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe taglib-1.11.1-r0: task do_configure: Succeeded
NOTE: Running task 3659 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_compile)
NOTE: recipe dbus-glib-0.110-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_patch: Succeeded
NOTE: Running task 3660 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.11.1-r0: task do_compile: Started
NOTE: recipe dbus-glib-0.110-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-glib-0.110-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3661 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_configure)
NOTE: recipe dbus-glib-0.110-r0: task do_configure: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_configure: Succeeded
NOTE: Running task 3662 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_compile)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_compile: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_patch: Succeeded
NOTE: Running task 3663 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3664 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_populate_lic)
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 3665 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe gst-examples-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_populate_lic: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_configure: Succeeded
NOTE: Running task 3666 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3667 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_configure)
NOTE: recipe gst-examples-1.18.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_populate_lic unihash changed to d6aeb421c2945907b67a825dec1cde5bf61181516fab4ecaf158ac07ea003950
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_compile: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_compile: Succeeded
NOTE: Running task 3668 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_install: Succeeded
NOTE: Running task 3669 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 3670 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package: Succeeded
NOTE: Running task 3671 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_packagedata: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3672 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_compile)
NOTE: recipe taglib-1.11.1-r0: task do_compile: Succeeded
NOTE: Running task 3673 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_install)
NOTE: recipe gst-examples-1.18.2-r0: task do_compile: Started
NOTE: recipe taglib-1.11.1-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_packagedata: Succeeded
NOTE: Running task 3674 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package_write_rpm: Started
NOTE: recipe taglib-1.11.1-r0: task do_install: Succeeded
NOTE: Running task 3675 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_package)
NOTE: Running task 3676 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_populate_sysroot)
NOTE: recipe taglib-1.11.1-r0: task do_package: Started
NOTE: recipe taglib-1.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3677 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_install)
NOTE: recipe gst-examples-1.18.2-r0: task do_install: Started
NOTE: recipe taglib-1.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_install: Succeeded
NOTE: Running task 3678 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_package)
NOTE: Running task 3679 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_populate_sysroot)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 3680 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe gst-examples-1.18.2-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_populate_sysroot: Started
NOTE: recipe liba52-0.7.4-r4: task do_configure: Succeeded
NOTE: Running task 3681 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_compile)
NOTE: recipe liba52-0.7.4-r4: task do_compile: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_package: Succeeded
NOTE: Running task 3682 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 3683 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe taglib-1.11.1-r0: task do_packagedata: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe taglib-1.11.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3684 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_package_write_rpm)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 3685 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 3686 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe taglib-1.11.1-r0: task do_package_write_rpm: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe liba52-0.7.4-r4: task do_compile: Succeeded
NOTE: Running task 3687 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_install)
NOTE: recipe liba52-0.7.4-r4: task do_install: Started
NOTE: recipe liba52-0.7.4-r4: task do_install: Succeeded
NOTE: Running task 3688 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_package)
NOTE: Running task 3689 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_populate_sysroot)
NOTE: recipe liba52-0.7.4-r4: task do_package: Started
NOTE: recipe liba52-0.7.4-r4: task do_populate_sysroot: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3690 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_compile)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3691 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: Running task 3692 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3693 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: recipe liba52-0.7.4-r4: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3694 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3695 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe liba52-0.7.4-r4: task do_package: Succeeded
NOTE: Running task 3696 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 3697 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe liba52-0.7.4-r4: task do_packagedata: Started
NOTE: recipe taglib-1.11.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ell-0.33-r0: task do_configure: Succeeded
NOTE: Running task 3698 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3699 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3700 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe liba52-0.7.4-r4: task do_packagedata: Succeeded
NOTE: Running task 3701 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_package_write_rpm)
NOTE: recipe ell-0.33-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 3702 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe liba52-0.7.4-r4: task do_package_write_rpm: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3703 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3704 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-examples-1.18.2-r0: task do_packagedata: Started
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3705 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_configure)
NOTE: recipe liba52-0.7.4-r4: task do_package_write_rpm: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_packagedata: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_configure: Started
NOTE: recipe ell-0.33-r0: task do_compile: Succeeded
NOTE: Running task 3706 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_install)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3707 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_install)
NOTE: recipe ell-0.33-r0: task do_install: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_install: Started
NOTE: recipe ell-0.33-r0: task do_install: Succeeded
NOTE: Running task 3708 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_populate_sysroot)
NOTE: Running task 3709 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_package)
NOTE: recipe ell-0.33-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.33-r0: task do_package: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_install: Succeeded
NOTE: Running task 3710 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package)
NOTE: Running task 3711 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_populate_sysroot)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3712 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe ell-0.33-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3713 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3714 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.110-r0: task do_configure: Succeeded
NOTE: Running task 3715 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_compile)
NOTE: recipe dbus-glib-0.110-r0: task do_compile: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3716 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: Running task 3717 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 3718 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 3719 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_compile: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: Running task 3720 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_install)
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 3721 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_install: Started
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_install: Succeeded
NOTE: Running task 3722 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_populate_sysroot)
NOTE: Running task 3723 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_package)
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 3724 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_populate_sysroot: Started
NOTE: Running task 3725 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3726 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_configure)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.31-r0: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: Running task 3727 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: Running task 3728 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3729 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 3730 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3731 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe ffmpeg-4.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3732 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_configure)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3733 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ffmpeg-4.3.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-glib-0.110-r0: task do_compile: Succeeded
NOTE: Running task 3734 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_install)
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3735 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3736 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_configure)
NOTE: recipe dbus-glib-0.110-r0: task do_install: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package: Succeeded
NOTE: Running task 3737 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_packagedata: Started
NOTE: recipe ell-0.33-r0: task do_package: Succeeded
NOTE: Running task 3738 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_packagedata)
NOTE: recipe dbus-glib-0.110-r0: task do_install: Succeeded
NOTE: Running task 3739 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_package)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3740 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_populate_sysroot)
NOTE: Running task 3741 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package_write_rpm)
NOTE: recipe ell-0.33-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.110-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-glib-0.110-r0: task do_package: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe ell-0.33-r0: task do_packagedata: Succeeded
NOTE: Running task 3742 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_package_write_rpm)
NOTE: recipe ell-0.33-r0: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: Running task 3743 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: recipe dbus-glib-0.110-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3744 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package: Succeeded
NOTE: Running task 3745 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_packagedata)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3746 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 3747 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_packagedata: Succeeded
NOTE: Running task 3748 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_package_write_rpm)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package_write_rpm: Started
NOTE: recipe ell-0.33-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3749 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 3750 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: Running task 3751 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: Running task 3752 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package_write_rpm)
NOTE: recipe lame-3.100-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3753 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.110-r0: task do_package: Succeeded
NOTE: Running task 3754 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_packagedata)
NOTE: recipe lame-3.100-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.110-r0: task do_packagedata: Succeeded
NOTE: Running task 3755 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.110-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.110-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_configure: Succeeded
NOTE: Running task 3756 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_compile: Started
NOTE: recipe ofono-1.31-r0: task do_configure: Succeeded
NOTE: Running task 3757 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_compile)
NOTE: recipe ofono-1.31-r0: task do_compile: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_compile: Succeeded
NOTE: Running task 3758 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_install: Started
NOTE: recipe speex-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3759 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3760 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_compile)
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3761 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_compile)
NOTE: recipe speex-1.2.0-r0: task do_compile: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Started
NOTE: recipe ofono-1.31-r0: task do_compile: Succeeded
NOTE: Running task 3762 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_install)
NOTE: recipe ofono-1.31-r0: task do_install: Started
NOTE: recipe speex-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3763 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_install)
NOTE: recipe speex-1.2.0-r0: task do_install: Started
NOTE: recipe ofono-1.31-r0: task do_install: Succeeded
NOTE: Running task 3764 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_install: Succeeded
NOTE: Running task 3765 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package)
NOTE: Running task 3766 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_package)
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3767 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package)
NOTE: Running task 3768 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_populate_sysroot)
NOTE: recipe speex-1.2.0-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3769 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3770 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_compile)
NOTE: recipe ffmpeg-4.3.1-r0: task do_compile: Started
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3771 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_packagedata)
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_package: Succeeded
NOTE: Running task 3772 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_packagedata)
NOTE: recipe pulseaudio-14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3773 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_packagedata: Started
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_configure: Started
NOTE: Running task 3774 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package_write_rpm)
NOTE: recipe speex-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe speex-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3775 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_install)
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3776 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_install)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3777 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3778 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_package_write_rpm: Started
NOTE: recipe ofono-1.31-r0: task do_package: Succeeded
NOTE: Running task 3779 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_packagedata)
NOTE: recipe ofono-1.31-r0: task do_packagedata: Started
NOTE: recipe ofono-1.31-r0: task do_packagedata: Succeeded
NOTE: Running task 3780 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package_write_rpm)
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3781 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package)
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3782 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3783 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3784 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3785 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 3786 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package_write_rpm)
NOTE: Running task 3787 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3788 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 3789 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 3790 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3791 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3792 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_install)
NOTE: recipe ffmpeg-4.3.1-r0: task do_install: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_install: Succeeded
NOTE: Running task 3793 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_package)
NOTE: Running task 3794 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_populate_sysroot)
NOTE: recipe ffmpeg-4.3.1-r0: task do_package: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3795 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3796 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_configure: Succeeded
NOTE: Running task 3797 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_compile)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.0-r0: task do_configure: Succeeded
NOTE: Running task 3798 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_compile)
NOTE: recipe pulseaudio-14.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_compile: Succeeded
NOTE: Running task 3799 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_install)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_install: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_compile: Succeeded
NOTE: Running task 3800 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_install)
NOTE: recipe pulseaudio-14.0-r0: task do_install: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package: Succeeded
NOTE: Running task 3801 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_packagedata)
NOTE: recipe ffmpeg-4.3.1-r0: task do_packagedata: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3802 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_package)
NOTE: Running task 3803 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_package: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.0-r0: task do_install: Succeeded
NOTE: Running task 3804 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_populate_sysroot)
NOTE: Running task 3805 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_package)
NOTE: recipe pulseaudio-14.0-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package: Started
NOTE: recipe pulseaudio-14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3806 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3807 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.26.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_package: Succeeded
NOTE: Running task 3808 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_packagedata: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3809 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb:do_package_write_rpm)
NOTE: Running task 3810 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3811 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.26.3-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-libav-1.18.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_package: Succeeded
NOTE: Running task 3812 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_packagedata)
NOTE: recipe pulseaudio-14.0-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-14.0-r0: task do_packagedata: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 3813 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 3814 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_install)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 3815 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Started
NOTE: recipe mpg123-1.26.3-r0: task do_configure: Succeeded
NOTE: Running task 3816 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_compile)
NOTE: recipe mpg123-1.26.3-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 3817 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_packagedata)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3818 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package_write_rpm)
NOTE: Running task 3819 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_compile: Succeeded
NOTE: Running task 3820 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_install)
NOTE: recipe mpg123-1.26.3-r0: task do_install: Started
NOTE: recipe mpg123-1.26.3-r0: task do_install: Succeeded
NOTE: Running task 3821 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_package)
NOTE: Running task 3822 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.26.3-r0: task do_package: Started
NOTE: recipe mpg123-1.26.3-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.26.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3823 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3824 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_configure: Started
NOTE: recipe mpg123-1.26.3-r0: task do_package: Succeeded
NOTE: Running task 3825 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_packagedata)
NOTE: recipe mpg123-1.26.3-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.26.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3826 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_package_write_rpm)
NOTE: recipe mpg123-1.26.3-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.26.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_configure: Succeeded
NOTE: Running task 3827 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_compile: Succeeded
NOTE: Running task 3828 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_install: Succeeded
NOTE: Running task 3829 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_package: Succeeded
NOTE: Running task 3830 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3831 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb:do_package_write_rpm)
NOTE: Running task 3832 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_package_write_rpm)
NOTE: Running task 3833 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_package_qa: Started
NOTE: recipe gst-examples-1.18.2-r0: task do_package_qa: Succeeded
NOTE: recipe gst-examples-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3834 of 3834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3834 tasks of which 3522 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 145 ERROR messages shown, returning a non-zero exit code.

--===============7086066629678325851==--
