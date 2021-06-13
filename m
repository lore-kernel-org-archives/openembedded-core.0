Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.16469.1623585061643365875
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jun 2021 04:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 059D038C13DC
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Jun 2021 11:51:02 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mpg123: upgrading to 1.28.0 SUCCEEDED
Message-ID: <MADEUP.1688220315E1D176.15968@lists.openembedded.org>
X-Groupsio-MsgNum: 152911
Content-Type: multipart/mixed; boundary="===============3265882017056905242=="

--===============3265882017056905242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mpg123* to *1.28.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mpg123-upgrade-1.27.2-1.28.0.patch
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

--===============3265882017056905242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 817 .bb files complete (0 cached, 817 parsed). 1454 targets, 41 skipped, 0 masked, 0 errors.
Removing 155 recipes from the core2-32 sysroot...done.
Removing 159 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-6c007fa33619e3873c2e22d3eab12264915fafaf"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6c007fa33619e3873c2e22d3eab12264915fafaf"
workspace            = "master:29c42cf24da05abb499936556dad1902e110c5a7"

Initialising tasks...done.
Sstate summary: Wanted 780 Local 653 Network 0 Missed 127 Current 235 (83% match, 87% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 238 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 247 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 271 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 285 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.40.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_package_write_rpm_setscene)
NOTE: recipe bluez5-5.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 292 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 293 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 294 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 295 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 296 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 297 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 298 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 299 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.40.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bluez5-5.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.20.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 300 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 301 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 302 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 304 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 305 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 306 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 307 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 308 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 309 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 311 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 312 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 313 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 315 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 316 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 317 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 318 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 319 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 320 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 321 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 322 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.40.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 323 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.40.1.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 324 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 326 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 327 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe python3-pycairo-1.20.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 328 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_package_write_rpm_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 331 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 332 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 333 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 334 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 336 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 338 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 339 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 341 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 342 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 343 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pygobject-3.40.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 344 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.106-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 345 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 346 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 347 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 348 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 349 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 351 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 352 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 353 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 354 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 356 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 357 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 360 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 361 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: Running setscene task 362 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 365 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 366 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 367 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 368 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 369 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 370 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 371 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 374 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 375 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 376 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_package_write_rpm_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 377 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 378 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.106-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 379 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 380 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 381 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 382 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: recipe python3-pygobject-3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 384 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 387 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 399 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 432 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.58.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.58.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 456 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 495 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 496 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 497 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 503 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.7.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 529 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 530 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 531 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 532 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 533 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 534 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 540 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 541 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.50.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 542 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 548 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 549 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 550 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 551 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 552 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 553 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 554 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe mesa-2_21.1.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 555 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pycairo-1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 556 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 560 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 561 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 562 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.58-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.58-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.42+gitAUTOINC+422f8a09a8_a673c12715-r0: task do_deploy_setscene: Started
NOTE: recipe linux-yocto-5.10.42+gitAUTOINC+422f8a09a8_a673c12715-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.50-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libical-3.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-69.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 573 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 574 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pycairo-1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 582 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.58-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 584 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.42+gitAUTOINC+422f8a09a8_a673c12715-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 585 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.50-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libical-3.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 595 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.58.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 596 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 603 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.42+gitAUTOINC+422f8a09a8_a673c12715-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 606 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 607 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-69.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.58-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-5.10.42+gitAUTOINC+422f8a09a8_a673c12715-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.58-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 694 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 719 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_fetch)
NOTE: Running task 722 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 723 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_fetch)
NOTE: Running task 725 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_fetch)
NOTE: Running task 765 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 768 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_fetch)
NOTE: Running task 769 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: Running task 770 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 774 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: Running task 783 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_fetch)
NOTE: Running task 784 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 785 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 786 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: Running task 787 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 788 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 829 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: Running task 835 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_fetch)
NOTE: Running task 873 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_fetch)
NOTE: Running task 885 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_write_config)
NOTE: Running task 888 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_fetch)
NOTE: Running task 901 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_fetch)
NOTE: Running task 933 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: Running task 934 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_fetch)
NOTE: Running task 935 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_fetch)
NOTE: Running task 936 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.42+gitAUTOINC+422f8a09a8_a673c12715-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.42+gitAUTOINC+422f8a09a8_a673c12715-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: Running setscene task 618 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_fetch: Started
NOTE: Running setscene task 620 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe ell-0.40-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: Running task 1058 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe flac-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1064 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_unpack)
NOTE: Running task 1065 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe libical-3.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe ofono-1.32-r0: task do_fetch: Started
NOTE: Running setscene task 626 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 628 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1068 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_unpack)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1069 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_unpack)
NOTE: recipe ell-0.40-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe ofono-1.32-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Started
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Started
NOTE: recipe mpg123-1.28.0-r0: task do_fetch: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_fetch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_fetch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: Running setscene task 638 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_fetch: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_fetch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_fetch: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Started
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: Running task 1121 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 1122 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_unpack)
NOTE: Running task 1123 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: Running task 1124 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 1125 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: Running task 1128 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_unpack)
NOTE: Running task 1129 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: Running task 1130 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 1131 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: Running task 1132 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_fetch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: Running task 1134 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 1135 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: Running task 1136 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_unpack)
NOTE: Running task 1140 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_unpack)
NOTE: Running task 1142 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_unpack)
NOTE: Running task 1143 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_unpack)
NOTE: Running task 1144 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: Running task 1145 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_unpack)
NOTE: Running task 1146 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_unpack)
NOTE: Running task 1147 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_21.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libical-3.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flac-1.3.3-r0: task do_unpack: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe icu-69.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-69.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Started
NOTE: Running setscene task 652 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ell-0.40-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: recipe ofono-1.32-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe libical-3.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Started
NOTE: recipe mpg123-1.28.0-r0: task do_unpack: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_unpack: Started
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: Running task 1241 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: recipe alsa-lib-1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 1242 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: Running task 1243 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_patch)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1248 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: Running task 1249 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: Running task 1253 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: Running task 1256 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Succeeded
NOTE: Running task 1257 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_patch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: Running task 1258 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_21.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Succeeded
NOTE: Running task 1265 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: Running setscene task 670 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_packagedata_setscene)
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: Running setscene task 673 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_packagedata_setscene)
NOTE: Running task 1268 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 1274 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_patch: Started
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running task 1276 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 1282 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: Running task 1290 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: Running task 1291 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe ell-0.40-r0: task do_unpack: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Started
NOTE: recipe mpg123-1.28.0-r0: task do_unpack: Succeeded
NOTE: Running task 1292 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_patch)
NOTE: recipe flac-1.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 1293 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_patch)
NOTE: Running task 1294 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_patch)
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_unpack: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1295 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: Running task 1296 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_patch)
NOTE: Running task 1297 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: recipe libdrm-2.4.106-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Started
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe flac-1.3.3-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-69.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ofono-1.32-r0: task do_unpack: Succeeded
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: Running setscene task 700 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1298 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: recipe ell-0.40-r0: task do_patch: Started
NOTE: Running task 1299 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_patch: Started
NOTE: Running task 1300 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.28.0-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: Running task 1301 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.3.3-r0: task do_patch: Succeeded
NOTE: Running task 1302 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 703 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 1307 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1308 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_patch)
NOTE: Running task 1309 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: Running task 1310 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_patch)
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_patch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 1311 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 1312 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe ofono-1.32-r0: task do_patch: Started
NOTE: Running task 1313 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1314 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ell-0.40-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1319 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 723 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 729 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.28.0-r0: task do_patch: Succeeded
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1356 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1357 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1358 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1364 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1365 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_populate_lic)
NOTE: recipe libdrm-2.4.106-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Started
NOTE: Running setscene task 735 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 1371 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.40-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1372 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_deploy_source_date_epoch)
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1373 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 738 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe ofono-1.32-r0: task do_patch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: Running task 1378 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.28.0-r0: task do_populate_lic: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1379 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1380 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_patch: Succeeded
NOTE: recipe ofono-1.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1385 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 748 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 751 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_populate_lic unihash changed to ad7fb1b5c6b1122f8cbdf55afe179c9212d25ff90dde4a43e7ae51584d137d38
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 754 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 756 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mpg123-1.28.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe ofono-1.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1406 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 771 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 774 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Succeeded
NOTE: Running task 1423 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1436 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 783 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 784 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 785 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 786 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 788 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 789 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 790 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 791 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 793 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 794 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 796 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 798 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 800 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 802 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 804 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 805 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 806 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-5.10.42+gitAUTOINC+422f8a09a8_a673c12715-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 809 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 814 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 815 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 816 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 817 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 818 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 819 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 820 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 821 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 822 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 823 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 824 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 825 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 826 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 827 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.50.bb:do_packagedata_setscene)
NOTE: Running setscene task 828 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.50.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 829 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 830 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.42+gitAUTOINC+422f8a09a8_a673c12715-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.50-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.50-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1464 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 834 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 835 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.42+gitAUTOINC+422f8a09a8_a673c12715-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 839 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 840 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 841 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 842 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 843 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 844 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 845 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 846 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.50-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 848 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.50-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running setscene task 850 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.50.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1483 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1484 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running setscene task 852 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 854 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 856 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe libcap-2.50-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 858 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 859 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 860 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-src went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dbg went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-staticdev went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dev went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-doc went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-af went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-az went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-bg went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ca went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-crh went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: recipe libcap-2.50-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-cs went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-da went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-de went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 864 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 865 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 866 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 867 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 868 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-el went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-en-gb went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-eo went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-es went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fi went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1528 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fr went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fur went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-gl went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hr went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hu went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-id went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-it went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ja went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ka went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ko went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ky went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-lt went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nb went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nl went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pl went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt-br went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ro went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ru went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: Running setscene task 870 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 871 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 872 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 873 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 874 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 875 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 876 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 877 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 878 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-rw went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sk went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sl went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sq went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sr went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sv went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-tr went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-uk went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-vi went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-cn went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-tw went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 880 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1538 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 882 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 884 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 886 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 887 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 888 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 890 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 892 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 894 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 896 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 897 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 898 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 899 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 900 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1547 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1573 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-src went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dbg went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-staticdev went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dev went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-doc went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-locale went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 902 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 904 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 906 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 907 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 908 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 909 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 910 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 911 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 912 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 913 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 914 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 917 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 921 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 922 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 923 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 924 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 925 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 926 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 927 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 928 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 930 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 931 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 935 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 936 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 937 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 938 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 939 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 940 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 941 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 942 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 943 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1619 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 944 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 946 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 947 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 948 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 949 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 950 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 951 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 952 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 953 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 954 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 955 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 956 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 958 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 960 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 962 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 964 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 965 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 966 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 968 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 970 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 971 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 972 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 973 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 974 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1656 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 976 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 978 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 979 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 980 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 981 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e2c8afbc386274c1e62466ce7a999f96d9b86b3fe61df959502517848bfa7c4a
NOTE: Running task 1665 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 983 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 985 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 986 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 987 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 989 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 990 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 991 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 993 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 994 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 995 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 997 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 998 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 999 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1000 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1001 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1002 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1008 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1009 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1010 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1012 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1013 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1014 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1015 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1016 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1999 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2124 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2192 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2324 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2326 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2327 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2354 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2370 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2371 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2536 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2714 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe alsa-lib-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2715 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to f05d2eda90baf35c1b252df6c8af079fe1c2c710cebeb4b16a4397e569e274c3
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: Running task 2766 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2767 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: Running task 2768 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2769 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: Running task 2773 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: recipe alsa-lib-1.2.5-r0: task do_configure: Started
NOTE: Running task 2774 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: Running task 2800 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2838 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ell-0.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2884 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: Running task 2885 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 2886 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 2887 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe ell-0.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2888 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe ell-0.40-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2889 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_configure)
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 2890 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Succeeded
NOTE: Running task 2891 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Succeeded
NOTE: Running task 2892 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Succeeded
NOTE: Running task 2893 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2894 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Succeeded
NOTE: Running task 2895 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Succeeded
NOTE: Running task 2896 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 2897 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 2898 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 2899 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 2900 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 2901 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2902 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 2903 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2904 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2905 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 2906 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: Running task 2907 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: Running task 2908 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2909 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: Running task 2910 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 2911 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: Running task 2912 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2913 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2914 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe alsa-lib-1.2.5-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2915 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2916 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2917 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2918 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2919 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2920 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2921 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2922 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2923 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: Running task 2924 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2925 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2926 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_configure)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.3.3-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2927 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2928 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-src went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dbg went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-staticdev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-doc went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-locale went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2929 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 2930 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2931 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2932 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2933 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package_write_rpm)
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2934 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2935 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package_write_rpm: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2936 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2937 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 2938 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 2939 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ell-0.40-r0: task do_configure: Succeeded
NOTE: Running task 2940 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_compile)
NOTE: recipe ell-0.40-r0: task do_compile: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: Running task 2941 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Succeeded
NOTE: Running task 2942 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_compile)
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Started
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2943 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe ell-0.40-r0: task do_compile: Succeeded
NOTE: Running task 2944 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe ell-0.40-r0: task do_install: Started
NOTE: recipe ell-0.40-r0: task do_install: Succeeded
NOTE: Running task 2945 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_populate_sysroot)
NOTE: Running task 2946 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_package)
NOTE: recipe ell-0.40-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.40-r0: task do_package: Started
NOTE: recipe ell-0.40-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2947 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2948 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_configure)
NOTE: recipe ofono-1.32-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Succeeded
NOTE: Running task 2949 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_install)
NOTE: recipe dbus-glib-0.112-r0: task do_install: Started
NOTE: recipe dbus-glib-0.112-r0: task do_install: Succeeded
NOTE: Running task 2950 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package)
NOTE: Running task 2951 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_populate_sysroot)
NOTE: recipe ell-0.40-r0: task do_package: Succeeded
NOTE: Running task 2952 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_packagedata)
NOTE: recipe dbus-glib-0.112-r0: task do_package: Started
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.40-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2953 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-src went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-dbg went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-staticdev went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-dev went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-doc went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-locale went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
NOTE: recipe ell-0.40-r0: task do_packagedata: Succeeded
NOTE: Running task 2954 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2955 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.40-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2956 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2957 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2958 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 2959 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe alsa-lib-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2960 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2961 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ell-0.40-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_package: Succeeded
NOTE: Running task 2962 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_packagedata)
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2963 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 2964 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_populate_sysroot)
NOTE: Running task 2965 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_package)
NOTE: recipe alsa-lib-1.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_package: Started
NOTE: Running task 2966 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2967 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2968 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe alsa-lib-1.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 2969 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2970 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 2971 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2972 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.5-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2973 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2974 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package_write_rpm)
NOTE: recipe alsa-lib-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_configure: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Started
NOTE: Running task 2975 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_compile)
NOTE: recipe flac-1.3.3-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.32-r0: task do_configure: Succeeded
NOTE: Running task 2976 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_compile)
NOTE: recipe ofono-1.32-r0: task do_compile: Started
NOTE: recipe ofono-1.32-r0: task do_compile: Succeeded
NOTE: Running task 2977 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_install)
NOTE: recipe ofono-1.32-r0: task do_install: Started
NOTE: recipe ofono-1.32-r0: task do_install: Succeeded
NOTE: Running task 2978 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_populate_sysroot)
NOTE: Running task 2979 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_package)
NOTE: recipe ofono-1.32-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.32-r0: task do_package: Started
NOTE: recipe ofono-1.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2980 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe flac-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2981 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_install)
NOTE: recipe flac-1.3.3-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2982 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe flac-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 2983 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 2984 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2985 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 2986 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2987 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_configure)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 2988 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe ofono-1.32-r0: task do_package: Succeeded
NOTE: Running task 2989 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_packagedata)
NOTE: recipe flac-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 2990 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata)
NOTE: recipe ofono-1.32-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2991 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm)
NOTE: recipe ofono-1.32-r0: task do_packagedata: Succeeded
NOTE: Running task 2992 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe ofono-1.32-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 2993 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2994 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 2995 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 2996 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 2997 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Succeeded
NOTE: Running task 2998 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_compile)
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 2999 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3000 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm)
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Succeeded
NOTE: Running task 3001 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_install)
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Succeeded
NOTE: Running task 3002 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot)
NOTE: Running task 3003 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package)
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3004 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3005 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3006 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: Running task 3007 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Succeeded
NOTE: Running task 3008 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Succeeded
NOTE: Running task 3009 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 3010 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 3011 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 3012 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 3013 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3014 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 3015 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 3016 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3017 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_configure)
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3018 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package_write_rpm)
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Started
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 3019 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 3020 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 3021 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 3022 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3023 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Succeeded
NOTE: Running task 3024 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3025 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_configure)
NOTE: recipe alsa-utils-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3026 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 3027 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 3028 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Succeeded
NOTE: Running task 3029 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_install)
NOTE: recipe pulseaudio-14.2-r0: task do_install: Started
NOTE: recipe pulseaudio-14.2-r0: task do_install: Succeeded
NOTE: Running task 3030 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package)
NOTE: Running task 3031 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_populate_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_package: Started
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3032 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3033 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.28.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3034 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_compile)
NOTE: recipe alsa-utils-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3035 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_compile: Started
NOTE: recipe mpg123-1.28.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3036 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3037 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_configure)
NOTE: recipe mpg123-1.28.0-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_package: Succeeded
NOTE: Running task 3038 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_packagedata)
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3039 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_install)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3040 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_install)
NOTE: recipe alsa-utils-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3041 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_package)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3042 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_package)
NOTE: recipe alsa-utils-1.2.5-r0: task do_package: Started
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3043 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3044 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3045 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 3046 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_package_write_rpm)
NOTE: Running task 3047 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3048 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3049 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_install)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3050 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_package)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package: Started
NOTE: recipe mpg123-1.28.0-r0: task do_configure: Succeeded
NOTE: Running task 3051 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_compile)
NOTE: recipe mpg123-1.28.0-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3052 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3053 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_package_write_rpm)
NOTE: Running task 3054 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.28.0-r0: task do_compile: Succeeded
NOTE: Running task 3055 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_install)
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.28.0-r0: task do_install: Started
NOTE: recipe mpg123-1.28.0-r0: task do_install: Succeeded
NOTE: Running task 3056 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_package)
NOTE: Running task 3057 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.28.0-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.28.0-r0: task do_package: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_package: Succeeded
NOTE: Running task 3058 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_packagedata)
NOTE: recipe mpg123-1.28.0-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.28.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3059 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_package_write_rpm)
NOTE: Running task 3060 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_package_qa)
NOTE: recipe mpg123-1.28.0-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.28.0-r0: task do_package_qa: Started
NOTE: recipe mpg123-1.28.0-r0: task do_package_qa: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3061 of 3061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_build)
NOTE: Tasks Summary: Attempted 3061 tasks of which 2751 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 70 ERROR messages shown, returning a non-zero exit code.

