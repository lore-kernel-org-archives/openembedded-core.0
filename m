Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.920.1608060223504384752
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id BC60638C1693
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 19:23:45 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xserver-xorg: upgrading to 1.20.10 SUCCEEDED
Message-ID: <MADEUP.1650FA4182FAA466.1152@lists.openembedded.org>
X-Groupsio-MsgNum: 145712
Content-Type: multipart/mixed; boundary="===============2132755250245991764=="

--===============2132755250245991764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xserver-xorg* to *1.20.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xserver-xorg-upgrade-1.20.9-1.20.10.patch
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

--===============2132755250245991764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 1451 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (805 cached, 2 parsed). 1413 targets, 41 skipped, 0 masked, 0 errors.
Removing 118 recipes from the core2-32 sysroot...done.
Removing 123 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-8ad132bccd9a63e467943597d137231d14b3b69c"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8ad132bccd9a63e467943597d137231d14b3b69c"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 616 Found 548 Missed 68 Current 212 (88% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 213 of 828 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 220 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/os-release/os-release.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from c75b52a47ebbc6faa045e2ae3fc35eb6727940ec35f372a58438339d8ca7b6c8 to 7d4b4e29deb2bdb7e05b8945b484a6388494c7eb35be71e5ff37f6a7efa1ee32. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/os-release/os-release.bb:do_compile, the basehash value changed from ecff77b3e7e75245fab3613e214d22cc7151cb2b45f15cd50f4ec7a9590de53b to 78af3b5252e89bd7061e8dd9476487f7d8503b0fec8a6b82154c21d83a26fdff. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake os-release -cdo_compile -Snone
ERROR: Then:
ERROR: $ bitbake os-release -cdo_compile -Sprintdiff

NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe os-release-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 264 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 265 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 267 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 268 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 269 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 270 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 271 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 274 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 275 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe os-release-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 278 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 280 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 285 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_package_write_rpm_setscene)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 287 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 293 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 297 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 304 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 305 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 306 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 307 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 308 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 309 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 311 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 314 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 315 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 316 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 318 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 319 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 320 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 321 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 322 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 323 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 324 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 325 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 327 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 329 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 331 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 333 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 335 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 336 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 337 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 338 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 339 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 340 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 341 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 342 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 343 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 354 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 355 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 371 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 385 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 387 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 395 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 397 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 398 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 399 of 828 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 400 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 401 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 402 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 403 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 404 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 405 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 406 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 407 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 411 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 412 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 416 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 419 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 420 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 421 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_package_write_rpm_setscene)
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 434 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 436 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 443 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 444 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 445 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package_write_rpm_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 454 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 456 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 463 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 464 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 472 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 477 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 481 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 482 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 484 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 485 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: Running setscene task 486 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 487 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 496 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 497 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 500 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 503 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 508 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_20.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 520 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 522 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 528 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 687 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_fetch)
NOTE: Running task 688 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 689 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 692 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: Running task 693 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_fetch)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 737 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 777 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 787 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_write_config)
NOTE: Running task 797 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_fetch)
NOTE: Running task 843 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_fetch)
NOTE: Running task 889 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_fetch)
NOTE: Running task 890 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_fetch)
NOTE: Running task 891 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_fetch)
NOTE: Running task 892 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_fetch)
NOTE: Running task 907 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: Running setscene task 542 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 938 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_20.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 976 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: Running setscene task 545 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe libinput-1.16.4-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 997 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_write_config: Started
NOTE: Running task 1037 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_unpack)
NOTE: recipe libinput-1.16.4-r0: task do_fetch: Succeeded
NOTE: Running task 1061 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_unpack)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_fetch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Started
NOTE: recipe libevdev-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 1076 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_unpack)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_fetch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Succeeded
NOTE: Running task 1091 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Started
NOTE: Running task 1112 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_write_config: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Started
NOTE: Running task 1124 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_fetch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1133 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
NOTE: Running task 1138 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_unpack)
NOTE: Running task 1139 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_unpack)
NOTE: Running task 1140 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_unpack)
NOTE: Running task 1141 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_unpack)
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 557 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_packagedata_setscene)
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Started
NOTE: Running task 1151 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: recipe libevdev-1.10.0-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: Running task 1152 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_patch)
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 564 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Started
NOTE: Running setscene task 565 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 566 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 567 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 568 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 569 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe libinput-1.16.4-r0: task do_unpack: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: Running task 1158 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1159 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1160 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: Running task 1161 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_patch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1162 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 1163 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_patch)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1168 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: recipe xkbcomp-1.4.4-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1169 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_patch)
NOTE: recipe mesa-2_20.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1170 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_patch)
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 1175 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_patch)
NOTE: recipe xkbcomp-1.4.4-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 575 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 576 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Succeeded
NOTE: Running setscene task 579 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 580 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1176 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libinput-1.16.4-r0: task do_unpack: Succeeded
NOTE: Running task 1177 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1178 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 583 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1179 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.10.0-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1180 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 585 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 586 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_patch: Started
NOTE: Running task 1186 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_patch: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 1187 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1188 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1189 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Succeeded
NOTE: Running task 1194 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1195 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1200 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 589 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 592 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: Running task 1201 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 595 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_patch: Succeeded
NOTE: Running task 1206 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 599 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 601 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 607 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libinput-1.16.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 613 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 614 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 615 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_unpack: Succeeded
NOTE: Running task 1240 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_patch)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_patch: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 621 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 623 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 625 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 627 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 631 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 642 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 643 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from c75b52a47ebbc6faa045e2ae3fc35eb6727940ec35f372a58438339d8ca7b6c8 to 7d4b4e29deb2bdb7e05b8945b484a6388494c7eb35be71e5ff37f6a7efa1ee32. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from c75b52a47ebbc6faa045e2ae3fc35eb6727940ec35f372a58438339d8ca7b6c8 to 7d4b4e29deb2bdb7e05b8945b484a6388494c7eb35be71e5ff37f6a7efa1ee32. The metadata is not deterministic and this needs to be fixed.
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: recipe libcap-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1255 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1256 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_lic)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 650 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 653 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 654 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 656 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 657 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_lic: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 662 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 664 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 666 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_deploy_source_date_epoch_setscene)
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from c75b52a47ebbc6faa045e2ae3fc35eb6727940ec35f372a58438339d8ca7b6c8 to 7d4b4e29deb2bdb7e05b8945b484a6388494c7eb35be71e5ff37f6a7efa1ee32. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_lic: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_lic unihash changed to b0ead48b77c6bdf68c926741b361e6bb8fc35fbf7a721333f95fe157aaa19034
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 668 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 669 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 670 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 673 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 680 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 683 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 685 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 688 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 690 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 695 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 702 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 705 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 707 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 709 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 711 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 712 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 719 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 723 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 726 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 728 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 729 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 730 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 731 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 734 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 744 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 746 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 747 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 749 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 750 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 751 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 752 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 755 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 757 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 758 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 760 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 764 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 767 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 768 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 769 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 771 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 772 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 774 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 776 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 779 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 780 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 783 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 784 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 785 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 786 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 787 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 789 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 791 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 793 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 794 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 797 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 798 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 801 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 802 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 803 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 805 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 807 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 809 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 810 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 811 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 813 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 814 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 820 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 821 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 822 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 825 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 827 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1952 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1953 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1954 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1973 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2067 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2223 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2224 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2457 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_configure)
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2458 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: Running task 2459 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2460 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: Running task 2461 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2462 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe libevdev-1.10.0-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Started
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2463 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Succeeded
NOTE: Running task 2464 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_compile)
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Succeeded
NOTE: Running task 2465 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_install)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Succeeded
NOTE: Running task 2466 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Succeeded
NOTE: Running task 2467 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Succeeded
NOTE: Running task 2468 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 2469 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2470 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_compile)
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2471 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2472 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Succeeded
NOTE: Running task 2473 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 2474 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 2475 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 2476 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2477 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2478 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2479 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 2480 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2481 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2482 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Succeeded
NOTE: Running task 2483 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_packagedata)
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 2484 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe libevdev-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2485 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_compile)
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.10.0-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2486 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package_write_rpm)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2487 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 2488 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2489 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2490 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2491 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2492 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2493 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_install)
NOTE: recipe xkbcomp-1.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2494 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_configure)
NOTE: recipe libevdev-1.10.0-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 2495 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 2496 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_package)
NOTE: recipe libevdev-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.10.0-r0: task do_package: Started
NOTE: recipe libevdev-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2497 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2498 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2499 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 2500 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_packagedata)
NOTE: recipe libevdev-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2501 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_package_write_rpm)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2502 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libevdev-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2503 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2504 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libevdev-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2505 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2506 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2507 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe libinput-1.16.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: Running task 2508 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_configure)
NOTE: recipe libinput-1.16.4-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2509 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 2510 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2511 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_compile)
NOTE: recipe xkbcomp-1.4.4-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 2512 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2513 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2514 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2515 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package_write_rpm)
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2516 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_configure)
NOTE: Running task 2517 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_configure)
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2518 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_install)
NOTE: recipe xkbcomp-1.4.4-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_configure: Succeeded
NOTE: Running task 2519 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_configure_ptest_base)
NOTE: recipe xkbcomp-1.4.4-r0: task do_install: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 2520 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_package)
NOTE: recipe xkbcomp-1.4.4-r0: task do_package: Started
NOTE: recipe libinput-1.16.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2521 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_compile)
NOTE: recipe libinput-1.16.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2522 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2523 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package_write_rpm)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_package: Succeeded
NOTE: Running task 2524 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.4-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2525 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.4-r0: task do_package_write_rpm: Started
NOTE: recipe libinput-1.16.4-r0: task do_compile: Succeeded
NOTE: Running task 2526 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.16.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2527 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_install)
NOTE: recipe libinput-1.16.4-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_install: Succeeded
NOTE: Running task 2528 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_install_ptest_base)
NOTE: recipe libinput-1.16.4-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2529 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_package)
NOTE: Running task 2530 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_populate_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_package: Started
NOTE: recipe libinput-1.16.4-r0: task do_populate_sysroot: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2531 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_compile)
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2532 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_install)
NOTE: recipe libinput-1.16.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2533 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Started
NOTE: recipe libinput-1.16.4-r0: task do_package: Succeeded
NOTE: Running task 2534 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_packagedata)
NOTE: recipe libinput-1.16.4-r0: task do_packagedata: Started
NOTE: recipe libinput-1.16.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2535 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_package_write_rpm)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_package_write_rpm: Started
NOTE: Running task 2536 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_packagedata)
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2537 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package_write_rpm)
NOTE: Running task 2538 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package_write_rpm)
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Succeeded
NOTE: Running task 2539 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_compile)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Succeeded
NOTE: Running task 2540 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_install)
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Succeeded
NOTE: Running task 2541 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_populate_sysroot)
NOTE: Running task 2542 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_package)
NOTE: recipe libxfont2-2.0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2543 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2544 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_configure)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package: Succeeded
NOTE: Running task 2545 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.4-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2546 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_package_write_rpm)
NOTE: recipe libxfont2-2.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_configure: Succeeded
NOTE: Running task 2547 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_compile)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_compile: Succeeded
NOTE: Running task 2548 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_install)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_install: Succeeded
NOTE: Running task 2549 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_package)
NOTE: Running task 2550 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2551 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2552 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package: Succeeded
NOTE: Running task 2553 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_configure: Succeeded
NOTE: Running task 2554 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_compile: Succeeded
NOTE: Running task 2555 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_install: Succeeded
NOTE: Running task 2556 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_package)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_package: Succeeded
NOTE: Running task 2557 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2558 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_package_write_rpm)
NOTE: Running task 2559 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_package_write_rpm)
NOTE: Running task 2560 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package_qa: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2561 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_build)
NOTE: Tasks Summary: Attempted 2561 tasks of which 2391 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 33 ERROR messages shown, returning a non-zero exit code.

