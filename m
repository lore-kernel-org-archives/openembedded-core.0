Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.935.1608060223485153178
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:23:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 351F138C1283
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 19:23:43 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysvinit: upgrading to 2.98 SUCCEEDED
Message-ID: <MADEUP.1650FA40E84D470C.26179@lists.openembedded.org>
X-Groupsio-MsgNum: 145668
Content-Type: multipart/mixed; boundary="===============9092553140728514769=="

--===============9092553140728514769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sysvinit* to *2.98* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysvinit-upgrade-2.97-2.98.patch
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

--===============9092553140728514769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 1412 entries from dependency cache.
Parsing recipes...done.
Parsing of 806 .bb files complete (803 cached, 3 parsed). 1410 targets, 41 skipped, 0 masked, 0 errors.
Removing 94 recipes from the core2-32 sysroot...done.
Removing 100 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-8fbab09d1b73546862b2c7a4f4d001fec83a79fa"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8fbab09d1b73546862b2c7a4f4d001fec83a79fa"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 478 Found 466 Missed 12 Current 196 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 197 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 199 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 200 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 203 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/os-release/os-release.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from c75b52a47ebbc6faa045e2ae3fc35eb6727940ec35f372a58438339d8ca7b6c8 to eb0fe631e696134526febf2863dc07ebbe4c31597200bfa6f8963f9774d4d484. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/os-release/os-release.bb:do_compile, the basehash value changed from ecff77b3e7e75245fab3613e214d22cc7151cb2b45f15cd50f4ec7a9590de53b to 45704ab116257e3ccfdbc01238f56e4dc82888744f0931f2c18bd5088587dcb8. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake os-release -cdo_compile -Snone
ERROR: Then:
ERROR: $ bitbake os-release -cdo_compile -Sprintdiff

NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe os-release-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 254 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 255 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 257 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 260 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 261 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 262 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 263 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 264 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe os-release-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 265 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 267 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 268 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 270 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 271 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 273 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 279 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 282 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 283 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 285 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 286 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 287 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 290 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 291 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 293 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 294 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 295 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 296 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 297 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 298 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 300 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-src went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 301 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-dbg went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
NOTE: Running setscene task 302 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 303 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-staticdev went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-dev went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
NOTE: Running setscene task 304 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_packagedata_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-doc went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 305 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 306 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-locale went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
NOTE: Running setscene task 308 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 309 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-invoke-rc.d went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
NOTE: Running setscene task 310 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 311 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-service went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 312 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 313 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 314 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 315 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 317 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 318 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 320 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 321 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 323 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 324 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 325 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 326 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 330 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 338 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 343 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 348 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: Running setscene task 349 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 353 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 360 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 372 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: Running setscene task 374 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 375 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 376 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 720 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_fetch)
NOTE: Running task 735 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_fetch)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 397 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 405 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_fetch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_fetch: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_fetch: Succeeded
NOTE: Running task 947 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_unpack)
NOTE: Running task 948 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_prepare_recipe_sysroot)
NOTE: Running task 949 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_unpack)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 413 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_unpack: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysvinit-2.98-r0: task do_unpack: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 974 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_patch)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 430 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_patch: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 433 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_unpack: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1013 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_patch)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_patch: Succeeded
NOTE: Running task 1014 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_deploy_source_date_epoch)
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_patch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1027 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_configure)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_configure: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_configure: Succeeded
NOTE: Running task 1028 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_compile)
NOTE: recipe sysvinit-2.98-r0: task do_patch: Succeeded
NOTE: Running task 1029 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_deploy_source_date_epoch)
NOTE: Running task 1030 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_lic)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_compile: Started
NOTE: recipe sysvinit-2.98-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_lic: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_compile: Succeeded
NOTE: Running task 1031 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_install)
NOTE: recipe sysvinit-2.98-r0: task do_populate_lic: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_lic unihash changed to f1ea31c32af8ceeef5b51ac1f131490006a639180d4e4b6b0d0688e4b705a3aa
NOTE: Running setscene task 449 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_install: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_install: Succeeded
NOTE: Running task 1037 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_package)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 456 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package: Started
NOTE: Running setscene task 460 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 471 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 474 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 489 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from c75b52a47ebbc6faa045e2ae3fc35eb6727940ec35f372a58438339d8ca7b6c8 to eb0fe631e696134526febf2863dc07ebbe4c31597200bfa6f8963f9774d4d484. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 496 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 498 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 515 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 518 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 527 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 538 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 548 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package: Succeeded
NOTE: Running task 1182 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_packagedata)
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_packagedata: Started
NOTE: Running setscene task 580 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_packagedata: Succeeded
NOTE: Running setscene task 596 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1207 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_package_write_rpm)
NOTE: recipe openssl-1.1.1h-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package_write_rpm: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 649 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 651 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 652 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 653 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 658 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 659 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 666 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 667 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 668 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 670 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 671 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 672 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 673 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1903 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_prepare_recipe_sysroot)
NOTE: recipe sysvinit-2.98-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysvinit-2.98-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2132 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_configure)
NOTE: recipe sysvinit-2.98-r0: task do_configure: Started
NOTE: recipe sysvinit-2.98-r0: task do_configure: Succeeded
NOTE: Running task 2133 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_compile)
NOTE: recipe sysvinit-2.98-r0: task do_compile: Started
NOTE: recipe sysvinit-2.98-r0: task do_compile: Succeeded
NOTE: Running task 2134 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_install)
NOTE: recipe sysvinit-2.98-r0: task do_install: Started
NOTE: recipe sysvinit-2.98-r0: task do_install: Succeeded
NOTE: Running task 2135 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_package)
NOTE: Running task 2136 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_sysroot)
NOTE: recipe sysvinit-2.98-r0: task do_package: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_sysroot: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_package: Succeeded
NOTE: Running task 2137 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_packagedata)
NOTE: recipe sysvinit-2.98-r0: task do_packagedata: Started
NOTE: recipe sysvinit-2.98-r0: task do_packagedata: Succeeded
NOTE: Running task 2138 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_package_write_rpm)
NOTE: Running task 2139 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_package_qa)
NOTE: recipe sysvinit-2.98-r0: task do_package_write_rpm: Started
NOTE: recipe sysvinit-2.98-r0: task do_package_qa: Started
NOTE: recipe sysvinit-2.98-r0: task do_package_qa: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2140 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_build)
NOTE: Tasks Summary: Attempted 2140 tasks of which 2114 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 24 ERROR messages shown, returning a non-zero exit code.