--===============3265882017056905242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mpg123: PV changed from "1.27.2" to "1.28.0"
packages/core2-32-poky-linux/mpg123: PKGV changed from 1.27.2 [default] to 1.28.0 [default]
packages/core2-32-poky-linux/mpg123: SRC_URI changed from "https://www.mpg123.de/download/mpg123-1.27.2.tar.bz2" to "https://www.mpg123.de/download/mpg123-1.28.0.tar.bz2"
packages/core2-32-poky-linux/mpg123/mpg123-dbg: FILELIST: removed "/usr/lib/libsyn123.so.0.1.2 /usr/lib/libmpg123.so.0.46.1", added "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libmpg123.so.0.46.2"
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PV changed from "1.27.2" to "1.28.0"
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PKGSIZE changed from 2065528 to 2065948 (+0%)
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PKGV changed from 1.27.2 [default] to 1.28.0 [default]
packages/core2-32-poky-linux/mpg123/mpg123-dev: FILELIST: removed "/usr/lib/libsyn123.so.0.1.2 /usr/lib/libmpg123.so.0.46.1", added "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libmpg123.so.0.46.2"
packages/core2-32-poky-linux/mpg123/mpg123-dev: PV changed from "1.27.2" to "1.28.0"
packages/core2-32-poky-linux/mpg123/mpg123-dev: PKGSIZE changed from 177787 to 178434 (+0%)
packages/core2-32-poky-linux/mpg123/mpg123-dev: PKGV changed from 1.27.2 [default] to 1.28.0 [default]
packages/core2-32-poky-linux/mpg123/mpg123-doc: FILELIST: removed "/usr/lib/libsyn123.so.0.1.2 /usr/lib/libmpg123.so.0.46.1", added "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libmpg123.so.0.46.2"
packages/core2-32-poky-linux/mpg123/mpg123-doc: PV changed from "1.27.2" to "1.28.0"
packages/core2-32-poky-linux/mpg123/mpg123-doc: PKGV changed from 1.27.2 [default] to 1.28.0 [default]
packages/core2-32-poky-linux/mpg123/mpg123-locale: FILELIST: removed "/usr/lib/libsyn123.so.0.1.2 /usr/lib/libmpg123.so.0.46.1", added "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libmpg123.so.0.46.2"
packages/core2-32-poky-linux/mpg123/mpg123-locale: PV changed from "1.27.2" to "1.28.0"
packages/core2-32-poky-linux/mpg123/mpg123-locale: PKGV changed from 1.27.2 [default] to 1.28.0 [default]
packages/core2-32-poky-linux/mpg123/mpg123-src: FILELIST: removed "/usr/lib/libsyn123.so.0.1.2 /usr/lib/libmpg123.so.0.46.1", added "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libmpg123.so.0.46.2"
packages/core2-32-poky-linux/mpg123/mpg123-src: PV changed from "1.27.2" to "1.28.0"
packages/core2-32-poky-linux/mpg123/mpg123-src: PKGSIZE changed from 2050537 to 2003300 (-2%)
packages/core2-32-poky-linux/mpg123/mpg123-src: PKGV changed from 1.27.2 [default] to 1.28.0 [default]
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: FILELIST: removed "/usr/lib/libsyn123.so.0.1.2 /usr/lib/libmpg123.so.0.46.1", added "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libmpg123.so.0.46.2"
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: PV changed from "1.27.2" to "1.28.0"
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: PKGV changed from 1.27.2 [default] to 1.28.0 [default]
packages/core2-32-poky-linux/mpg123/mpg123: FILELIST: removed "/usr/lib/libsyn123.so.0.1.2 /usr/lib/libmpg123.so.0.46.1", added "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libmpg123.so.0.46.2"
packages/core2-32-poky-linux/mpg123/mpg123: PV changed from "1.27.2" to "1.28.0"
packages/core2-32-poky-linux/mpg123/mpg123: PKGSIZE changed from 1039739 to 1043835 (+0%)
packages/core2-32-poky-linux/mpg123/mpg123: PKGV changed from 1.27.2 [default] to 1.28.0 [default]
Changes to packages/core2-32-poky-linux/mpg123 (sysroot):
  /usr/lib/libmpg123.so.0 changed symlink target from libmpg123.so.0.46.1 to libmpg123.so.0.46.2
  /usr/lib/libmpg123.so changed symlink target from libmpg123.so.0.46.1 to libmpg123.so.0.46.2
  /usr/lib/libsyn123.so.0 changed symlink target from libsyn123.so.0.1.2 to libsyn123.so.0.1.3
  /usr/lib/libsyn123.so changed symlink target from libsyn123.so.0.1.2 to libsyn123.so.0.1.3
  /usr/lib/libmpg123.so.0.46.1 moved to /usr/lib/libmpg123.so.0.46.2
  /usr/lib/libsyn123.so.0.1.2 moved to /usr/lib/libsyn123.so.0.1.3