--===============2132755250245991764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xserver-xorg: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg: SRC_URI changed from "https://www.x.org/releases//individual/xserver/xorg-server-1.20.9.tar.bz2 file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch file://pkgconfig.patch file://0001-test-xtest-Initialize-array-with-braces.patch file://sdksyms-no-build-path.patch file://0001-drmmode_display.c-add-missing-mi.h-include.patch file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch" to "https://www.x.org/releases//individual/xserver/xorg-server-1.20.10.tar.bz2 file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch file://pkgconfig.patch file://0001-test-xtest-Initialize-array-with-braces.patch file://sdksyms-no-build-path.patch file://0001-drmmode_display.c-add-missing-mi.h-include.patch file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch"
packages/core2-32-poky-linux/xserver-xorg: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xf86-video-modesetting: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xf86-video-modesetting: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-dbg: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGSIZE changed from 36926524 to 36961012 (+0%)
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-dev: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-dev: PKGSIZE changed from 1171390 to 1171393 (+0%)
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-dev: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-doc: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-doc: PKGSIZE changed from 133656 to 133665 (+0%)
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-doc: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PKGSIZE changed from 315280 to 319376 (+1%)
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-record: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-record: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-fbdev: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-fbdev: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-locale: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-locale: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-exa: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-exa: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-sdl: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-sdl: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-src: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-src: PKGSIZE changed from 12325085 to 12331562 (+0%)
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-src: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-staticdev: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-staticdev: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-utils: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-utils: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-xephyr: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-xephyr: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-xvfb: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-xvfb: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-xwayland: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-xwayland: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg: PKGSIZE changed from 2993333 to 2997429 (+0%)
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg: PKGV changed from 1.20.9 [default] to 1.20.10 [default]

