Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.933.1608060224886778159
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:23:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id C4C8238C13B4
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 19:23:44 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] stress-ng: upgrading to 0.12.00 SUCCEEDED
Message-ID: <MADEUP.1650FA413C9B334C.26179@lists.openembedded.org>
X-Groupsio-MsgNum: 145699
Content-Type: multipart/mixed; boundary="===============4635957495603293797=="

--===============4635957495603293797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *stress-ng* to *0.12.00* has Succeeded.

Next steps:
    - apply the patch: git am 0001-stress-ng-upgrade-0.11.24-0.12.00.patch
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

--===============4635957495603293797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 1438 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (805 cached, 2 parsed). 1413 targets, 41 skipped, 0 masked, 0 errors.
Removing 90 recipes from the core2-32 sysroot...done.
Removing 95 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-27742d63f10e135390d3f747b356421df54dd69a"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:27742d63f10e135390d3f747b356421df54dd69a"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 481 Found 473 Missed 8 Current 191 (98% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 192 of 672 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 193 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 194 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 195 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 196 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 197 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 199 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 200 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 203 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/os-release/os-release.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from c75b52a47ebbc6faa045e2ae3fc35eb6727940ec35f372a58438339d8ca7b6c8 to b22000525908739507db9ad1c7f82b224ca7e143a099d0e863655cf75449e4c3. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_package_write_rpm_setscene: Started
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/os-release/os-release.bb:do_compile, the basehash value changed from ecff77b3e7e75245fab3613e214d22cc7151cb2b45f15cd50f4ec7a9590de53b to 32b6fa4c029642d871419c19cf1fcb9118ba89f2c0cc329410e4c4b960e129d6. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake os-release -cdo_compile -Snone
ERROR: Then:
ERROR: $ bitbake os-release -cdo_compile -Sprintdiff

NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe os-release-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 243 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 244 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 245 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 246 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 247 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 248 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 249 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 250 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 254 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 255 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 257 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 258 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe os-release-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 267 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 270 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 271 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 275 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 276 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 278 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 279 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 280 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 283 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 285 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 286 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 287 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 288 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 290 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 294 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 295 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: recipe openssl-1.1.1h-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 296 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 297 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 299 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 300 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 301 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 302 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 303 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 304 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 305 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 306 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 307 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 310 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 311 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 312 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 313 of 672 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 314 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 317 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 318 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 319 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_package_write_rpm_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 320 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 321 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 322 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 325 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 326 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 329 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 340 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 347 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 352 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 355 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 358 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 368 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 369 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 370 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 372 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 381 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 720 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_fetch)
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 389 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe stress-ng-0.12.00-r0: task do_fetch: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe stress-ng-0.12.00-r0: task do_fetch: Succeeded
NOTE: Running task 943 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_unpack)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 411 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe stress-ng-0.12.00-r0: task do_unpack: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 428 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe stress-ng-0.12.00-r0: task do_unpack: Succeeded
NOTE: Running task 1001 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_patch)
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 437 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_packagedata_setscene)
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe stress-ng-0.12.00-r0: task do_patch: Started
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe stress-ng-0.12.00-r0: task do_patch: Succeeded
NOTE: Running task 1031 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_deploy_source_date_epoch)
NOTE: Running task 1032 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_populate_lic)
NOTE: recipe stress-ng-0.12.00-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_populate_lic: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_populate_lic unihash changed to 4e6c283fc17a99980f68f0d7521bde9162567f761b89025fef08403e65b83c47
NOTE: recipe stress-ng-0.12.00-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 447 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 454 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 463 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 469 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 487 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from c75b52a47ebbc6faa045e2ae3fc35eb6727940ec35f372a58438339d8ca7b6c8 to b22000525908739507db9ad1c7f82b224ca7e143a099d0e863655cf75449e4c3. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 498 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 502 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 513 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 522 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 533 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 542 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 567 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-src went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dbg went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-staticdev went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dev went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-doc went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-locale went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 607 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 614 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 635 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 642 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 647 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 650 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 651 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 656 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 657 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 664 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 669 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 670 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 671 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 672 of 672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1901 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_prepare_recipe_sysroot)
NOTE: recipe stress-ng-0.12.00-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2130 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_configure)
NOTE: recipe stress-ng-0.12.00-r0: task do_configure: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_configure: Succeeded
NOTE: Running task 2131 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_compile)
NOTE: recipe stress-ng-0.12.00-r0: task do_compile: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_compile: Succeeded
NOTE: Running task 2132 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_install)
NOTE: recipe stress-ng-0.12.00-r0: task do_install: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_install: Succeeded
NOTE: Running task 2133 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_package)
NOTE: Running task 2134 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_populate_sysroot)
NOTE: recipe stress-ng-0.12.00-r0: task do_package: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_populate_sysroot: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_populate_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.00-r0: task do_package: Succeeded
NOTE: Running task 2135 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_packagedata)
NOTE: recipe stress-ng-0.12.00-r0: task do_packagedata: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_packagedata: Succeeded
NOTE: Running task 2136 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_package_write_rpm)
NOTE: Running task 2137 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_package_qa)
NOTE: recipe stress-ng-0.12.00-r0: task do_package_write_rpm: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_package_qa: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_package_qa: Succeeded
NOTE: recipe stress-ng-0.12.00-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2138 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_build)
NOTE: Tasks Summary: Attempted 2138 tasks of which 2123 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 22 ERROR messages shown, returning a non-zero exit code.