--===============3265882017056905242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 817 .bb files complete (0 cached, 817 parsed). 1454 targets, 49 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-6c007fa33619e3873c2e22d3eab12264915fafaf"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6c007fa33619e3873c2e22d3eab12264915fafaf"
workspace            = "master:29c42cf24da05abb499936556dad1902e110c5a7"

Initialising tasks...done.
Sstate summary: Wanted 134 Local 13 Network 0 Missed 121 Current 874 (9% match, 87% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
Removing 1 stale sstate objects for arch armv7vet2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 890 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 891 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 892 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 895 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 896 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 956 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-topology-conf-1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-ucm-conf-1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe alsa-topology-conf-1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1003 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1004 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_packagedata_setscene)
NOTE: recipe alsa-ucm-conf-1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Started
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-src went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dbg went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-staticdev went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-src went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dev went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dbg went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-doc went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-staticdev went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-locale went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dev went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-doc went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-af went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-az went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-bg went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: Running task 1096 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ca went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-crh went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-cs went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-da went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-de went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Succeeded
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-el went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-en-gb went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-eo went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-es went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fi went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fr went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fur went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-gl went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hr went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hu went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-id went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-it went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ja went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ka went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ko went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ky went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-lt went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nb went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nl went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pl went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt-br went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ro went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ru went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-rw went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sk went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sl went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sq went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sr went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sv went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-tr went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: Running setscene task 1006 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_deploy_source_date_epoch_setscene)
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-uk went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-vi went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-cn went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-tw went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: Running task 1263 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1008 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1363 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_fetch)
NOTE: Running task 1388 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1389 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_fetch)
NOTE: Running task 1435 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 1595 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 1604 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.5-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe flac-1.3.3-r0: task do_fetch: Started
NOTE: Running task 1649 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 1652 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: Running task 1653 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_fetch)
NOTE: Running task 1659 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_unpack)
NOTE: Running task 1660 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1661 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1662 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Started
NOTE: Setscene tasks completed
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Succeeded
NOTE: Running task 1703 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_unpack)
NOTE: Running task 1713 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: Running task 1758 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 1759 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 1760 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1761 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_fetch)
NOTE: Running task 1762 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: Running task 1808 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe ell-0.40-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_unpack: Started
NOTE: Running task 1855 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_fetch)
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: recipe ell-0.40-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Started
NOTE: Running task 1888 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: Running task 1925 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Started
NOTE: Running task 1926 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: Running task 1956 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 1957 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: Running task 1981 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: Running task 1982 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1989 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_fetch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: recipe ofono-1.32-r0: task do_fetch: Started
NOTE: Running task 2013 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 2019 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_write_config)
NOTE: Running task 2022 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_fetch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe ell-0.40-r0: task do_unpack: Started
NOTE: Running task 2049 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: Running task 2050 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: Running task 2062 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: recipe ofono-1.32-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: Running task 2072 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_fetch)
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: Running task 2073 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2084 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: Running task 2085 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 2091 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_patch)
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 2134 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Started
NOTE: Running task 2135 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2152 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_patch)
NOTE: Running task 2157 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_fetch)
NOTE: Running task 2171 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Succeeded
NOTE: Running task 2172 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_fetch)
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: Running task 2173 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: Running task 2174 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_fetch)
NOTE: Running task 2180 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_unpack)
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe mpg123-1.28.0-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2263 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_unpack)
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_fetch: Started
NOTE: Running task 2278 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_unpack)
NOTE: Running task 2279 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: Running task 2340 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: Running task 2341 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_unpack)
NOTE: Running task 2359 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Succeeded
NOTE: Running task 2410 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Started
NOTE: Running task 2411 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe ofono-1.32-r0: task do_unpack: Started
NOTE: Running task 2522 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe flac-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_fetch: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_fetch: Started
NOTE: Running task 2552 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_fetch: Succeeded
NOTE: Running task 2583 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: Running task 2584 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2585 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_unpack)
NOTE: recipe ell-0.40-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_fetch: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Started
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: Running task 2613 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2614 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_patch)
NOTE: Running task 2615 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_unpack)
NOTE: Running task 2616 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_unpack)
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: Running task 2661 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: recipe alsa-lib-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_unpack: Started
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 2662 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2663 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_patch)
NOTE: Running task 2664 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.3-r0: task do_patch: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_unpack: Started
NOTE: recipe ell-0.40-r0: task do_patch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_unpack: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2665 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2666 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.40-r0: task do_patch: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Started
NOTE: Running task 2667 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2668 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_deploy_source_date_epoch)
NOTE: Running task 2669 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: recipe flac-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: Running task 2670 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2671 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2672 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2673 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2674 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_patch)
NOTE: Running task 2675 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2676 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2677 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Succeeded
NOTE: Running task 2678 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_unpack: Succeeded
NOTE: recipe ofono-1.32-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: Running task 2679 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_patch)
NOTE: Running task 2680 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_unpack: Succeeded
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: Running task 2681 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_patch)
NOTE: recipe alsa-utils-1.2.5-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.40-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2682 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2683 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: Running task 2684 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Succeeded
NOTE: Running task 2685 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 2686 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2687 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.28.0-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_patch: Started
NOTE: Running task 2688 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-1.32-r0: task do_patch: Started
NOTE: Running task 2689 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2690 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2691 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_patch: Started
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2692 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2693 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe ell-0.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2694 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_patch)
NOTE: recipe alsa-lib-1.2.5-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2695 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.28.0-r0: task do_patch: Succeeded
NOTE: Running task 2696 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: recipe ofono-1.32-r0: task do_patch: Succeeded
NOTE: Running task 2697 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2698 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_populate_lic)
NOTE: Running task 2699 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_deploy_source_date_epoch)
NOTE: recipe libnss-mdns-0.15-r0: task do_patch: Succeeded
NOTE: Running task 2700 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_patch: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2701 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to c0b068a2173f90f350c3396218d9a98f0cd14e21d50a8e5dcd0c6cf8ebb5807d
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2746 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_populate_lic: Started
NOTE: Running task 2771 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-1.32-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2793 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Succeeded
NOTE: Running task 2796 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2801 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: Running task 2802 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2812 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_populate_lic unihash changed to ad7fb1b5c6b1122f8cbdf55afe179c9212d25ff90dde4a43e7ae51584d137d38
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Succeeded
NOTE: recipe ell-0.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: Running task 2813 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_deploy_source_date_epoch)
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2814 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libnss-mdns-0.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: Running task 2815 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe alsa-utils-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 2816 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2817 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7c58851376e4119f44c031f5316097f144502f21e36284cc94f8cbd39c5c7b71
NOTE: Setscene tasks completed
NOTE: recipe ell-0.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2848 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 2880 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: Running task 2881 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2885 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe ell-0.40-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2886 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_configure)
NOTE: recipe libnss-mdns-0.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2887 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_configure)
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 2888 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Succeeded
NOTE: Running task 2889 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Succeeded
NOTE: Running task 2890 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Succeeded
NOTE: Running task 2891 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2892 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Succeeded
NOTE: Running task 2893 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Succeeded
NOTE: Running task 2894 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 2895 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 2896 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 2897 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 2898 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 2899 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 2900 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 2901 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: Running task 2902 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 2903 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: Running task 2904 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2905 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.5-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2906 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2907 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2908 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2909 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2910 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2911 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: Running task 2912 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: Running task 2913 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-src went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dbg went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-staticdev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-doc went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-locale went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2914 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2915 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2916 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2917 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2918 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2919 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2920 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2921 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2922 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe ell-0.40-r0: task do_configure: Succeeded
NOTE: Running task 2923 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ell-0.40-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2924 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2925 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_configure: Succeeded
NOTE: Running task 2926 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_compile)
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2927 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe libnss-mdns-0.15-r0: task do_compile: Started
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Succeeded
NOTE: Running task 2928 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_compile)
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2929 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2930 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libogg-1.3.5-r0: task do_package_write_rpm: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe ell-0.40-r0: task do_compile: Succeeded
NOTE: Running task 2931 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_install)
NOTE: recipe libnss-mdns-0.15-r0: task do_compile: Succeeded
NOTE: Running task 2932 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_install)
NOTE: recipe libnss-mdns-0.15-r0: task do_install: Started
NOTE: recipe ell-0.40-r0: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2933 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 2934 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe ell-0.40-r0: task do_install: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_install: Succeeded
NOTE: Running task 2935 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_populate_sysroot)
NOTE: Running task 2936 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_package)
NOTE: Running task 2937 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_package)
NOTE: recipe ell-0.40-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.40-r0: task do_package: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ell-0.40-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2938 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2939 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_configure)
NOTE: recipe ofono-1.32-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: Running task 2940 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Succeeded
NOTE: Running task 2941 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.112-r0: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2942 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_install: Succeeded
NOTE: Running task 2943 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package)
NOTE: recipe ell-0.40-r0: task do_package: Succeeded
NOTE: Running task 2944 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_packagedata)
NOTE: recipe libnss-mdns-0.15-r0: task do_package: Succeeded
NOTE: Running task 2945 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_populate_sysroot)
NOTE: Running task 2946 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_packagedata)
NOTE: recipe dbus-glib-0.112-r0: task do_package: Started
NOTE: recipe ell-0.40-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_packagedata: Started
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-src went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-dbg went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-staticdev went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-dev went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-doc went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-locale went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-src went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-dbg went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-staticdev went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-dev went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-doc went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-locale went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
NOTE: recipe ell-0.40-r0: task do_packagedata: Succeeded
NOTE: Running task 2947 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_package_write_rpm)
NOTE: recipe libnss-mdns-0.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2948 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2949 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm)
NOTE: Running task 2950 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.40-r0: task do_package_write_rpm: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2951 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2952 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe ell-0.40-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_package: Succeeded
NOTE: Running task 2953 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2954 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Succeeded
NOTE: Running task 2955 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2956 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 2957 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2958 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_install)
NOTE: recipe alsa-lib-1.2.5-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2959 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 2960 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_populate_sysroot)
NOTE: Running task 2961 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_package)
NOTE: recipe alsa-lib-1.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 2962 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2963 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2964 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm unihash changed to 2f7604fc748489a17d0b51ee39b24762561ba31791da1425eb7d3a56013a993b
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2965 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2966 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 2967 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2968 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_package_write_rpm)
NOTE: recipe alsa-lib-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe ofono-1.32-r0: task do_configure: Succeeded
NOTE: Running task 2969 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2970 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe ofono-1.32-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2971 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.32-r0: task do_compile: Succeeded
NOTE: Running task 2972 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_install)
NOTE: recipe flac-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2973 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_compile)
NOTE: recipe ofono-1.32-r0: task do_install: Started
NOTE: recipe flac-1.3.3-r0: task do_compile: Started
NOTE: recipe ofono-1.32-r0: task do_install: Succeeded
NOTE: Running task 2974 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_populate_sysroot)
NOTE: Running task 2975 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_package)
NOTE: recipe ofono-1.32-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.32-r0: task do_package: Started
NOTE: recipe ofono-1.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2976 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2977 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 2978 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe ofono-1.32-r0: task do_package: Succeeded
NOTE: Running task 2979 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_packagedata)
NOTE: recipe ofono-1.32-r0: task do_packagedata: Started
NOTE: recipe ofono-1.32-r0: task do_packagedata: Succeeded
NOTE: Running task 2980 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_package_write_rpm)
NOTE: recipe ofono-1.32-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 2981 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2982 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2983 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 2984 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 2985 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package)
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Started
NOTE: recipe ofono-1.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2986 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2987 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_configure)
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 2988 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata)
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2989 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Succeeded
NOTE: Running task 2990 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_compile)
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Succeeded
NOTE: Running task 2991 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_install)
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Succeeded
NOTE: Running task 2992 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot)
NOTE: Running task 2993 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2994 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2995 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2996 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: Running task 2997 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Succeeded
NOTE: Running task 2998 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Succeeded
NOTE: Running task 2999 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 3000 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 3001 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 3002 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 3003 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3004 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 3005 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 3006 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3007 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package_write_rpm)
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3008 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_configure)
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 3009 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 3010 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 3011 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 3012 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3013 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3014 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_configure)
NOTE: recipe alsa-utils-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3015 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 3016 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 3017 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Succeeded
NOTE: Running task 3018 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_compile)
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Succeeded
NOTE: Running task 3019 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_install)
NOTE: recipe pulseaudio-14.2-r0: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_install: Succeeded
NOTE: Running task 3020 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package)
NOTE: Running task 3021 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_populate_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3022 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_compile)
NOTE: recipe alsa-utils-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3023 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3024 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3025 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.28.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.28.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3026 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_configure)
NOTE: Running task 3027 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_configure)
NOTE: recipe mpg123-1.28.0-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_configure: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package: Succeeded
NOTE: Running task 3028 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_packagedata)
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_compile: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3029 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_install)
NOTE: Running task 3030 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_install)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3031 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_package)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3032 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_package)
NOTE: recipe alsa-utils-1.2.5-r0: task do_package: Started
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3033 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3034 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3035 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 3036 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_package_write_rpm)
NOTE: Running task 3037 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3038 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3039 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_install)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3040 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_package)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package: Started
NOTE: recipe mpg123-1.28.0-r0: task do_configure: Succeeded
NOTE: Running task 3041 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3042 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_packagedata)
NOTE: recipe mpg123-1.28.0-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3043 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_package_write_rpm)
NOTE: Running task 3044 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_compile: Succeeded
NOTE: Running task 3045 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_install)
NOTE: recipe mpg123-1.28.0-r0: task do_install: Started
NOTE: recipe mpg123-1.28.0-r0: task do_install: Succeeded
NOTE: Running task 3046 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_package)
NOTE: Running task 3047 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.28.0-r0: task do_package: Started
NOTE: recipe mpg123-1.28.0-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.28.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_package: Succeeded
NOTE: Running task 3048 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_packagedata)
NOTE: recipe mpg123-1.28.0-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.28.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3049 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_package_write_rpm)
NOTE: Running task 3050 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_package_qa)
NOTE: recipe mpg123-1.28.0-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.28.0-r0: task do_package_qa: Started
NOTE: recipe mpg123-1.28.0-r0: task do_package_qa: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3051 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_build)
NOTE: Tasks Summary: Attempted 3051 tasks of which 2759 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 77 ERROR messages shown, returning a non-zero exit code.