--===============2132755250245991764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 1452 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (805 cached, 2 parsed). 1413 targets, 49 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.2+snapshot-8ad132bccd9a63e467943597d137231d14b3b69c"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8ad132bccd9a63e467943597d137231d14b3b69c"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 83 Found 16 Missed 67 Current 734 (19% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 755 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 789 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 801 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 815 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 817 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1313 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_fetch)
NOTE: Running task 1314 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1315 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 1322 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: Running task 1324 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_fetch)
NOTE: Running task 1409 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: Running task 1484 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: Running task 1515 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_write_config)
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1528 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_fetch)
NOTE: recipe libevdev-1.10.0-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: recipe libinput-1.16.4-r0: task do_fetch: Started
NOTE: recipe libevdev-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: Running task 1596 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_unpack)
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1597 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1598 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 1599 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 1600 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: Running task 1601 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_fetch: Succeeded
NOTE: Running task 1602 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1603 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_unpack)
NOTE: Running task 1604 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1626 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_fetch)
NOTE: Running task 1637 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe libinput-1.16.4-r0: task do_write_config: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1723 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: Running task 1725 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1742 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_unpack)
NOTE: recipe libevdev-1.10.0-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe libevdev-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.16.4-r0: task do_write_config: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.16.4-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1857 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_fetch)
NOTE: Running task 1858 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_fetch)
NOTE: Running task 1859 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_fetch)
NOTE: Running task 1860 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_fetch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: Running task 1896 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_fetch)
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1917 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: Running task 1930 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: Running task 1945 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: Running task 1977 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 2067 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_fetch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Succeeded
NOTE: Running task 2177 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_unpack)
NOTE: Running task 2178 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_fetch: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: Running task 2191 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 2192 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_unpack)
NOTE: recipe xkbcomp-1.4.4-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe libevdev-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 2211 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_unpack)
NOTE: Running task 2212 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_unpack)
NOTE: Running task 2213 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: Running task 2214 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_patch)
NOTE: Running task 2219 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_unpack)
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 2281 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_patch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libinput-1.16.4-r0: task do_unpack: Succeeded
NOTE: Running task 2364 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_unpack: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_unpack: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2415 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_patch)
NOTE: recipe libevdev-1.10.0-r0: task do_patch: Started
NOTE: Running task 2416 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 2417 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_patch)
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 2418 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_unpack: Succeeded
NOTE: Running task 2419 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2420 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_patch)
NOTE: Running task 2421 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2422 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_patch: Started
NOTE: Running task 2423 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: Running task 2424 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2425 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2426 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libinput-1.16.4-r0: task do_patch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Succeeded
NOTE: Running task 2427 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_patch: Started
NOTE: Running task 2428 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2429 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Succeeded
NOTE: Running task 2430 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libinput-1.16.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2431 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_patch: Succeeded
NOTE: Running task 2432 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: Running task 2433 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.4-r0: task do_patch: Succeeded
NOTE: Running task 2434 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2435 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe libevdev-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2436 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2437 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2438 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_configure)
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.16.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe libevdev-1.10.0-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2439 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_configure)
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Succeeded
NOTE: Running task 2440 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_compile)
NOTE: recipe xkbcomp-1.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Succeeded
NOTE: Running task 2441 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_install)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_unpack: Succeeded
NOTE: Running task 2442 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Succeeded
NOTE: Running task 2443 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_patch: Succeeded
NOTE: Running task 2444 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2445 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_lic)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_lic: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_lic unihash changed to b0ead48b77c6bdf68c926741b361e6bb8fc35fbf7a721333f95fe157aaa19034
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Succeeded
NOTE: Running task 2446 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Succeeded
NOTE: Running task 2447 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 2448 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 2449 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2450 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2451 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2452 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 2453 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 2454 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2455 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package)
NOTE: Running task 2456 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2457 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2458 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 2459 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2460 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2461 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 2462 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2463 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_packagedata)
NOTE: Running task 2464 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_compile)
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.10.0-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2465 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package_write_rpm)
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 2466 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2467 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2468 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2469 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2470 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package_write_rpm)
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2471 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2472 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_configure)
NOTE: recipe xkbcomp-1.4.4-r0: task do_configure: Started
NOTE: recipe libevdev-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2473 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_install)
NOTE: recipe libevdev-1.10.0-r0: task do_install: Started
NOTE: recipe libevdev-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 2474 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 2475 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_package)
NOTE: recipe libevdev-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.10.0-r0: task do_package: Started
NOTE: recipe libevdev-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2476 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2477 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2478 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 2479 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_packagedata)
NOTE: recipe libevdev-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2480 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_package_write_rpm)
NOTE: recipe libevdev-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe libevdev-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2481 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2482 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2483 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2484 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2485 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libinput-1.16.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2486 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2487 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe xkbcomp-1.4.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2488 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 2489 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe libinput-1.16.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2490 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_configure)
NOTE: recipe libinput-1.16.4-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2491 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2492 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2493 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_install)
NOTE: recipe xkbcomp-1.4.4-r0: task do_install: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2494 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_configure)
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2495 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_configure)
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 2496 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.4-r0: task do_install: Succeeded
NOTE: Running task 2497 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2498 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package_write_rpm)
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm: Started
NOTE: recipe libinput-1.16.4-r0: task do_configure: Succeeded
NOTE: Running task 2499 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_configure_ptest_base)
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2500 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2501 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe libinput-1.16.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2502 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package_write_rpm)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_package: Succeeded
NOTE: Running task 2503 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.4-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2504 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.4-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_compile: Succeeded
NOTE: Running task 2505 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.16.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2506 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_install)
NOTE: recipe libinput-1.16.4-r0: task do_install: Started
NOTE: recipe libinput-1.16.4-r0: task do_install: Succeeded
NOTE: Running task 2507 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_install_ptest_base)
NOTE: recipe libinput-1.16.4-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2508 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_package)
NOTE: Running task 2509 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_populate_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_package: Started
NOTE: recipe libinput-1.16.4-r0: task do_populate_sysroot: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2510 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_compile)
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Started
NOTE: recipe libinput-1.16.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2511 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_install)
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2512 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Started
NOTE: recipe libinput-1.16.4-r0: task do_package: Succeeded
NOTE: Running task 2513 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_packagedata)
NOTE: recipe libinput-1.16.4-r0: task do_packagedata: Started
NOTE: recipe libinput-1.16.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2514 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_package_write_rpm)
NOTE: recipe libinput-1.16.4-r0: task do_package_write_rpm: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2515 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_packagedata)
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2516 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package_write_rpm)
NOTE: Running task 2517 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package_write_rpm)
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Started
NOTE: Running task 2518 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Succeeded
NOTE: Running task 2519 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_install)
NOTE: recipe libinput-1.16.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Succeeded
NOTE: Running task 2520 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_populate_sysroot)
NOTE: Running task 2521 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_package)
NOTE: recipe libxfont2-2.0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2522 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2523 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_configure)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package: Succeeded
NOTE: Running task 2524 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.4-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2525 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_package_write_rpm)
NOTE: recipe libxfont2-2.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_configure: Succeeded
NOTE: Running task 2526 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_compile)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_compile: Succeeded
NOTE: Running task 2527 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_install)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_install: Succeeded
NOTE: Running task 2528 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_package)
NOTE: Running task 2529 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2530 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2531 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package: Succeeded
NOTE: Running task 2532 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_configure: Succeeded
NOTE: Running task 2533 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_compile: Succeeded
NOTE: Running task 2534 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_install: Succeeded
NOTE: Running task 2535 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_package)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_package: Succeeded
NOTE: Running task 2536 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2537 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_package_write_rpm)
NOTE: Running task 2538 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_package_write_rpm)
NOTE: Running task 2539 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package_qa: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2540 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_build)
NOTE: Tasks Summary: Attempted 2540 tasks of which 2370 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============2132755250245991764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 1452 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (805 cached, 2 parsed). 1413 targets, 57 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.2+snapshot-8ad132bccd9a63e467943597d137231d14b3b69c"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8ad132bccd9a63e467943597d137231d14b3b69c"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 83 Found 16 Missed 67 Current 734 (19% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 755 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 789 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 801 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 815 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 817 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1313 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 1314 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_fetch)
NOTE: Running task 1315 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1322 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: Running task 1324 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_fetch)
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1445 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: Running task 1527 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe libevdev-1.10.0-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: Running task 1575 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_write_config)
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: Running task 1589 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_fetch)
NOTE: recipe libinput-1.16.4-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 1612 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 1613 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 1614 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_unpack)
NOTE: Running task 1615 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1616 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: Running task 1617 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_fetch: Succeeded
NOTE: Running task 1618 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1619 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_unpack)
NOTE: Running task 1620 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: Running task 1698 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_fetch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1715 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: Running task 1721 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: recipe libinput-1.16.4-r0: task do_write_config: Started
NOTE: Running task 1725 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe libevdev-1.10.0-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: Running task 1733 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_unpack)
NOTE: recipe libevdev-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.16.4-r0: task do_write_config: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1826 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: Running task 1858 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_fetch)
NOTE: recipe libinput-1.16.4-r0: task do_unpack: Started
NOTE: Running task 1859 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_fetch)
NOTE: Running task 1860 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: Running task 1861 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_fetch)
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1862 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_fetch)
NOTE: Running task 1864 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1892 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_fetch)
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_fetch: Succeeded
NOTE: Running task 1925 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1987 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2044 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 2069 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_patch)
NOTE: recipe xkbcomp-1.4.4-r0: task do_fetch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 2081 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_unpack)
NOTE: Running task 2082 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: Running task 2083 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_patch)
NOTE: Running task 2084 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_unpack)
NOTE: Running task 2085 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.4-r0: task do_fetch: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_fetch: Started
NOTE: Running task 2086 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_unpack)
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_fetch: Succeeded
NOTE: Running task 2103 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_unpack)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_unpack: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_unpack: Succeeded
NOTE: Running task 2162 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_unpack)
NOTE: Running task 2174 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_unpack: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_unpack: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: Running task 2415 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_patch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 2416 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_patch)
NOTE: Running task 2417 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2418 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_patch)
NOTE: Running task 2419 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2420 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_unpack: Succeeded
NOTE: Running task 2421 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_patch)
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2422 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_patch)
NOTE: recipe libinput-1.16.4-r0: task do_patch: Started
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 2423 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2424 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 2425 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Succeeded
NOTE: Running task 2426 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_patch: Started
NOTE: recipe libinput-1.16.4-r0: task do_patch: Succeeded
NOTE: Running task 2427 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libevdev-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2428 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Succeeded
NOTE: Running task 2429 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2430 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2431 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2432 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: recipe xkbcomp-1.4.4-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2433 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2434 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_patch: Succeeded
NOTE: Running task 2435 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe libevdev-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2436 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_configure)
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Succeeded
NOTE: Running task 2437 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.16.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe libevdev-1.10.0-r0: task do_configure: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2438 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_configure)
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2439 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_configure)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Succeeded
NOTE: Running task 2440 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_compile)
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Succeeded
NOTE: Running task 2441 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_install)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_unpack: Succeeded
NOTE: Running task 2442 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Succeeded
NOTE: Running task 2443 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_patch: Succeeded
NOTE: Running task 2444 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2445 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_lic)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_lic: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_lic unihash changed to b0ead48b77c6bdf68c926741b361e6bb8fc35fbf7a721333f95fe157aaa19034
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Succeeded
NOTE: Running task 2446 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Succeeded
NOTE: Running task 2447 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 2448 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2449 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 2450 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2451 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2452 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 2453 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 2454 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Succeeded
NOTE: Running task 2455 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package)
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2456 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2457 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2458 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 2459 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2460 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2461 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Succeeded
NOTE: Running task 2462 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_packagedata)
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 2463 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe libevdev-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2464 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.10.0-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2465 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package_write_rpm)
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 2466 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2467 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2468 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package_write_rpm)
NOTE: recipe mtdev-1.1.6-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2469 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2470 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2471 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2472 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.10.0-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2473 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_configure)
NOTE: recipe xkbcomp-1.4.4-r0: task do_configure: Started
NOTE: recipe libevdev-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 2474 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 2475 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_package)
NOTE: recipe libevdev-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.10.0-r0: task do_package: Started
NOTE: recipe libevdev-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2476 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2477 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libevdev-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 2478 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_packagedata)
NOTE: recipe libevdev-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2479 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_package_write_rpm)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2480 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe libevdev-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe libevdev-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2481 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2482 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2483 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2484 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2485 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2486 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2487 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe libinput-1.16.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2488 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 2489 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2490 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2491 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.16.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2492 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_configure)
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2493 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_configure)
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2494 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_configure)
NOTE: recipe libinput-1.16.4-r0: task do_configure: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2495 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_install)
NOTE: recipe xkbcomp-1.4.4-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_install: Succeeded
NOTE: Running task 2496 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_package)
NOTE: recipe xkbcomp-1.4.4-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 2497 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2498 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package_write_rpm)
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2499 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2500 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package_write_rpm)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe libinput-1.16.4-r0: task do_configure: Succeeded
NOTE: Running task 2501 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.16.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2502 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_compile)
NOTE: recipe xkbcomp-1.4.4-r0: task do_package: Succeeded
NOTE: Running task 2503 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2504 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.4-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2505 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_compile)
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Started
NOTE: recipe libinput-1.16.4-r0: task do_compile: Succeeded
NOTE: Running task 2506 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.16.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2507 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_install)
NOTE: recipe libinput-1.16.4-r0: task do_install: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2508 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_install)
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2509 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Started
NOTE: recipe libinput-1.16.4-r0: task do_install: Succeeded
NOTE: Running task 2510 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_install_ptest_base)
NOTE: recipe libinput-1.16.4-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2511 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_package)
NOTE: Running task 2512 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_populate_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_package: Started
NOTE: recipe libinput-1.16.4-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.16.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Succeeded
NOTE: Running task 2513 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_compile)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2514 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2515 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package_write_rpm)
NOTE: Running task 2516 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package_write_rpm)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_package: Succeeded
NOTE: Running task 2517 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_packagedata)
NOTE: recipe libinput-1.16.4-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Succeeded
NOTE: Running task 2518 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_install)
NOTE: recipe libinput-1.16.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2519 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_package_write_rpm)
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Started
NOTE: recipe libinput-1.16.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Succeeded
NOTE: Running task 2520 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_populate_sysroot)
NOTE: Running task 2521 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_package)
NOTE: recipe libxfont2-2.0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2522 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2523 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_configure)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_configure: Started
NOTE: recipe libinput-1.16.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_package: Succeeded
NOTE: Running task 2524 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.4-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2525 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_package_write_rpm)
NOTE: recipe libxfont2-2.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_configure: Succeeded
NOTE: Running task 2526 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_compile)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_compile: Succeeded
NOTE: Running task 2527 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_install)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_install: Succeeded
NOTE: Running task 2528 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_package)
NOTE: Running task 2529 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2530 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2531 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package: Succeeded
NOTE: Running task 2532 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_configure: Succeeded
NOTE: Running task 2533 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_compile: Succeeded
NOTE: Running task 2534 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_install: Succeeded
NOTE: Running task 2535 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_package)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_package: Succeeded
NOTE: Running task 2536 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2537 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_package_write_rpm)
NOTE: Running task 2538 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_package_write_rpm)
NOTE: Running task 2539 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package_qa: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2540 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_build)
NOTE: Tasks Summary: Attempted 2540 tasks of which 2370 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============2132755250245991764==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-xserver-xorg-upgrade-1.20.9-1.20.10.patch"