--===============9092553140728514769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sysvinit: PKGV changed from 2.97 [default] to 2.98 [default]
packages/core2-32-poky-linux/sysvinit: SRC_URI changed from "https://download.savannah.gnu.org/releases/sysvinit/sysvinit-2.97.tar.xz file://install.patch file://crypt-lib.patch file://pidof-add-m-option.patch file://realpath.patch file://0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch file://rcS-default file://rc file://rcS file://bootlogd.init file://01_bootlogd" to "https://download.savannah.gnu.org/releases/sysvinit/sysvinit-2.98.tar.xz file://install.patch file://crypt-lib.patch file://pidof-add-m-option.patch file://realpath.patch file://0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch file://rcS-default file://rc file://rcS file://bootlogd.init file://01_bootlogd"
packages/core2-32-poky-linux/sysvinit: PV changed from "2.97" to "2.98"
packages/core2-32-poky-linux/sysvinit/sysvinit-dbg: PKGV changed from 2.97 [default] to 2.98 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-dbg: PKGSIZE changed from 538148 to 538180 (+0%)
packages/core2-32-poky-linux/sysvinit/sysvinit-dbg: PV changed from "2.97" to "2.98"
packages/core2-32-poky-linux/sysvinit/sysvinit-dev: PKGV changed from 2.97 [default] to 2.98 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-dev: PV changed from "2.97" to "2.98"
packages/core2-32-poky-linux/sysvinit/sysvinit-doc: PKGV changed from 2.97 [default] to 2.98 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-doc: PV changed from "2.97" to "2.98"
packages/core2-32-poky-linux/sysvinit/sysvinit-locale: PKGV changed from 2.97 [default] to 2.98 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-locale: PV changed from "2.97" to "2.98"
packages/core2-32-poky-linux/sysvinit/sysvinit-pidof: PKGV changed from 2.97 [default] to 2.98 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-pidof: PV changed from "2.97" to "2.98"
packages/core2-32-poky-linux/sysvinit/sysvinit-src: PKGV changed from 2.97 [default] to 2.98 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-src: PKGSIZE changed from 268196 to 268249 (+0%)
packages/core2-32-poky-linux/sysvinit/sysvinit-src: PV changed from "2.97" to "2.98"
packages/core2-32-poky-linux/sysvinit/sysvinit-staticdev: PKGV changed from 2.97 [default] to 2.98 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-staticdev: PV changed from "2.97" to "2.98"
packages/core2-32-poky-linux/sysvinit/sysvinit-sulogin: PKGV changed from 2.97 [default] to 2.98 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-sulogin: PV changed from "2.97" to "2.98"
packages/core2-32-poky-linux/sysvinit/sysvinit: PKGV changed from 2.97 [default] to 2.98 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit: PV changed from "2.97" to "2.98"