--===============3265882017056905242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 817 .bb files complete (0 cached, 817 parsed). 1454 targets, 58 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-6c007fa33619e3873c2e22d3eab12264915fafaf"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6c007fa33619e3873c2e22d3eab12264915fafaf"
workspace            = "master:29c42cf24da05abb499936556dad1902e110c5a7"

Initialising tasks...done.
Sstate summary: Wanted 134 Local 13 Network 0 Missed 121 Current 874 (9% match, 87% complete)
Removing 1 stale sstate objects for arch mips32r2...done.
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 890 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 891 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 892 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 895 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 896 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 956 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-topology-conf-1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-ucm-conf-1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-topology-conf-1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1003 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1004 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: recipe alsa-ucm-conf-1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-src went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dbg went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-staticdev went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dev went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-doc went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-src went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-locale went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dbg went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-staticdev went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dev went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-doc went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: Running task 1096 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-af went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-az went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-bg went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ca went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-crh went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Succeeded
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-cs went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-da went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-de went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-el went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-en-gb went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-eo went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-es went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fi went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fr went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fur went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-gl went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hr went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hu went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-id went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-it went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ja went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ka went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ko went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ky went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-lt went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nb went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nl went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pl went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt-br went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ro went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ru went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-rw went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sk went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sl went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sq went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sr went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sv went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: Running setscene task 1006 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_deploy_source_date_epoch_setscene)
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-tr went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-uk went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-vi went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-cn went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-tw went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: Running task 1263 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1363 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_fetch)
NOTE: Running setscene task 1008 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1388 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1389 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_fetch)
NOTE: Running task 1435 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_fetch)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 1549 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 1558 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe flac-1.3.3-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 1633 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_unpack)
NOTE: Running task 1634 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Started
NOTE: Running task 1647 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1648 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_unpack)
NOTE: Running task 1653 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1656 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_fetch)
NOTE: Running task 1657 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: Running task 1694 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Succeeded
NOTE: Running task 1742 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_unpack)
NOTE: Running task 1758 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: Running task 1759 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_fetch)
NOTE: Running task 1760 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1761 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 1762 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 1808 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1855 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: recipe ell-0.40-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: Running task 1982 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_fetch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Started
NOTE: Running task 2011 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_write_config)
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: Running task 2014 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_fetch)
NOTE: recipe ell-0.40-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2040 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_unpack)
NOTE: Running task 2041 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: Running task 2042 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: Running task 2043 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: Running task 2044 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 2045 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: Running task 2046 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: Running task 2047 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: recipe ofono-1.32-r0: task do_fetch: Started
NOTE: Running task 2059 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: Running task 2060 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.32-r0: task do_fetch: Succeeded
NOTE: Running task 2061 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: Running task 2072 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_fetch)
NOTE: Running task 2084 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_unpack)
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Started
NOTE: Running task 2099 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: Running task 2100 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: Running task 2101 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Started
NOTE: recipe mpg123-1.28.0-r0: task do_fetch: Started
NOTE: Running task 2111 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 2112 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_unpack)
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.40-r0: task do_unpack: Started
NOTE: Running task 2133 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_unpack)
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: Running task 2142 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_unpack)
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Started
NOTE: Running task 2171 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_fetch)
NOTE: Running task 2172 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: Running task 2173 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: Running task 2174 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_fetch)
NOTE: Running task 2175 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_fetch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: Running task 2216 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2229 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_patch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Succeeded
NOTE: Running task 2265 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_patch)
NOTE: recipe flac-1.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2282 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: Running task 2291 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Succeeded
NOTE: recipe ofono-1.32-r0: task do_unpack: Started
NOTE: Running task 2302 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2315 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: Running task 2316 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe alsa-utils-1.2.5-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: Running task 2343 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Started
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 2376 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_unpack: Started
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: Running task 2408 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 2427 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: recipe libnss-mdns-0.15-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_patch: Started
NOTE: Running task 2428 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: Running task 2429 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.40-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: Running task 2430 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2432 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_patch)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_fetch: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_fetch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Succeeded
NOTE: Running task 2451 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_unpack)
NOTE: Running task 2463 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_patch)
NOTE: recipe libnss-mdns-0.15-r0: task do_fetch: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_patch: Started
NOTE: Running task 2473 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_unpack)
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 2485 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_unpack)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: recipe flac-1.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2579 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_unpack: Started
NOTE: Running task 2609 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe mpg123-1.28.0-r0: task do_unpack: Succeeded
NOTE: Running task 2646 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: Running task 2661 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_unpack: Started
NOTE: recipe ell-0.40-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_unpack: Started
NOTE: Running task 2668 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2669 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_unpack: Started
NOTE: Running task 2670 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2671 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: recipe ofono-1.32-r0: task do_unpack: Succeeded
NOTE: Running task 2672 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_patch)
NOTE: recipe alsa-lib-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: Running task 2673 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2674 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_unpack: Succeeded
NOTE: Running task 2675 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.28.0-r0: task do_patch: Started
NOTE: Running task 2676 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2677 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: recipe ell-0.40-r0: task do_patch: Succeeded
NOTE: Running task 2678 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: Running task 2679 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_deploy_source_date_epoch)
NOTE: Running task 2680 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_patch)
NOTE: recipe alsa-utils-1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2681 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2682 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe ofono-1.32-r0: task do_patch: Started
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Succeeded
NOTE: Running task 2683 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2684 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_configure)
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 2685 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: Running task 2686 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: Running task 2687 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.40-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2688 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_patch: Started
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2689 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_patch: Started
NOTE: recipe mpg123-1.28.0-r0: task do_patch: Succeeded
NOTE: Running task 2690 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_patch: Started
NOTE: Running task 2691 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_populate_lic)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2692 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2693 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-1.32-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: Running task 2694 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: Running task 2695 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_deploy_source_date_epoch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Started
NOTE: Running task 2696 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: recipe mpg123-1.28.0-r0: task do_populate_lic: Started
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2697 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_patch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_patch: Succeeded
NOTE: Running task 2698 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2699 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-1.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2700 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe alsa-utils-1.2.5-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2701 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2702 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to bfa18f0daad17bd2532550b681d9313214cbf8caac436539e186c04b7f392e9c
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: Running task 2747 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: recipe mpg123-1.28.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_populate_lic unihash changed to ad7fb1b5c6b1122f8cbdf55afe179c9212d25ff90dde4a43e7ae51584d137d38
NOTE: recipe alsa-plugins-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2772 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_prepare_recipe_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Started
NOTE: Running task 2796 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2797 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-1.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: Running task 2811 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: Running task 2812 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Succeeded
NOTE: Running task 2813 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_deploy_source_date_epoch)
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Succeeded
NOTE: Running task 2814 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2815 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 2816 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2817 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2818 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe ell-0.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2819 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5c3fd806bb42bb62415c3bcbc3019674fe9d1413a7bb107006d6b7a49c138ad4
NOTE: Setscene tasks completed
NOTE: Running task 2883 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe ell-0.40-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2885 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2886 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_configure)
NOTE: recipe libnss-mdns-0.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2887 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_configure)
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 2888 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Succeeded
NOTE: Running task 2889 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Succeeded
NOTE: Running task 2890 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Succeeded
NOTE: Running task 2891 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2892 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Succeeded
NOTE: Running task 2893 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Succeeded
NOTE: Running task 2894 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 2895 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 2896 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 2897 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 2898 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 2899 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 2900 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 2901 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: Running task 2902 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe alsa-lib-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 2903 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: Running task 2904 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2905 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2906 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2907 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2908 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2909 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2910 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: Running task 2911 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2912 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: Running task 2913 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-src went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dbg went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-staticdev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-doc went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-locale went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2914 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2915 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2916 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2917 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2918 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe ell-0.40-r0: task do_configure: Succeeded
NOTE: Running task 2919 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2920 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2921 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.40-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2922 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2923 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.3.3-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Succeeded
NOTE: Running task 2924 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_compile)
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Started
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2925 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2926 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_configure: Succeeded
NOTE: Running task 2927 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: Running task 2928 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_compile: Started
NOTE: recipe ell-0.40-r0: task do_compile: Succeeded
NOTE: Running task 2929 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_install)
NOTE: recipe ell-0.40-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2930 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package_write_rpm)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2931 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libogg-1.3.5-r0: task do_package_write_rpm: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_compile: Succeeded
NOTE: Running task 2932 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_install)
NOTE: recipe ell-0.40-r0: task do_install: Succeeded
NOTE: Running task 2933 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_populate_sysroot)
NOTE: Running task 2934 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_package)
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 2935 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 2936 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe libnss-mdns-0.15-r0: task do_install: Started
NOTE: recipe ell-0.40-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.40-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_install: Succeeded
NOTE: Running task 2937 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_package)
NOTE: recipe ell-0.40-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2938 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_package: Started
NOTE: recipe ofono-1.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2939 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_configure)
NOTE: recipe ofono-1.32-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Succeeded
NOTE: Running task 2940 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: Running task 2941 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: recipe dbus-glib-0.112-r0: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2942 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe ell-0.40-r0: task do_package: Succeeded
NOTE: Running task 2943 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_packagedata)
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe ell-0.40-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.112-r0: task do_install: Succeeded
NOTE: Running task 2944 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package)
NOTE: Running task 2945 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_populate_sysroot)
NOTE: recipe dbus-glib-0.112-r0: task do_package: Started
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Started
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-src went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-dbg went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-staticdev went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-dev went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-doc went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-locale went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
NOTE: recipe ell-0.40-r0: task do_packagedata: Succeeded
NOTE: Running task 2946 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_package_write_rpm)
NOTE: recipe ell-0.40-r0: task do_package_write_rpm: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_package: Succeeded
NOTE: Running task 2947 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_packagedata)
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2948 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_packagedata: Started
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-src went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
NOTE: recipe ell-0.40-r0: task do_package_write_rpm: Succeeded
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-dbg went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-staticdev went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-dev went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-doc went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-locale went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
NOTE: recipe dbus-glib-0.112-r0: task do_package: Succeeded
NOTE: Running task 2949 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_packagedata)
NOTE: recipe libnss-mdns-0.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2950 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_package_write_rpm)
NOTE: Running task 2951 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_package_write_rpm: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2952 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Succeeded
NOTE: Running task 2953 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2954 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libnss-mdns-0.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2955 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2956 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2957 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: recipe alsa-lib-1.2.5-r0: task do_install: Started
NOTE: Running task 2958 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 2959 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_populate_sysroot)
NOTE: Running task 2960 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_package)
NOTE: recipe alsa-lib-1.2.5-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2961 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe alsa-lib-1.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 2962 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2963 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm unihash changed to cf9c22d3859bf82b775f997c16da93632e7426962bf507195938a785ac0dead5
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2964 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 2965 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.5-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2966 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2967 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe ofono-1.32-r0: task do_configure: Succeeded
NOTE: Running task 2968 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_compile)
NOTE: recipe alsa-lib-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2969 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_package_write_rpm)
NOTE: recipe ofono-1.32-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2970 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2971 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.32-r0: task do_compile: Succeeded
NOTE: Running task 2972 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_install)
NOTE: recipe ofono-1.32-r0: task do_install: Started
NOTE: recipe ofono-1.32-r0: task do_install: Succeeded
NOTE: Running task 2973 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_populate_sysroot)
NOTE: Running task 2974 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_package)
NOTE: recipe ofono-1.32-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2975 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_compile)
NOTE: recipe ofono-1.32-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_compile: Started
NOTE: recipe ofono-1.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2976 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2977 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 2978 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe ofono-1.32-r0: task do_package: Succeeded
NOTE: Running task 2979 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe ofono-1.32-r0: task do_packagedata: Started
NOTE: recipe ofono-1.32-r0: task do_packagedata: Succeeded
NOTE: Running task 2980 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_package_write_rpm)
NOTE: recipe ofono-1.32-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 2981 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2982 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2983 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 2984 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 2985 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package)
NOTE: recipe ofono-1.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2986 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2987 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_configure)
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 2988 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata)
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2989 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Succeeded
NOTE: Running task 2990 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_compile)
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Succeeded
NOTE: Running task 2991 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_install)
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Succeeded
NOTE: Running task 2992 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot)
NOTE: Running task 2993 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package)
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2994 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2995 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2996 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2997 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Succeeded
NOTE: Running task 2998 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Succeeded
NOTE: Running task 2999 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 3000 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 3001 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 3002 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 3003 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3004 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 3005 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3006 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_configure)
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3007 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package_write_rpm)
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 3008 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 3009 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 3010 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 3011 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 3012 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3013 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Succeeded
NOTE: Running task 3014 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3015 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_configure)
NOTE: recipe alsa-utils-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3016 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 3017 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 3018 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Succeeded
NOTE: Running task 3019 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_install)
NOTE: recipe pulseaudio-14.2-r0: task do_install: Started
NOTE: recipe pulseaudio-14.2-r0: task do_install: Succeeded
NOTE: Running task 3020 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package)
NOTE: Running task 3021 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_populate_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_package: Started
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3022 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_compile)
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3023 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3024 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3025 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_compile: Started
NOTE: recipe mpg123-1.28.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3026 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_configure)
NOTE: Running task 3027 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_configure: Started
NOTE: recipe mpg123-1.28.0-r0: task do_configure: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package: Succeeded
NOTE: Running task 3028 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_packagedata)
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3029 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_install)
NOTE: recipe alsa-utils-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3030 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_install)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_install: Started
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3031 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_package)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3032 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_package)
NOTE: recipe alsa-utils-1.2.5-r0: task do_package: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3033 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3034 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3035 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3036 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 3037 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_package_write_rpm)
NOTE: Running task 3038 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3039 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_install)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3040 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_package)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package: Started
NOTE: recipe mpg123-1.28.0-r0: task do_configure: Succeeded
NOTE: Running task 3041 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3042 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_packagedata)
NOTE: recipe mpg123-1.28.0-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3043 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_package_write_rpm)
NOTE: Running task 3044 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_compile: Succeeded
NOTE: Running task 3045 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_install)
NOTE: recipe mpg123-1.28.0-r0: task do_install: Started
NOTE: recipe mpg123-1.28.0-r0: task do_install: Succeeded
NOTE: Running task 3046 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_package)
NOTE: Running task 3047 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.28.0-r0: task do_package: Started
NOTE: recipe mpg123-1.28.0-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.28.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_package: Succeeded
NOTE: Running task 3048 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_packagedata)
NOTE: recipe mpg123-1.28.0-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.28.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3049 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_package_write_rpm)
NOTE: Running task 3050 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_package_qa)
NOTE: recipe mpg123-1.28.0-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.28.0-r0: task do_package_qa: Started
NOTE: recipe mpg123-1.28.0-r0: task do_package_qa: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3051 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_build)
NOTE: Tasks Summary: Attempted 3051 tasks of which 2759 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 77 ERROR messages shown, returning a non-zero exit code.