From 7e951046da32dd9e384db478f37087d29c350ec5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 15 Dec 2020 14:30:29 +0000
Subject: [PATCH] xserver-xorg: upgrade 1.20.9 -> 1.20.10

---
 .../{xserver-xorg_1.20.9.bb => xserver-xorg_1.20.10.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.9.bb => xserver-xorg_1.20.10.bb} (93%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.9.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
similarity index 93%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.9.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
index c83e43ed99..5c6dbac4d7 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.9.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
@@ -8,7 +8,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch \
            "
-SRC_URI[sha256sum] = "e219f2e0dfe455467939149d7cd2ee53b79b512cc1d2094ae4f5c9ed9ccd3571"
+SRC_URI[sha256sum] = "977420c082450dc808de301ef56af4856d653eea71519a973c3490a780cb7c99"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.17.1


--===============2132755250245991764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 1452 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (805 cached, 2 parsed). 1413 targets, 66 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.2+snapshot-8ad132bccd9a63e467943597d137231d14b3b69c"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8ad132bccd9a63e467943597d137231d14b3b69c"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 83 Found 16 Missed 67 Current 734 (19% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 755 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 789 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 801 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 815 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 817 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1313 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_fetch)
NOTE: Running task 1314 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1315 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 1322 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: Running task 1324 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_fetch)
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1445 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: Running task 1527 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: recipe libevdev-1.10.0-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: Running task 1575 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_write_config)
NOTE: recipe libinput-1.16.4-r0: task do_fetch: Started
NOTE: recipe libevdev-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 1589 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_fetch)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: Running task 1596 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_unpack)
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1597 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 1598 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 1599 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1600 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: Running task 1601 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_fetch: Succeeded
NOTE: Running task 1602 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_unpack)
NOTE: Running task 1603 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1604 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: Running task 1605 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_write_config: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Started
NOTE: recipe libevdev-1.10.0-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe libevdev-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.16.4-r0: task do_unpack: Started
NOTE: recipe libinput-1.16.4-r0: task do_write_config: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1611 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: Running task 1612 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: Running task 1626 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: Running task 1627 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: Running task 1678 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_unpack)
NOTE: Running task 1704 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_fetch)
NOTE: Running task 1729 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: Running task 1860 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_fetch)
NOTE: Running task 1861 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_fetch)
NOTE: Running task 1862 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_fetch)
NOTE: Running task 1863 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_fetch)
NOTE: Running task 1892 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_fetch)
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Started
NOTE: recipe libevdev-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 1922 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 2017 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2029 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_fetch: Succeeded
NOTE: Running task 2044 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_unpack)
NOTE: recipe libinput-1.16.4-r0: task do_unpack: Succeeded
NOTE: Running task 2056 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_patch)
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_fetch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_patch: Started
NOTE: Running task 2152 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_unpack)
NOTE: Running task 2153 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 2154 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_patch)
NOTE: Running task 2161 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2162 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_unpack)
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 2170 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2193 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_unpack)
NOTE: Running task 2194 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_unpack)
NOTE: Running task 2195 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_fetch: Succeeded
NOTE: Running task 2196 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_unpack)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_patch: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_unpack: Started
NOTE: recipe libevdev-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_unpack: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_unpack: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Succeeded
NOTE: Running task 2417 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_patch)
NOTE: Running task 2418 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_patch)
NOTE: recipe libevdev-1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 2419 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: Running task 2420 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libinput-1.16.4-r0: task do_patch: Succeeded
NOTE: Running task 2421 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_deploy_source_date_epoch)
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2422 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_patch)
NOTE: Running task 2423 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2424 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_unpack: Succeeded
NOTE: Running task 2425 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_patch)
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Succeeded
NOTE: Running task 2426 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2427 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: recipe libevdev-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_patch: Started
NOTE: Running task 2428 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.16.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2429 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe libevdev-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2430 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_configure)
NOTE: Running task 2431 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_patch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Succeeded
NOTE: Running task 2432 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2433 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2434 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_patch: Succeeded
NOTE: Running task 2435 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Succeeded
NOTE: Running task 2436 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: Running task 2437 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe xkbcomp-1.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2438 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_configure)
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2439 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_configure)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Succeeded
NOTE: Running task 2440 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_compile)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Succeeded
NOTE: Running task 2441 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_install)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_unpack: Succeeded
NOTE: Running task 2442 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Succeeded
NOTE: Running task 2443 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_patch: Succeeded
NOTE: Running task 2444 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2445 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_lic)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_lic: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_lic unihash changed to b0ead48b77c6bdf68c926741b361e6bb8fc35fbf7a721333f95fe157aaa19034
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Succeeded
NOTE: Running task 2446 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Succeeded
NOTE: Running task 2447 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 2448 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2449 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 2450 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2451 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 2452 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 2453 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2454 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Succeeded
NOTE: Running task 2455 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package)
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2456 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2457 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2458 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 2459 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2460 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2461 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 2462 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Succeeded
NOTE: Running task 2463 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_packagedata)
NOTE: recipe libevdev-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2464 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_compile)
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2465 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package_write_rpm)
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 2466 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2467 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2468 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2469 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2470 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2471 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2472 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_install)
NOTE: recipe xkbcomp-1.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2473 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_configure)
NOTE: recipe libevdev-1.10.0-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_configure: Started
NOTE: recipe libevdev-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 2474 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 2475 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_package)
NOTE: recipe libevdev-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.10.0-r0: task do_package: Started
NOTE: recipe libevdev-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2476 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2477 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2478 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 2479 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_packagedata)
NOTE: recipe libevdev-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2480 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_package_write_rpm)
NOTE: recipe libevdev-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe libevdev-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2481 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2482 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2483 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2484 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2485 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2486 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe xkbcomp-1.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2487 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2488 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2489 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: Running task 2490 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe libinput-1.16.4-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2491 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2492 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 2493 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2494 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_install)
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2495 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_configure)
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2496 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_configure)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2497 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.4-r0: task do_install: Succeeded
NOTE: Running task 2498 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2499 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2500 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package_write_rpm)
NOTE: recipe libinput-1.16.4-r0: task do_configure: Succeeded
NOTE: Running task 2501 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_configure_ptest_base)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe libinput-1.16.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2502 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_compile)
NOTE: recipe libinput-1.16.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_package: Succeeded
NOTE: Running task 2503 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.4-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2504 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.4-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_compile: Succeeded
NOTE: Running task 2505 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.16.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2506 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_install)
NOTE: recipe libinput-1.16.4-r0: task do_install: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2507 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_compile)
NOTE: recipe libinput-1.16.4-r0: task do_install: Succeeded
NOTE: Running task 2508 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_install_ptest_base)
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Started
NOTE: recipe libinput-1.16.4-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2509 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_package)
NOTE: Running task 2510 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_populate_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_package: Started
NOTE: recipe libinput-1.16.4-r0: task do_populate_sysroot: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2511 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_install)
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2512 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Started
NOTE: recipe libinput-1.16.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_package: Succeeded
NOTE: Running task 2513 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_packagedata)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2514 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_packagedata)
NOTE: recipe libinput-1.16.4-r0: task do_packagedata: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2515 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package_write_rpm)
NOTE: Running task 2516 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_package_write_rpm)
NOTE: Running task 2517 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package_write_rpm)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe libinput-1.16.4-r0: task do_package_write_rpm: Started
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Succeeded
NOTE: Running task 2518 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_compile)
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Succeeded
NOTE: Running task 2519 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_install)
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Started
NOTE: recipe libinput-1.16.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Succeeded
NOTE: Running task 2520 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_populate_sysroot)
NOTE: Running task 2521 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_package)
NOTE: recipe libxfont2-2.0.4-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2522 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2523 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_configure)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package: Succeeded
NOTE: Running task 2524 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.4-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2525 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_package_write_rpm)
NOTE: recipe libxfont2-2.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_configure: Succeeded
NOTE: Running task 2526 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_compile)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_compile: Succeeded
NOTE: Running task 2527 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_install)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_install: Succeeded
NOTE: Running task 2528 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_package)
NOTE: Running task 2529 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2530 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2531 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package: Succeeded
NOTE: Running task 2532 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_configure: Succeeded
NOTE: Running task 2533 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_compile: Succeeded
NOTE: Running task 2534 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_install: Succeeded
NOTE: Running task 2535 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_package)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_package: Succeeded
NOTE: Running task 2536 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2537 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_package_write_rpm)
NOTE: Running task 2538 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_package_write_rpm)
NOTE: Running task 2539 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package_qa: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2540 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_build)
NOTE: Tasks Summary: Attempted 2540 tasks of which 2370 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============2132755250245991764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1487 entries from dependency cache.
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
DISTRO_VERSION       = "3.2+snapshot-8ad132bccd9a63e467943597d137231d14b3b69c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8ad132bccd9a63e467943597d137231d14b3b69c"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 84 Found 17 Missed 67 Current 733 (20% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 749 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 755 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 800 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe encodings-1_1.0.5-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.0.5-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 814 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 815 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 817 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1313 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1314 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_fetch)
NOTE: Running task 1315 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 1322 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: Running task 1324 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_fetch)
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1444 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: Running task 1527 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe libevdev-1.10.0-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: Running task 1575 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_write_config)
NOTE: recipe libinput-1.16.4-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 1589 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_fetch)
NOTE: Running task 1596 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: recipe libevdev-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 1597 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1598 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_unpack)
NOTE: Running task 1599 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_fetch: Succeeded
NOTE: Running task 1600 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: Running task 1601 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1602 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_unpack)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: Running task 1614 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 1615 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1698 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: Running task 1699 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_fetch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1771 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: Running task 1772 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_write_config: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.10.0-r0: task do_unpack: Started
NOTE: recipe libevdev-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1805 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_unpack)
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.16.4-r0: task do_unpack: Started
NOTE: Running task 1857 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_fetch)
NOTE: Running task 1858 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_fetch)
NOTE: Running task 1859 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_fetch)
NOTE: Running task 1860 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_fetch)
NOTE: recipe libinput-1.16.4-r0: task do_write_config: Succeeded
NOTE: Running task 1896 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_fetch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_fetch: Started
NOTE: Running task 1961 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: Running task 1989 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_fetch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Started
NOTE: Running task 2075 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_unpack)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Succeeded
NOTE: Running task 2092 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_unpack)
NOTE: Running task 2093 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_fetch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: Running task 2118 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 2130 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_fetch: Started
NOTE: Running task 2131 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_unpack)
NOTE: Running task 2132 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_unpack)
NOTE: Running task 2133 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2151 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: recipe xkbcomp-1.4.4-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: Running task 2152 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_unpack)
NOTE: Running task 2153 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_unpack)
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 2262 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_patch)
NOTE: Running task 2263 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Succeeded
NOTE: Running task 2278 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_patch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_unpack: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_unpack: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Started
NOTE: recipe libevdev-1.10.0-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 2415 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_patch)
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 2416 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2417 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_patch)
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_unpack: Succeeded
NOTE: Running task 2418 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_patch)
NOTE: Running task 2419 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_patch)
NOTE: recipe xkbcomp-1.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2420 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: Running task 2421 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2422 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2423 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 2424 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.16.4-r0: task do_patch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_patch: Started
NOTE: Running task 2425 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 2426 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Succeeded
NOTE: Running task 2427 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.16.4-r0: task do_patch: Succeeded
NOTE: Running task 2428 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2429 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Succeeded
NOTE: Running task 2430 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2431 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_patch: Succeeded
NOTE: Running task 2432 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2433 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: Running task 2434 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe libinput-1.16.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_patch: Succeeded
NOTE: Running task 2435 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2436 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libevdev-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2437 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_configure)
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: Running task 2438 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_configure)
NOTE: recipe libinput-1.16.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2439 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_configure)
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_configure: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Succeeded
NOTE: Running task 2440 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_compile)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Succeeded
NOTE: Running task 2441 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_install)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_unpack: Succeeded
NOTE: Running task 2442 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Succeeded
NOTE: Running task 2443 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_patch: Succeeded
NOTE: Running task 2444 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2445 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_lic)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_lic: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_lic unihash changed to b0ead48b77c6bdf68c926741b361e6bb8fc35fbf7a721333f95fe157aaa19034
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Succeeded
NOTE: Running task 2446 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Succeeded
NOTE: Running task 2447 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 2448 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2449 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_compile)
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2450 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 2451 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2452 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 2453 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 2454 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Succeeded
NOTE: Running task 2455 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package)
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2456 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2457 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2458 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 2459 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2460 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2461 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Succeeded
NOTE: Running task 2462 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_packagedata)
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 2463 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2464 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package_write_rpm)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Started
NOTE: recipe libevdev-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2465 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_compile)
NOTE: recipe libevdev-1.10.0-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2466 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 2467 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2468 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2469 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2470 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2471 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2472 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_configure)
NOTE: recipe xkbcomp-1.4.4-r0: task do_configure: Started
NOTE: recipe libevdev-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2473 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_install)
NOTE: recipe libevdev-1.10.0-r0: task do_install: Started
NOTE: recipe libevdev-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 2474 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 2475 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_package)
NOTE: recipe libevdev-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.10.0-r0: task do_package: Started
NOTE: recipe libevdev-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2476 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2477 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2478 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 2479 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_packagedata)
NOTE: recipe libevdev-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2480 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_package_write_rpm)
NOTE: recipe libevdev-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe libevdev-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2481 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2482 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2483 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2484 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2485 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libinput-1.16.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2486 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2487 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe xkbcomp-1.4.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2488 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 2489 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe libinput-1.16.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2490 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2491 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2492 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2493 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_configure)
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2494 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_configure)
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2495 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_install)
NOTE: Running task 2496 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_install: Succeeded
NOTE: Running task 2497 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_package)
NOTE: recipe xkbcomp-1.4.4-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2498 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package_write_rpm)
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2499 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe libinput-1.16.4-r0: task do_configure: Succeeded
NOTE: Running task 2500 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_configure_ptest_base)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libinput-1.16.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2501 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_compile)
NOTE: recipe libinput-1.16.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2502 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package_write_rpm)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_package: Succeeded
NOTE: Running task 2503 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.4-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2504 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.4-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_compile: Succeeded
NOTE: Running task 2505 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.16.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2506 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_install)
NOTE: recipe libinput-1.16.4-r0: task do_install: Started
NOTE: recipe libinput-1.16.4-r0: task do_install: Succeeded
NOTE: Running task 2507 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_install_ptest_base)
NOTE: recipe libinput-1.16.4-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2508 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_package)
NOTE: Running task 2509 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_populate_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_package: Started
NOTE: recipe libinput-1.16.4-r0: task do_populate_sysroot: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2510 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_compile)
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Started
NOTE: recipe libinput-1.16.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2511 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_install)
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2512 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Started
NOTE: recipe libinput-1.16.4-r0: task do_package: Succeeded
NOTE: Running task 2513 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_packagedata)
NOTE: recipe libinput-1.16.4-r0: task do_packagedata: Started
NOTE: recipe libinput-1.16.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2514 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_package_write_rpm)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2515 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_packagedata)
NOTE: recipe libinput-1.16.4-r0: task do_package_write_rpm: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2516 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package_write_rpm)
NOTE: Running task 2517 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package_write_rpm)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Succeeded
NOTE: Running task 2518 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_compile)
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Succeeded
NOTE: Running task 2519 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_install)
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Succeeded
NOTE: Running task 2520 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_populate_sysroot)
NOTE: Running task 2521 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_package)
NOTE: recipe libinput-1.16.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2522 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2523 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_configure)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package: Succeeded
NOTE: Running task 2524 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.4-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2525 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_package_write_rpm)
NOTE: recipe libxfont2-2.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_configure: Succeeded
NOTE: Running task 2526 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_compile)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_compile: Succeeded
NOTE: Running task 2527 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_install)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_install: Succeeded
NOTE: Running task 2528 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_package)
NOTE: Running task 2529 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2530 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2531 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package: Succeeded
NOTE: Running task 2532 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_configure: Succeeded
NOTE: Running task 2533 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_compile: Succeeded
NOTE: Running task 2534 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_install: Succeeded
NOTE: Running task 2535 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_package)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_package: Succeeded
NOTE: Running task 2536 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2537 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_package_write_rpm)
NOTE: Running task 2538 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_package_write_rpm)
NOTE: Running task 2539 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package_qa: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2540 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_build)
NOTE: Tasks Summary: Attempted 2540 tasks of which 2370 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============2132755250245991764==--