--===============9092553140728514769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 1413 entries from dependency cache.
Parsing recipes...done.
Parsing of 806 .bb files complete (803 cached, 3 parsed). 1410 targets, 49 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.2+snapshot-8fbab09d1b73546862b2c7a4f4d001fec83a79fa"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8fbab09d1b73546862b2c7a4f4d001fec83a79fa"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 16 Found 5 Missed 11 Current 647 (31% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 648 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 661 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-src went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-dbg went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-staticdev went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-dev went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-doc went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-locale went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-invoke-rc.d went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-service went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1526 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_fetch)
NOTE: Running task 1578 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_fetch)
NOTE: recipe sysvinit-2.98-r0: task do_fetch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_fetch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_fetch: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_fetch: Succeeded
NOTE: Running task 1949 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_unpack)
NOTE: Running task 1950 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1962 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_unpack)
NOTE: Running task 1963 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_prepare_recipe_sysroot)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_unpack: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysvinit-2.98-r0: task do_unpack: Started
NOTE: recipe sysvinit-2.98-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_unpack: Succeeded
NOTE: Running task 2100 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_patch)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_patch: Started
NOTE: recipe sysvinit-2.98-r0: task do_unpack: Succeeded
NOTE: Running task 2101 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_patch)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_patch: Succeeded
NOTE: Running task 2102 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_deploy_source_date_epoch)
NOTE: recipe sysvinit-2.98-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_patch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2103 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_configure)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_configure: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_configure: Succeeded
NOTE: Running task 2104 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_compile)
NOTE: recipe sysvinit-2.98-r0: task do_patch: Succeeded
NOTE: Running task 2105 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_deploy_source_date_epoch)
NOTE: Running task 2106 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_lic)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_compile: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_compile: Succeeded
NOTE: Running task 2107 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_install)
NOTE: recipe sysvinit-2.98-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_lic: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_lic: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_lic unihash changed to f1ea31c32af8ceeef5b51ac1f131490006a639180d4e4b6b0d0688e4b705a3aa
NOTE: Running task 2108 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_configure)
NOTE: recipe sysvinit-2.98-r0: task do_configure: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_install: Started
NOTE: recipe sysvinit-2.98-r0: task do_configure: Succeeded
NOTE: Running task 2109 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_compile)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_install: Succeeded
NOTE: Running task 2110 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_package)
NOTE: recipe sysvinit-2.98-r0: task do_compile: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package: Started
NOTE: recipe sysvinit-2.98-r0: task do_compile: Succeeded
NOTE: Running task 2111 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_install)
NOTE: recipe sysvinit-2.98-r0: task do_install: Started
NOTE: recipe sysvinit-2.98-r0: task do_install: Succeeded
NOTE: Running task 2112 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_package)
NOTE: Running task 2113 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_sysroot)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package: Succeeded
NOTE: Running task 2114 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_packagedata)
NOTE: recipe sysvinit-2.98-r0: task do_package: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_sysroot: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_packagedata: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_packagedata: Succeeded
NOTE: Running task 2115 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_package_write_rpm)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package_write_rpm: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package_write_rpm: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_package: Succeeded
NOTE: Running task 2116 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_packagedata)
NOTE: recipe sysvinit-2.98-r0: task do_packagedata: Started
NOTE: recipe sysvinit-2.98-r0: task do_packagedata: Succeeded
NOTE: Running task 2117 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_package_write_rpm)
NOTE: Running task 2118 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_package_qa)
NOTE: recipe sysvinit-2.98-r0: task do_package_write_rpm: Started
NOTE: recipe sysvinit-2.98-r0: task do_package_qa: Started
NOTE: recipe sysvinit-2.98-r0: task do_package_qa: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2119 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_build)
NOTE: Tasks Summary: Attempted 2119 tasks of which 2093 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages shown, returning a non-zero exit code.