--===============3265882017056905242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/mpg123/mpg123-dev: FILELIST: removed "/usr/lib/libmpg123.so.0.46.1 /usr/lib/libsyn123.so.0.1.2", added "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libmpg123.so.0.46.2"
packages/core2-32-poky-linux/mpg123/mpg123-doc: FILELIST: removed "/usr/lib/libmpg123.so.0.46.1 /usr/lib/libsyn123.so.0.1.2", added "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libmpg123.so.0.46.2"
packages/core2-32-poky-linux/mpg123/mpg123-locale: FILELIST: removed "/usr/lib/libmpg123.so.0.46.1 /usr/lib/libsyn123.so.0.1.2", added "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libmpg123.so.0.46.2"
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: FILELIST: removed "/usr/lib/libmpg123.so.0.46.1 /usr/lib/libsyn123.so.0.1.2", added "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libmpg123.so.0.46.2"
packages/core2-32-poky-linux/mpg123/mpg123: FILELIST: removed "/usr/lib/libmpg123.so.0.46.1 /usr/lib/libsyn123.so.0.1.2", added "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libmpg123.so.0.46.2"
Changes to packages/core2-32-poky-linux/mpg123 (sysroot):
  /usr/lib/libmpg123.so.0 changed symlink target from libmpg123.so.0.46.1 to libmpg123.so.0.46.2
  /usr/lib/libmpg123.so changed symlink target from libmpg123.so.0.46.1 to libmpg123.so.0.46.2
  /usr/lib/libsyn123.so.0 changed symlink target from libsyn123.so.0.1.2 to libsyn123.so.0.1.3
  /usr/lib/libsyn123.so changed symlink target from libsyn123.so.0.1.2 to libsyn123.so.0.1.3
  /usr/lib/libmpg123.so.0.46.1 moved to /usr/lib/libmpg123.so.0.46.2
  /usr/lib/libsyn123.so.0.1.2 moved to /usr/lib/libsyn123.so.0.1.3