--===============4635957495603293797==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-stress-ng-upgrade-0.11.24-0.12.00.patch"

From 967c3ddee901676c13a5ff7efaa654d9fadfc947 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 15 Dec 2020 08:59:28 +0000
Subject: [PATCH] stress-ng: upgrade 0.11.24 -> 0.12.00

---
 .../stress-ng/{stress-ng_0.11.24.bb => stress-ng_0.12.00.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.11.24.bb => stress-ng_0.12.00.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.24.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.11.24.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb
index 3516c15451..3b38b39893 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.24.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "5b3a724a85eed48743dedf37eab851b617ecf921b7fff427c6d0bbf405534671"
+SRC_URI[sha256sum] = "b2b738f574671926654b1623103a7aa58ee6911894ac78760ee188c4bfa96fe2"
 
 DEPENDS = "coreutils-native"
 
-- 
2.17.1


--===============4635957495603293797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/stress-ng: PV changed from "0.11.24" to "0.12.00"
packages/core2-32-poky-linux/stress-ng: PKGV changed from 0.11.24 [default] to 0.12.00 [default]
packages/core2-32-poky-linux/stress-ng: SRC_URI changed from "https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.11.24.tar.xz file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch file://no_daddr_t.patch" to "https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.12.00.tar.xz file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch file://no_daddr_t.patch"
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PV changed from "0.11.24" to "0.12.00"
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PKGV changed from 0.11.24 [default] to 0.12.00 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PV changed from "0.11.24" to "0.12.00"
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGSIZE changed from 5618672 to 5657732 (+1%)
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGV changed from 0.11.24 [default] to 0.12.00 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PV changed from "0.11.24" to "0.12.00"
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PKGV changed from 0.11.24 [default] to 0.12.00 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PV changed from "0.11.24" to "0.12.00"
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGSIZE changed from 49701 to 49890 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGV changed from 0.11.24 [default] to 0.12.00 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PV changed from "0.11.24" to "0.12.00"
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PKGV changed from 0.11.24 [default] to 0.12.00 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PV changed from "0.11.24" to "0.12.00"
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGSIZE changed from 2733182 to 2787168 (+2%)
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGV changed from 0.11.24 [default] to 0.12.00 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PV changed from "0.11.24" to "0.12.00"
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PKGV changed from 0.11.24 [default] to 0.12.00 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng: PV changed from "0.11.24" to "0.12.00"
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGSIZE changed from 4081544 to 4097928 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGV changed from 0.11.24 [default] to 0.12.00 [default]

--===============4635957495603293797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 1439 entries from dependency cache.
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
DISTRO_VERSION       = "3.2+snapshot-27742d63f10e135390d3f747b356421df54dd69a"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:27742d63f10e135390d3f747b356421df54dd69a"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 21 Found 14 Missed 7 Current 640 (66% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 647 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 648 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 659 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-src went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dbg went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-staticdev went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dev went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-doc went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-locale went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1450 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_fetch)
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_fetch: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_fetch: Succeeded
NOTE: Running task 1778 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_unpack)
NOTE: Running task 1779 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe stress-ng-0.12.00-r0: task do_unpack: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_unpack: Succeeded
NOTE: Running task 2106 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_patch)
NOTE: recipe stress-ng-0.12.00-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.00-r0: task do_patch: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_patch: Succeeded
NOTE: Running task 2107 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_deploy_source_date_epoch)
NOTE: Running task 2108 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_populate_lic)
NOTE: recipe stress-ng-0.12.00-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_populate_lic: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_populate_lic unihash changed to 4e6c283fc17a99980f68f0d7521bde9162567f761b89025fef08403e65b83c47
NOTE: recipe stress-ng-0.12.00-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2109 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_configure)
NOTE: recipe stress-ng-0.12.00-r0: task do_configure: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_configure: Succeeded
NOTE: Running task 2110 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_compile)
NOTE: recipe stress-ng-0.12.00-r0: task do_compile: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_compile: Succeeded
NOTE: Running task 2111 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_install)
NOTE: recipe stress-ng-0.12.00-r0: task do_install: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_install: Succeeded
NOTE: Running task 2112 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_package)
NOTE: Running task 2113 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_populate_sysroot)
NOTE: recipe stress-ng-0.12.00-r0: task do_package: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_populate_sysroot: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_populate_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.00-r0: task do_package: Succeeded
NOTE: Running task 2114 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_packagedata)
NOTE: recipe stress-ng-0.12.00-r0: task do_packagedata: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_packagedata: Succeeded
NOTE: Running task 2115 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_package_write_rpm)
NOTE: Running task 2116 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_package_qa)
NOTE: recipe stress-ng-0.12.00-r0: task do_package_qa: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_package_write_rpm: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_package_qa: Succeeded
NOTE: recipe stress-ng-0.12.00-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2117 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_build)
NOTE: Tasks Summary: Attempted 2117 tasks of which 2102 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============4635957495603293797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 1439 entries from dependency cache.
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
DISTRO_VERSION       = "3.2+snapshot-27742d63f10e135390d3f747b356421df54dd69a"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:27742d63f10e135390d3f747b356421df54dd69a"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 21 Found 14 Missed 7 Current 640 (66% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 647 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 648 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 659 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-src went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dbg went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-staticdev went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dev went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-doc went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-locale went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1450 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_fetch)
NOTE: Running setscene task 661 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe stress-ng-0.12.00-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_fetch: Succeeded
NOTE: Running task 1756 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_unpack)
NOTE: Running task 1757 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe stress-ng-0.12.00-r0: task do_unpack: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_unpack: Succeeded
NOTE: Running task 2106 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_patch)
NOTE: recipe stress-ng-0.12.00-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.00-r0: task do_patch: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_patch: Succeeded
NOTE: Running task 2107 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_deploy_source_date_epoch)
NOTE: Running task 2108 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_populate_lic)
NOTE: recipe stress-ng-0.12.00-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_populate_lic: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_populate_lic unihash changed to 4e6c283fc17a99980f68f0d7521bde9162567f761b89025fef08403e65b83c47
NOTE: recipe stress-ng-0.12.00-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2109 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_configure)
NOTE: recipe stress-ng-0.12.00-r0: task do_configure: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_configure: Succeeded
NOTE: Running task 2110 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_compile)
NOTE: recipe stress-ng-0.12.00-r0: task do_compile: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_compile: Succeeded
NOTE: Running task 2111 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_install)
NOTE: recipe stress-ng-0.12.00-r0: task do_install: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_install: Succeeded
NOTE: Running task 2112 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_package)
NOTE: Running task 2113 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_populate_sysroot)
NOTE: recipe stress-ng-0.12.00-r0: task do_populate_sysroot: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_package: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_populate_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.00-r0: task do_package: Succeeded
NOTE: Running task 2114 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_packagedata)
NOTE: recipe stress-ng-0.12.00-r0: task do_packagedata: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_packagedata: Succeeded
NOTE: Running task 2115 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_package_write_rpm)
NOTE: Running task 2116 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_package_qa)
NOTE: recipe stress-ng-0.12.00-r0: task do_package_write_rpm: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_package_qa: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_package_qa: Succeeded
NOTE: recipe stress-ng-0.12.00-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2117 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_build)
NOTE: Tasks Summary: Attempted 2117 tasks of which 2102 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============4635957495603293797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 1439 entries from dependency cache.
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
DISTRO_VERSION       = "3.2+snapshot-27742d63f10e135390d3f747b356421df54dd69a"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:27742d63f10e135390d3f747b356421df54dd69a"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 21 Found 14 Missed 7 Current 640 (66% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 647 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 648 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 659 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-src went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dbg went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-staticdev went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dev went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-doc went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-locale went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1450 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_fetch)
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_fetch: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_fetch: Succeeded
NOTE: Running task 1706 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_unpack)
NOTE: Running task 1707 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe stress-ng-0.12.00-r0: task do_unpack: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_unpack: Succeeded
NOTE: Running task 2106 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_patch)
NOTE: recipe stress-ng-0.12.00-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.00-r0: task do_patch: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_patch: Succeeded
NOTE: Running task 2107 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_deploy_source_date_epoch)
NOTE: Running task 2108 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_populate_lic)
NOTE: recipe stress-ng-0.12.00-r0: task do_populate_lic: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_populate_lic unihash changed to 4e6c283fc17a99980f68f0d7521bde9162567f761b89025fef08403e65b83c47
NOTE: recipe stress-ng-0.12.00-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2109 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_configure)
NOTE: recipe stress-ng-0.12.00-r0: task do_configure: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_configure: Succeeded
NOTE: Running task 2110 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_compile)
NOTE: recipe stress-ng-0.12.00-r0: task do_compile: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_compile: Succeeded
NOTE: Running task 2111 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_install)
NOTE: recipe stress-ng-0.12.00-r0: task do_install: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_install: Succeeded
NOTE: Running task 2112 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_package)
NOTE: Running task 2113 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_populate_sysroot)
NOTE: recipe stress-ng-0.12.00-r0: task do_package: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_populate_sysroot: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_populate_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.00-r0: task do_package: Succeeded
NOTE: Running task 2114 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_packagedata)
NOTE: recipe stress-ng-0.12.00-r0: task do_packagedata: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_packagedata: Succeeded
NOTE: Running task 2115 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_package_write_rpm)
NOTE: Running task 2116 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_package_qa)
NOTE: recipe stress-ng-0.12.00-r0: task do_package_write_rpm: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_package_qa: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_package_qa: Succeeded
NOTE: recipe stress-ng-0.12.00-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2117 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_build)
NOTE: Tasks Summary: Attempted 2117 tasks of which 2102 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============4635957495603293797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1467 entries from dependency cache.
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
DISTRO_VERSION       = "3.2+snapshot-27742d63f10e135390d3f747b356421df54dd69a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:27742d63f10e135390d3f747b356421df54dd69a"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 21 Found 14 Missed 7 Current 640 (66% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 647 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 648 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 659 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-src went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dbg went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-staticdev went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dev went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-doc went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-locale went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1450 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_fetch)
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe stress-ng-0.12.00-r0: task do_fetch: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_fetch: Succeeded
NOTE: Running task 1732 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_unpack)
NOTE: Running task 1758 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_prepare_recipe_sysroot)
NOTE: recipe stress-ng-0.12.00-r0: task do_unpack: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_unpack: Succeeded
NOTE: Running task 2106 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_patch)
NOTE: recipe stress-ng-0.12.00-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.00-r0: task do_patch: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_patch: Succeeded
NOTE: Running task 2107 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_deploy_source_date_epoch)
NOTE: Running task 2108 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_populate_lic)
NOTE: recipe stress-ng-0.12.00-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_populate_lic: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_populate_lic unihash changed to 4e6c283fc17a99980f68f0d7521bde9162567f761b89025fef08403e65b83c47
NOTE: recipe stress-ng-0.12.00-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2109 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_configure)
NOTE: recipe stress-ng-0.12.00-r0: task do_configure: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_configure: Succeeded
NOTE: Running task 2110 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_compile)
NOTE: recipe stress-ng-0.12.00-r0: task do_compile: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_compile: Succeeded
NOTE: Running task 2111 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_install)
NOTE: recipe stress-ng-0.12.00-r0: task do_install: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_install: Succeeded
NOTE: Running task 2112 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_package)
NOTE: Running task 2113 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_populate_sysroot)
NOTE: recipe stress-ng-0.12.00-r0: task do_package: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_populate_sysroot: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_populate_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.00-r0: task do_package: Succeeded
NOTE: Running task 2114 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_packagedata)
NOTE: recipe stress-ng-0.12.00-r0: task do_packagedata: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_packagedata: Succeeded
NOTE: Running task 2115 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_package_write_rpm)
NOTE: Running task 2116 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_package_qa)
NOTE: recipe stress-ng-0.12.00-r0: task do_package_write_rpm: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_package_qa: Started
NOTE: recipe stress-ng-0.12.00-r0: task do_package_qa: Succeeded
NOTE: recipe stress-ng-0.12.00-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2117 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb:do_build)
NOTE: Tasks Summary: Attempted 2117 tasks of which 2102 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============4635957495603293797==--