--===============9092553140728514769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 1413 entries from dependency cache.
Parsing recipes...done.
Parsing of 806 .bb files complete (803 cached, 3 parsed). 1410 targets, 57 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.2+snapshot-8fbab09d1b73546862b2c7a4f4d001fec83a79fa"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8fbab09d1b73546862b2c7a4f4d001fec83a79fa"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 16 Found 5 Missed 11 Current 647 (31% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 648 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 661 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-src went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-dbg went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-staticdev went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-dev went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-doc went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-locale went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-invoke-rc.d went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-service went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1526 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_fetch)
NOTE: Running task 1578 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_fetch)
NOTE: recipe sysvinit-2.98-r0: task do_fetch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_fetch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_fetch: Succeeded
NOTE: Running task 1939 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_unpack)
NOTE: Running task 1940 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_prepare_recipe_sysroot)
NOTE: recipe sysvinit-2.98-r0: task do_fetch: Succeeded
NOTE: Running task 1982 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_unpack)
NOTE: Running task 1983 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_prepare_recipe_sysroot)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_unpack: Started
NOTE: recipe sysvinit-2.98-r0: task do_unpack: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_unpack: Succeeded
NOTE: Running task 2100 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_patch)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_patch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_patch: Succeeded
NOTE: Running task 2101 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_deploy_source_date_epoch)
NOTE: recipe sysvinit-2.98-r0: task do_unpack: Succeeded
NOTE: Running task 2102 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_patch)
NOTE: recipe sysvinit-2.98-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe sysvinit-2.98-r0: task do_patch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2103 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_configure)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_configure: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_configure: Succeeded
NOTE: Running task 2104 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_compile)
NOTE: recipe sysvinit-2.98-r0: task do_patch: Succeeded
NOTE: Running task 2105 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_deploy_source_date_epoch)
NOTE: Running task 2106 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_lic)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_compile: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_compile: Succeeded
NOTE: Running task 2107 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_install)
NOTE: recipe sysvinit-2.98-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_lic: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_lic: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_lic unihash changed to f1ea31c32af8ceeef5b51ac1f131490006a639180d4e4b6b0d0688e4b705a3aa
NOTE: Running task 2108 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_configure)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_install: Started
NOTE: recipe sysvinit-2.98-r0: task do_configure: Started
NOTE: recipe sysvinit-2.98-r0: task do_configure: Succeeded
NOTE: Running task 2109 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_compile)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_install: Succeeded
NOTE: Running task 2110 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_package)
NOTE: recipe sysvinit-2.98-r0: task do_compile: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package: Started
NOTE: recipe sysvinit-2.98-r0: task do_compile: Succeeded
NOTE: Running task 2111 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_install)
NOTE: recipe sysvinit-2.98-r0: task do_install: Started
NOTE: recipe sysvinit-2.98-r0: task do_install: Succeeded
NOTE: Running task 2112 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_package)
NOTE: Running task 2113 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_sysroot)
NOTE: recipe sysvinit-2.98-r0: task do_package: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_sysroot: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package: Succeeded
NOTE: Running task 2114 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_packagedata)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_packagedata: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_packagedata: Succeeded
NOTE: Running task 2115 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_package_write_rpm)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package_write_rpm: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package_write_rpm: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_package: Succeeded
NOTE: Running task 2116 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_packagedata)
NOTE: recipe sysvinit-2.98-r0: task do_packagedata: Started
NOTE: recipe sysvinit-2.98-r0: task do_packagedata: Succeeded
NOTE: Running task 2117 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_package_write_rpm)
NOTE: Running task 2118 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_package_qa)
NOTE: recipe sysvinit-2.98-r0: task do_package_write_rpm: Started
NOTE: recipe sysvinit-2.98-r0: task do_package_qa: Started
NOTE: recipe sysvinit-2.98-r0: task do_package_qa: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2119 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_build)
NOTE: Tasks Summary: Attempted 2119 tasks of which 2093 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages shown, returning a non-zero exit code.