--===============3265882017056905242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 817 .bb files complete (0 cached, 817 parsed). 1454 targets, 66 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-6c007fa33619e3873c2e22d3eab12264915fafaf"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6c007fa33619e3873c2e22d3eab12264915fafaf"
workspace            = "master:29c42cf24da05abb499936556dad1902e110c5a7"

Initialising tasks...done.
Sstate summary: Wanted 134 Local 13 Network 0 Missed 121 Current 874 (9% match, 87% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
Removing 1 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 890 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 891 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 892 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 895 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 896 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 956 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-topology-conf-1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-ucm-conf-1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1003 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: recipe alsa-topology-conf-1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1004 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_packagedata_setscene)
NOTE: recipe alsa-ucm-conf-1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Started
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-src went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dbg went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-staticdev went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dev went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-doc went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-af went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-az went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-bg went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-src went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ca went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dbg went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-crh went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-staticdev went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-cs went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dev went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-da went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-doc went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-de went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-locale went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-el went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-en-gb went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-eo went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-es went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fi went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fr went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fur went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-gl went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hr went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hu went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-id went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-it went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ja went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ka went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ko went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ky went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-lt went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nb went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Succeeded
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nl went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pl went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: Running setscene task 1006 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_deploy_source_date_epoch_setscene)
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt-br went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ro went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ru went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-rw went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sk went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sl went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: Running task 1097 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sq went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sr went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sv went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-tr went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-uk went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-vi went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-cn went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-tw went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1008 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1304 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1410 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_fetch)
NOTE: Running task 1437 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1438 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1488 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_fetch)
NOTE: Setscene tasks completed
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 1557 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 1558 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.5-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe flac-1.3.3-r0: task do_fetch: Started
NOTE: Running task 1667 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1670 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: Running task 1671 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.5-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 1697 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_unpack)
NOTE: Running task 1698 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1699 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1711 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: Running task 1712 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_unpack)
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Started
NOTE: Running task 1757 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1758 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 1759 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: Running task 1760 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 1761 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_fetch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Succeeded
NOTE: Running task 1807 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1829 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_unpack)
NOTE: Running task 1855 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_fetch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: recipe ell-0.40-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.40-r0: task do_fetch: Succeeded
NOTE: Running task 1973 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 1974 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: Running task 1975 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_unpack)
NOTE: Running task 1985 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_fetch)
NOTE: Running task 1995 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 1996 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_unpack: Started
NOTE: Running task 2016 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_write_config)
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: Running task 2019 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: Running task 2020 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2021 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_fetch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: recipe ofono-1.32-r0: task do_fetch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Started
NOTE: Running task 2032 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe ofono-1.32-r0: task do_fetch: Succeeded
NOTE: Running task 2069 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_fetch)
NOTE: Running task 2087 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_unpack)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: Running task 2104 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: Running task 2114 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: Running task 2115 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: Running task 2116 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: Running task 2117 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2118 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.40-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Started
NOTE: Running task 2154 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_fetch)
NOTE: Running task 2168 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: Running task 2169 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_fetch)
NOTE: Running task 2170 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_fetch)
NOTE: Running task 2171 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_fetch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_fetch: Started
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Started
NOTE: recipe mpg123-1.28.0-r0: task do_fetch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: recipe ofono-1.32-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_fetch: Started
NOTE: Running task 2515 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: Running task 2528 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: Running task 2529 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.28.0-r0: task do_fetch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_fetch: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 2530 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 2541 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_unpack)
NOTE: Running task 2542 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_unpack)
NOTE: Running task 2543 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_unpack)
NOTE: Running task 2544 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_unpack)
NOTE: Running task 2545 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_unpack)
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Succeeded
NOTE: Running task 2622 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_unpack)
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.40-r0: task do_unpack: Succeeded
NOTE: Running task 2623 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: Running task 2624 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2652 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2653 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: Running task 2654 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe libnss-mdns-0.15-r0: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Succeeded
NOTE: Running task 2655 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_patch)
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 2656 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: Running task 2657 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: recipe mpg123-1.28.0-r0: task do_unpack: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_unpack: Started
NOTE: Running task 2658 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2659 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe flac-1.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2660 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 2661 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_patch)
NOTE: Running task 2662 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 2663 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Succeeded
NOTE: Running task 2664 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_patch)
NOTE: recipe ell-0.40-r0: task do_patch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_unpack: Succeeded
NOTE: Running task 2665 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_patch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 2666 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2667 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: Running task 2668 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_patch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_patch: Started
NOTE: recipe flac-1.3.3-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe ofono-1.32-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 2669 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_patch)
NOTE: Running task 2670 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_patch)
NOTE: recipe libnss-mdns-0.15-r0: task do_patch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Started
NOTE: recipe ell-0.40-r0: task do_patch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2671 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2672 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2673 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_patch)
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: Running task 2674 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2675 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe ofono-1.32-r0: task do_patch: Started
NOTE: recipe mpg123-1.28.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2676 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2677 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2678 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: recipe ell-0.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2679 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2680 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2681 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_patch: Started
NOTE: Running task 2682 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: Running task 2683 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2684 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2685 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: Running task 2686 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2687 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_deploy_source_date_epoch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2688 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2689 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.32-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: Running task 2690 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.28.0-r0: task do_patch: Succeeded
NOTE: Running task 2691 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2692 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_populate_lic)
NOTE: recipe alsa-utils-1.2.5-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Succeeded
NOTE: Running task 2693 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ell-0.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Succeeded
NOTE: Running task 2694 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_deploy_source_date_epoch)
NOTE: Running task 2695 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_patch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-1.32-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2696 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_configure)
NOTE: recipe mpg123-1.28.0-r0: task do_populate_lic: Started
NOTE: recipe mpg123-1.28.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2697 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2698 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2699 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2700 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: Running task 2701 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 4d92d721c7ae54099bea2c5c32a24ca679d486d7bc4832bbf25aa1670cc2c121
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Started
NOTE: Running task 2746 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 2771 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.28.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-1.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_patch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_populate_lic unihash changed to ad7fb1b5c6b1122f8cbdf55afe179c9212d25ff90dde4a43e7ae51584d137d38
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2774 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: Running task 2778 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2795 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2802 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe ell-0.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2812 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: Running task 2813 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Succeeded
NOTE: Running task 2814 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Succeeded
NOTE: Running task 2815 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 2816 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2817 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ff66db4732d066ae345a6d3539c5ee475874906f226af3b877bc2369891e2647
NOTE: Setscene tasks completed
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2877 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2883 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2884 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: recipe ell-0.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2885 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: recipe ell-0.40-r0: task do_configure: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2886 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_configure)
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2887 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_configure)
NOTE: recipe libnss-mdns-0.15-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 2888 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Succeeded
NOTE: Running task 2889 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Succeeded
NOTE: Running task 2890 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Succeeded
NOTE: Running task 2891 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2892 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Succeeded
NOTE: Running task 2893 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Succeeded
NOTE: Running task 2894 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 2895 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 2896 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 2897 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 2898 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 2899 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 2900 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 2901 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: Running task 2902 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2903 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 2904 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: Running task 2905 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_compile: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2906 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2907 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2908 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2909 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2910 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2911 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2912 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: Running task 2913 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2914 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2915 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-src went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dbg went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-staticdev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-doc went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-locale went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2916 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2917 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2918 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2919 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2920 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2921 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 2922 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_configure)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.3.3-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ell-0.40-r0: task do_configure: Succeeded
NOTE: Running task 2923 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_compile)
NOTE: recipe ell-0.40-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2924 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_configure: Succeeded
NOTE: Running task 2925 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2926 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package_write_rpm)
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2927 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2928 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe libnss-mdns-0.15-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_package_write_rpm: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_compile: Succeeded
NOTE: Running task 2929 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2930 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Succeeded
NOTE: Running task 2931 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_compile)
NOTE: recipe libnss-mdns-0.15-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ell-0.40-r0: task do_compile: Succeeded
NOTE: Running task 2932 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 2933 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 2934 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe libnss-mdns-0.15-r0: task do_install: Succeeded
NOTE: Running task 2935 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_package)
NOTE: recipe ell-0.40-r0: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ell-0.40-r0: task do_install: Succeeded
NOTE: Running task 2936 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_populate_sysroot)
NOTE: Running task 2937 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_package)
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ell-0.40-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.40-r0: task do_package: Started
NOTE: recipe ell-0.40-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2938 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2939 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_configure)
NOTE: recipe ofono-1.32-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: Running task 2940 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Succeeded
NOTE: Running task 2941 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2942 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.112-r0: task do_install: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_package: Succeeded
NOTE: Running task 2943 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_packagedata)
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_packagedata: Started
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-src went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-dbg went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-staticdev went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-dev went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-doc went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-locale went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
NOTE: recipe ell-0.40-r0: task do_package: Succeeded
NOTE: Running task 2944 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_packagedata)
NOTE: recipe libnss-mdns-0.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2945 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_package_write_rpm)
NOTE: Running task 2946 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm)
NOTE: recipe ell-0.40-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.112-r0: task do_install: Succeeded
NOTE: Running task 2947 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package)
NOTE: Running task 2948 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_populate_sysroot)
NOTE: recipe libnss-mdns-0.15-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package: Started
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-src went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-dbg went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-staticdev went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-dev went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-doc went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-locale went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.40-r0: task do_packagedata: Succeeded
NOTE: Running task 2949 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_package_write_rpm)
NOTE: recipe ell-0.40-r0: task do_package_write_rpm: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2950 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ell-0.40-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2951 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2952 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package: Succeeded
NOTE: Running task 2953 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_packagedata)
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2954 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Succeeded
NOTE: Running task 2955 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm unihash changed to 247f81fbcd92f7d61d0b02fcba1bc95903630de513afd6c83a2bd6ec4978e18f
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2956 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2957 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 2958 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2959 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_install)
NOTE: recipe alsa-lib-1.2.5-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 2960 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_populate_sysroot)
NOTE: Running task 2961 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2962 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe alsa-lib-1.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 2963 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2964 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2965 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: Running task 2966 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 2967 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2968 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2969 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe ofono-1.32-r0: task do_configure: Succeeded
NOTE: Running task 2970 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_compile)
NOTE: recipe alsa-lib-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe ofono-1.32-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2971 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.32-r0: task do_compile: Succeeded
NOTE: Running task 2972 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_install)
NOTE: recipe ofono-1.32-r0: task do_install: Started
NOTE: recipe flac-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2973 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_compile)
NOTE: recipe flac-1.3.3-r0: task do_compile: Started
NOTE: recipe ofono-1.32-r0: task do_install: Succeeded
NOTE: Running task 2974 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_populate_sysroot)
NOTE: Running task 2975 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_package)
NOTE: recipe ofono-1.32-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.32-r0: task do_package: Started
NOTE: recipe ofono-1.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2976 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2977 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 2978 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe ofono-1.32-r0: task do_package: Succeeded
NOTE: Running task 2979 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe ofono-1.32-r0: task do_packagedata: Started
NOTE: recipe ofono-1.32-r0: task do_packagedata: Succeeded
NOTE: Running task 2980 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_package_write_rpm)
NOTE: recipe ofono-1.32-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2981 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 2982 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe flac-1.3.3-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2983 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 2984 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 2985 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package)
NOTE: recipe flac-1.3.3-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2986 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2987 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_configure)
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 2988 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata)
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2989 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Succeeded
NOTE: Running task 2990 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_compile)
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Succeeded
NOTE: Running task 2991 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_install)
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Succeeded
NOTE: Running task 2992 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot)
NOTE: Running task 2993 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package)
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2994 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2995 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2996 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2997 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Succeeded
NOTE: Running task 2998 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Succeeded
NOTE: Running task 2999 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 3000 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 3001 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 3002 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 3003 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3004 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 3005 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 3006 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3007 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_configure)
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3008 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package_write_rpm)
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Started
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 3009 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 3010 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 3011 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 3012 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3013 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3014 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_configure)
NOTE: Running task 3015 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_configure)
NOTE: recipe alsa-utils-1.2.5-r0: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_configure: Started
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Succeeded
NOTE: Running task 3016 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 3017 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 3018 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Succeeded
NOTE: Running task 3019 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_install)
NOTE: recipe pulseaudio-14.2-r0: task do_install: Started
NOTE: recipe pulseaudio-14.2-r0: task do_install: Succeeded
NOTE: Running task 3020 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package)
NOTE: Running task 3021 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_populate_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_package: Started
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_configure: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3022 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_compile)
NOTE: Running task 3023 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_compile)
NOTE: recipe alsa-utils-1.2.5-r0: task do_compile: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3024 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3025 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.28.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3026 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3027 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_configure)
NOTE: recipe mpg123-1.28.0-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_configure: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package: Succeeded
NOTE: Running task 3028 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_packagedata)
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3029 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_install)
NOTE: recipe alsa-utils-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3030 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_install)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3031 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_package)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_package: Started
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3032 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_package)
NOTE: recipe alsa-utils-1.2.5-r0: task do_package: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3033 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3034 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3035 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 3036 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_package_write_rpm)
NOTE: Running task 3037 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3038 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3039 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_install)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3040 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_package)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package: Started
NOTE: recipe mpg123-1.28.0-r0: task do_configure: Succeeded
NOTE: Running task 3041 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_compile)
NOTE: recipe mpg123-1.28.0-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3042 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3043 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_package_write_rpm)
NOTE: Running task 3044 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_compile: Succeeded
NOTE: Running task 3045 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_install)
NOTE: recipe mpg123-1.28.0-r0: task do_install: Started
NOTE: recipe mpg123-1.28.0-r0: task do_install: Succeeded
NOTE: Running task 3046 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_package)
NOTE: Running task 3047 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.28.0-r0: task do_package: Started
NOTE: recipe mpg123-1.28.0-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.28.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_package: Succeeded
NOTE: Running task 3048 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_packagedata)
NOTE: recipe mpg123-1.28.0-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.28.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3049 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_package_write_rpm)
NOTE: Running task 3050 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_package_qa)
NOTE: recipe mpg123-1.28.0-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.28.0-r0: task do_package_qa: Started
NOTE: recipe mpg123-1.28.0-r0: task do_package_qa: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3051 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_build)
NOTE: Tasks Summary: Attempted 3051 tasks of which 2759 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 77 ERROR messages shown, returning a non-zero exit code.