--===============9092553140728514769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 1413 entries from dependency cache.
Parsing recipes...done.
Parsing of 806 .bb files complete (803 cached, 3 parsed). 1410 targets, 66 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.2+snapshot-8fbab09d1b73546862b2c7a4f4d001fec83a79fa"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8fbab09d1b73546862b2c7a4f4d001fec83a79fa"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 16 Found 5 Missed 11 Current 647 (31% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 648 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 661 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-src went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-dbg went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-staticdev went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-dev went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-doc went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-locale went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-invoke-rc.d went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-service went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1526 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_fetch)
NOTE: Running task 1578 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_fetch)
NOTE: recipe sysvinit-2.98-r0: task do_fetch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_fetch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_fetch: Succeeded
NOTE: Running task 1859 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_unpack)
NOTE: Running task 1860 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_prepare_recipe_sysroot)
NOTE: recipe sysvinit-2.98-r0: task do_fetch: Succeeded
NOTE: Running task 1896 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_unpack)
NOTE: Running task 1897 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_prepare_recipe_sysroot)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_unpack: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_unpack: Succeeded
NOTE: Running task 2100 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_patch)
NOTE: recipe sysvinit-2.98-r0: task do_unpack: Started
NOTE: recipe sysvinit-2.98-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_patch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_patch: Succeeded
NOTE: Running task 2101 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_deploy_source_date_epoch)
NOTE: recipe sysvinit-2.98-r0: task do_unpack: Succeeded
NOTE: Running task 2102 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_patch)
NOTE: recipe sysvinit-2.98-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe sysvinit-2.98-r0: task do_patch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2103 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_configure)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_configure: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_configure: Succeeded
NOTE: Running task 2104 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_compile)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_compile: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_compile: Succeeded
NOTE: Running task 2105 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_install)
NOTE: recipe sysvinit-2.98-r0: task do_patch: Succeeded
NOTE: Running task 2106 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_deploy_source_date_epoch)
NOTE: Running task 2107 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_lic)
NOTE: recipe sysvinit-2.98-r0: task do_populate_lic: Started
NOTE: recipe sysvinit-2.98-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_lic unihash changed to f1ea31c32af8ceeef5b51ac1f131490006a639180d4e4b6b0d0688e4b705a3aa
NOTE: recipe sysvinit-2.98-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2108 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_configure)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_install: Started
NOTE: recipe sysvinit-2.98-r0: task do_configure: Started
NOTE: recipe sysvinit-2.98-r0: task do_configure: Succeeded
NOTE: Running task 2109 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_compile)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_install: Succeeded
NOTE: Running task 2110 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_package)
NOTE: recipe sysvinit-2.98-r0: task do_compile: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package: Started
NOTE: recipe sysvinit-2.98-r0: task do_compile: Succeeded
NOTE: Running task 2111 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_install)
NOTE: recipe sysvinit-2.98-r0: task do_install: Started
NOTE: recipe sysvinit-2.98-r0: task do_install: Succeeded
NOTE: Running task 2112 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_package)
NOTE: Running task 2113 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_sysroot)
NOTE: recipe sysvinit-2.98-r0: task do_package: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_sysroot: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package: Succeeded
NOTE: Running task 2114 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_packagedata)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_packagedata: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_packagedata: Succeeded
NOTE: Running task 2115 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_package_write_rpm)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package_write_rpm: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package_write_rpm: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_package: Succeeded
NOTE: Running task 2116 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_packagedata)
NOTE: recipe sysvinit-2.98-r0: task do_packagedata: Started
NOTE: recipe sysvinit-2.98-r0: task do_packagedata: Succeeded
NOTE: Running task 2117 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_package_write_rpm)
NOTE: Running task 2118 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_package_qa)
NOTE: recipe sysvinit-2.98-r0: task do_package_write_rpm: Started
NOTE: recipe sysvinit-2.98-r0: task do_package_qa: Started
NOTE: recipe sysvinit-2.98-r0: task do_package_qa: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2119 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_build)
NOTE: Tasks Summary: Attempted 2119 tasks of which 2093 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages shown, returning a non-zero exit code.

--===============9092553140728514769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1418 entries from dependency cache.
Parsing recipes...done.
Parsing of 806 .bb files complete (805 cached, 1 parsed). 1410 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-8fbab09d1b73546862b2c7a4f4d001fec83a79fa"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8fbab09d1b73546862b2c7a4f4d001fec83a79fa"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 16 Found 5 Missed 11 Current 647 (31% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 648 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 661 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-src went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-dbg went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-staticdev went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-dev went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-doc went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-locale went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-invoke-rc.d went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
ERROR: init-system-helpers-1.58-r0 do_packagedata_setscene: QA Issue: Package version for package init-system-helpers-service went backwards which would break package feeds (from 0:1.60-r0 to 0:1.58-r0) [version-going-backwards]
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1526 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_fetch)
NOTE: Running task 1578 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_fetch)
NOTE: recipe sysvinit-2.98-r0: task do_fetch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_fetch: Started
NOTE: recipe sysvinit-2.98-r0: task do_fetch: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_fetch: Succeeded
NOTE: Running task 1903 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_unpack)
NOTE: Running task 1904 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1905 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_unpack)
NOTE: Running task 1906 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_prepare_recipe_sysroot)
NOTE: recipe sysvinit-2.98-r0: task do_unpack: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_unpack: Started
NOTE: recipe sysvinit-2.98-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_unpack: Succeeded
NOTE: Running task 2100 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_patch)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_patch: Started
NOTE: recipe sysvinit-2.98-r0: task do_unpack: Succeeded
NOTE: Running task 2101 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_patch)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_patch: Succeeded
NOTE: Running task 2102 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_deploy_source_date_epoch)
NOTE: recipe sysvinit-2.98-r0: task do_patch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe sysvinit-2.98-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2103 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_configure)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_configure: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_configure: Succeeded
NOTE: Running task 2104 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_compile)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_compile: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_compile: Succeeded
NOTE: Running task 2105 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_install)
NOTE: recipe sysvinit-2.98-r0: task do_patch: Succeeded
NOTE: Running task 2106 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_deploy_source_date_epoch)
NOTE: Running task 2107 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_lic)
NOTE: recipe sysvinit-2.98-r0: task do_populate_lic: Started
NOTE: recipe sysvinit-2.98-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_lic unihash changed to f1ea31c32af8ceeef5b51ac1f131490006a639180d4e4b6b0d0688e4b705a3aa
NOTE: recipe sysvinit-2.98-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2108 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_configure)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_install: Started
NOTE: recipe sysvinit-2.98-r0: task do_configure: Started
NOTE: recipe sysvinit-2.98-r0: task do_configure: Succeeded
NOTE: Running task 2109 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_compile)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_install: Succeeded
NOTE: Running task 2110 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_package)
NOTE: recipe sysvinit-2.98-r0: task do_compile: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package: Started
NOTE: recipe sysvinit-2.98-r0: task do_compile: Succeeded
NOTE: Running task 2111 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_install)
NOTE: recipe sysvinit-2.98-r0: task do_install: Started
NOTE: recipe sysvinit-2.98-r0: task do_install: Succeeded
NOTE: Running task 2112 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_package)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package: Succeeded
NOTE: Running task 2113 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_sysroot)
NOTE: Running task 2114 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_packagedata)
NOTE: recipe sysvinit-2.98-r0: task do_populate_sysroot: Started
NOTE: recipe sysvinit-2.98-r0: task do_package: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_packagedata: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_packagedata: Succeeded
NOTE: Running task 2115 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_package_write_rpm)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package_write_rpm: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package_write_rpm: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_package: Succeeded
NOTE: Running task 2116 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_packagedata)
NOTE: recipe sysvinit-2.98-r0: task do_packagedata: Started
NOTE: recipe sysvinit-2.98-r0: task do_packagedata: Succeeded
NOTE: Running task 2117 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_package_write_rpm)
NOTE: Running task 2118 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_package_qa)
NOTE: recipe sysvinit-2.98-r0: task do_package_write_rpm: Started
NOTE: recipe sysvinit-2.98-r0: task do_package_qa: Started
NOTE: recipe sysvinit-2.98-r0: task do_package_qa: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2119 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_build)
NOTE: Tasks Summary: Attempted 2119 tasks of which 2093 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages shown, returning a non-zero exit code.

--===============9092553140728514769==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-sysvinit-upgrade-2.97-2.98.patch"

From 360ecc7d452600bc4be1d963f373b365c01689ee Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 15 Dec 2020 05:35:29 +0000
Subject: [PATCH] sysvinit: upgrade 2.97 -> 2.98

---
 .../sysvinit/{sysvinit_2.97.bb => sysvinit_2.98.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/sysvinit/{sysvinit_2.97.bb => sysvinit_2.98.bb} (97%)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.97.bb b/meta/recipes-core/sysvinit/sysvinit_2.98.bb
similarity index 97%
rename from meta/recipes-core/sysvinit/sysvinit_2.97.bb
rename to meta/recipes-core/sysvinit/sysvinit_2.98.bb
index 98916f7f19..fd39c61fb5 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.97.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.98.bb
@@ -21,7 +21,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
            file://bootlogd.init \
            file://01_bootlogd \
            "
-SRC_URI[sha256sum] = "2d5996857519bfd8634d2e1debabb3238fb38440f65fbfdc46420ee8bdf25110"
+SRC_URI[sha256sum] = "7b2c3ffaf19eaf1ca80268762f85f9e4eb8e3c973213d49f9802605b72caa7dc"
 
 S = "${WORKDIR}/sysvinit-${PV}"
 
-- 
2.17.1


--===============9092553140728514769==--