--===============3265882017056905242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1454 entries from dependency cache.
Parsing recipes...done.
Parsing of 817 .bb files complete (816 cached, 1 parsed). 1454 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-6c007fa33619e3873c2e22d3eab12264915fafaf"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6c007fa33619e3873c2e22d3eab12264915fafaf"
workspace            = "master:29c42cf24da05abb499936556dad1902e110c5a7"

Initialising tasks...done.
Sstate summary: Wanted 152 Local 31 Network 0 Missed 121 Current 856 (20% match, 87% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
Removing 1 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 885 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 886 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 887 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 890 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 891 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 951 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-topology-conf-1.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe alsa-ucm-conf-1.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-topology-conf-1.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe alsa-ucm-conf-1.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1001 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1002 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1003 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1004 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: recipe alsa-topology-conf-1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-ucm-conf-1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-src went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dbg went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-staticdev went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dev went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
NOTE: recipe alsa-topology-conf-1.2.5-r0: task do_packagedata_setscene: Succeeded
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-doc went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-locale went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
NOTE: recipe alsa-ucm-conf-1.2.5-r0: task do_packagedata_setscene: Succeeded
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-src went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dbg went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-staticdev went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dev went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-doc went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Succeeded
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: Running setscene task 1006 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_deploy_source_date_epoch_setscene)
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-af went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-az went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-bg went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ca went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-crh went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-cs went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-da went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-de went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-el went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-en-gb went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-eo went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-es went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fi went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fr went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fur went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-gl went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hr went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hu went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-id went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-it went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ja went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ka went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Started
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ko went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ky went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-lt went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nb went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nl went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pl went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt-br went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ro went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ru went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: Running task 1097 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-rw went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sk went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sl went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sq went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sr went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sv went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-tr went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-uk went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-vi went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-cn went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.32-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-tw went backwards which would break package feeds (from 0:2.33-r0 to 0:2.32-r0) [version-going-backwards]
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1008 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1304 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1410 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_fetch)
NOTE: Running task 1437 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1438 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_fetch)
NOTE: Running task 1488 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 1586 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 1587 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.5-r0: task do_fetch: Started
NOTE: Running task 1667 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1670 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: Running task 1671 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 1708 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: Running task 1725 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_unpack)
NOTE: Running task 1726 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe flac-1.3.3-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Started
NOTE: Running task 1755 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1756 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 1757 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_fetch)
NOTE: Running task 1758 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 1759 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: Running task 1805 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1821 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Succeeded
NOTE: Running task 1822 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_unpack)
NOTE: Running task 1834 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_unpack)
NOTE: Running task 1855 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: recipe ell-0.40-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_unpack: Started
NOTE: recipe ell-0.40-r0: task do_fetch: Succeeded
NOTE: Running task 1975 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: Running task 1976 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1977 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_unpack)
NOTE: Running task 1985 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_fetch)
NOTE: Running task 2014 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_write_config)
NOTE: Running task 2017 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_fetch)
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 2052 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: recipe ofono-1.32-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: Running task 2053 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 2054 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: Running task 2055 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: Running task 2056 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2069 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_fetch)
NOTE: Running task 2104 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: Running task 2105 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Started
NOTE: Running task 2122 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: Running task 2123 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: Running task 2162 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_fetch)
NOTE: Running task 2165 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: Running task 2166 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_fetch)
NOTE: Running task 2167 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: Running task 2168 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_fetch)
NOTE: recipe ofono-1.32-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.40-r0: task do_unpack: Started
NOTE: Running task 2190 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_unpack)
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: recipe mpg123-1.28.0-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Started
NOTE: Running task 2245 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 2246 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.28.0-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: Running task 2247 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_unpack)
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Succeeded
NOTE: Running task 2320 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Succeeded
NOTE: Running task 2321 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Succeeded
NOTE: Running task 2326 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.5-r0: task do_unpack: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: Running task 2334 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: Running task 2341 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_patch)
NOTE: recipe alsa-utils-1.2.5-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: Running task 2346 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: Running task 2347 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2371 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_fetch: Started
NOTE: Running task 2372 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_unpack)
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_fetch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 2380 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: Running task 2381 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_unpack)
NOTE: Running task 2388 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_fetch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Started
NOTE: Running task 2414 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.32-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 2426 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_unpack)
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2442 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 2443 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: Running task 2444 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: recipe mpg123-1.28.0-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe ell-0.40-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 2505 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_patch)
NOTE: recipe alsa-lib-1.2.5-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Started
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: Running task 2565 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_fetch: Succeeded
NOTE: Running task 2660 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_unpack)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: recipe ell-0.40-r0: task do_patch: Started
NOTE: Running task 2661 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: Running task 2662 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2663 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_patch)
NOTE: Running task 2664 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2665 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_patch)
NOTE: Running task 2666 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: Running task 2667 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libnss-mdns-0.15-r0: task do_unpack: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2668 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_patch)
NOTE: recipe mpg123-1.28.0-r0: task do_unpack: Succeeded
NOTE: Running task 2669 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_patch)
NOTE: recipe ell-0.40-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2670 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_deploy_source_date_epoch)
NOTE: Running task 2671 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: Running task 2672 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_patch: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2673 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_patch)
NOTE: Running task 2674 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2675 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: Running task 2676 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2677 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_patch: Started
NOTE: Running task 2678 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2679 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe ell-0.40-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2680 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe ofono-1.32-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Started
NOTE: Running task 2681 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_patch)
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 2682 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: Running task 2683 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2684 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_unpack: Succeeded
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2685 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2686 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: Running task 2687 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_unpack: Succeeded
NOTE: recipe ofono-1.32-r0: task do_patch: Started
NOTE: Running task 2688 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Succeeded
NOTE: Running task 2689 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_patch)
NOTE: Running task 2690 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_patch: Succeeded
NOTE: recipe ell-0.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2691 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: Running task 2692 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libnss-mdns-0.15-r0: task do_patch: Started
NOTE: recipe mpg123-1.28.0-r0: task do_patch: Succeeded
NOTE: Running task 2693 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2694 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_populate_lic)
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: Running task 2695 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_deploy_source_date_epoch)
NOTE: Running task 2696 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2697 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_patch: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2698 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.5-r0: task do_configure: Started
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.32-r0: task do_patch: Succeeded
NOTE: Running task 2699 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.28.0-r0: task do_populate_lic: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2700 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: Running task 2701 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2702 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-1.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 2fafd8cdc0b3b9db03a7d348f439603ff96ab3329d06ed532a9351ddea677285
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_populate_lic unihash changed to ad7fb1b5c6b1122f8cbdf55afe179c9212d25ff90dde4a43e7ae51584d137d38
NOTE: recipe libnss-mdns-0.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe mpg123-1.28.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2747 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: Running task 2748 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2773 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2795 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: recipe ofono-1.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2798 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2808 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe alsa-utils-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Succeeded
NOTE: Running task 2813 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Started
NOTE: Running task 2814 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_deploy_source_date_epoch)
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2815 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 2816 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2817 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 2818 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7e2336e175ef05530b7317f7647a0e63e209d2cb513e7bfd919a4003e2704b4d
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: Setscene tasks completed
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2859 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: Running task 2880 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe ell-0.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2885 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: recipe ell-0.40-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2886 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_configure)
NOTE: recipe libnss-mdns-0.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2887 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_configure)
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 2888 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Succeeded
NOTE: Running task 2889 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Succeeded
NOTE: Running task 2890 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Succeeded
NOTE: Running task 2891 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2892 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Succeeded
NOTE: Running task 2893 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Succeeded
NOTE: Running task 2894 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 2895 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 2896 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 2897 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 2898 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 2899 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 2900 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 2901 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: Running task 2902 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2903 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 2904 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2905 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2906 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe alsa-lib-1.2.5-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: Running task 2907 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2908 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2909 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2910 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2911 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: Running task 2912 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2913 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2914 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2915 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-src went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dbg went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-staticdev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-dev went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-doc went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi-locale went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
ERROR: libxi-1_1.7.10-r0 do_packagedata: QA Issue: Package version for package libxi went backwards which would break package feeds (from 1:1.7.99.2-r0 to 1:1.7.10-r0) [version-going-backwards]
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2916 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2917 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2918 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2919 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2920 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2921 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2922 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.3.3-r0: task do_configure: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2923 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe ell-0.40-r0: task do_configure: Succeeded
NOTE: Running task 2924 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_compile)
NOTE: recipe ell-0.40-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2925 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package_write_rpm)
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2926 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2927 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_configure: Succeeded
NOTE: Running task 2928 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_compile)
NOTE: recipe libnss-mdns-0.15-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2929 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Succeeded
NOTE: Running task 2930 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libogg-1.3.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_compile: Succeeded
NOTE: Running task 2931 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_install)
NOTE: recipe ell-0.40-r0: task do_compile: Succeeded
NOTE: Running task 2932 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_install)
NOTE: recipe libnss-mdns-0.15-r0: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 2933 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 2934 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe ell-0.40-r0: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_install: Succeeded
NOTE: Running task 2935 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_package)
NOTE: recipe ell-0.40-r0: task do_install: Succeeded
NOTE: Running task 2936 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_populate_sysroot)
NOTE: Running task 2937 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_package)
NOTE: recipe libnss-mdns-0.15-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ell-0.40-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.40-r0: task do_package: Started
NOTE: recipe ell-0.40-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2938 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: Running task 2939 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_configure)
NOTE: Running task 2940 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: recipe ofono-1.32-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Succeeded
NOTE: Running task 2941 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2942 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.112-r0: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_package: Succeeded
NOTE: Running task 2943 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_packagedata)
NOTE: recipe ell-0.40-r0: task do_package: Succeeded
NOTE: Running task 2944 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_packagedata)
NOTE: recipe libnss-mdns-0.15-r0: task do_packagedata: Started
NOTE: recipe ell-0.40-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.112-r0: task do_install: Succeeded
NOTE: Running task 2945 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package)
NOTE: Running task 2946 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_populate_sysroot)
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-src went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-dbg went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-staticdev went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-dev went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-doc went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
NOTE: recipe dbus-glib-0.112-r0: task do_package: Started
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns-locale went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
ERROR: libnss-mdns-0.15-r0 do_packagedata: QA Issue: Package version for package libnss-mdns went backwards which would break package feeds (from 0:0.15.1-r0 to 0:0.15-r0) [version-going-backwards]
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Started
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-src went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-dbg went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-staticdev went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-dev went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-doc went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell-locale went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
ERROR: ell-0.40-r0 do_packagedata: QA Issue: Package version for package ell went backwards which would break package feeds (from 0:0.41-r0 to 0:0.40-r0) [version-going-backwards]
NOTE: recipe libnss-mdns-0.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2947 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_package_write_rpm)
NOTE: Running task 2948 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm)
NOTE: recipe ell-0.40-r0: task do_packagedata: Succeeded
NOTE: Running task 2949 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_package_write_rpm)
NOTE: recipe libnss-mdns-0.15-r0: task do_package_write_rpm: Started
NOTE: recipe ell-0.40-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2950 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ell-0.40-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2951 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package: Succeeded
NOTE: Running task 2952 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_packagedata)
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2953 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2954 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_install)
NOTE: recipe alsa-lib-1.2.5-r0: task do_install: Started
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Succeeded
NOTE: Running task 2955 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2956 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2957 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 2958 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe alsa-lib-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 2959 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_populate_sysroot)
NOTE: Running task 2960 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_package: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2961 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm unihash changed to 156e5e5e238c51acbe7293bcf27260587681345428d4c1f26dbd2dc7fc2242c2
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 2962 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2963 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2964 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 2965 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.5-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2966 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2967 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2968 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe ofono-1.32-r0: task do_configure: Succeeded
NOTE: Running task 2969 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_compile)
NOTE: recipe ofono-1.32-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2970 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2971 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.32-r0: task do_compile: Succeeded
NOTE: Running task 2972 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_install)
NOTE: recipe ofono-1.32-r0: task do_install: Started
NOTE: recipe ofono-1.32-r0: task do_install: Succeeded
NOTE: Running task 2973 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_populate_sysroot)
NOTE: Running task 2974 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_package)
NOTE: recipe ofono-1.32-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.32-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2975 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_compile)
NOTE: recipe flac-1.3.3-r0: task do_compile: Started
NOTE: recipe ofono-1.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2976 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2977 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 2978 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe ofono-1.32-r0: task do_package: Succeeded
NOTE: Running task 2979 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_packagedata)
NOTE: recipe ofono-1.32-r0: task do_packagedata: Started
NOTE: recipe ofono-1.32-r0: task do_packagedata: Succeeded
NOTE: Running task 2980 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_package_write_rpm)
NOTE: recipe ofono-1.32-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 2981 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2982 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_install)
NOTE: recipe flac-1.3.3-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2983 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 2984 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 2985 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2986 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2987 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_configure)
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 2988 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata)
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2989 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Succeeded
NOTE: Running task 2990 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_compile)
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Succeeded
NOTE: Running task 2991 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_install)
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Succeeded
NOTE: Running task 2992 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot)
NOTE: Running task 2993 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package)
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2994 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2995 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2996 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: Running task 2997 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Succeeded
NOTE: Running task 2998 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Succeeded
NOTE: Running task 2999 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 3000 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 3001 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 3002 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 3003 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3004 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 3005 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3006 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package_write_rpm)
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 3007 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3008 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_configure)
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 3009 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 3010 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 3011 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Succeeded
NOTE: Running task 3012 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_compile)
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 3013 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3014 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 3015 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3016 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_configure)
NOTE: recipe alsa-utils-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3017 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 3018 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Succeeded
NOTE: Running task 3019 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_install)
NOTE: recipe pulseaudio-14.2-r0: task do_install: Started
NOTE: recipe pulseaudio-14.2-r0: task do_install: Succeeded
NOTE: Running task 3020 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package)
NOTE: Running task 3021 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_populate_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_package: Started
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3022 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3023 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.28.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.28.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3024 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3025 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_configure)
NOTE: recipe mpg123-1.28.0-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_configure: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3026 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_compile)
NOTE: Running task 3027 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_compile)
NOTE: recipe alsa-utils-1.2.5-r0: task do_compile: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package: Succeeded
NOTE: Running task 3028 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_packagedata)
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3029 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_install)
NOTE: recipe alsa-utils-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3030 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_install)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3031 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_package)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3032 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_package)
NOTE: recipe alsa-utils-1.2.5-r0: task do_package: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3033 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3034 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3035 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3036 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 3037 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_package_write_rpm)
NOTE: Running task 3038 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3039 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_install)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3040 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_package)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package: Started
NOTE: recipe mpg123-1.28.0-r0: task do_configure: Succeeded
NOTE: Running task 3041 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_compile)
NOTE: recipe mpg123-1.28.0-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3042 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3043 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_package_write_rpm)
NOTE: Running task 3044 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_compile: Succeeded
NOTE: Running task 3045 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_install)
NOTE: recipe mpg123-1.28.0-r0: task do_install: Started
NOTE: recipe mpg123-1.28.0-r0: task do_install: Succeeded
NOTE: Running task 3046 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_package)
NOTE: Running task 3047 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.28.0-r0: task do_package: Started
NOTE: recipe mpg123-1.28.0-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.28.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_package: Succeeded
NOTE: Running task 3048 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_packagedata)
NOTE: recipe mpg123-1.28.0-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.28.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3049 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_package_write_rpm)
NOTE: Running task 3050 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_package_qa)
NOTE: recipe mpg123-1.28.0-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.28.0-r0: task do_package_qa: Started
NOTE: recipe mpg123-1.28.0-r0: task do_package_qa: Succeeded
NOTE: recipe mpg123-1.28.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3051 of 3051 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb:do_build)
NOTE: Tasks Summary: Attempted 3051 tasks of which 2759 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 77 ERROR messages shown, returning a non-zero exit code.

--===============3265882017056905242==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-mpg123-upgrade-1.27.2-1.28.0.patch"

From eaedd97dfe7c8125c1ff27c683dbc44ee0e2fc57 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 13 Jun 2021 11:04:12 +0000
Subject: [PATCH] mpg123: upgrade 1.27.2 -> 1.28.0

---
 .../mpg123/{mpg123_1.27.2.bb => mpg123_1.28.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.27.2.bb => mpg123_1.28.0.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb b/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb
index 9a91cc89d6..143a59ba63 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "52f6ceb962c05db0c043bb27acf5a721381f5f356ac4610e5221f50293891b04"
+SRC_URI[sha256sum] = "e49466853685026da5d113dc7ff026b1b2ad0b57d78df693a446add9db88a7d5"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.17.1


--===============3265882017056905242==--
