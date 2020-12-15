Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.920.1608060223504384752
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:23:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 1020838C16E0
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 19:23:47 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] p11-kit: upgrading to 0.23.22 SUCCEEDED
Message-ID: <MADEUP.1650FA4238808D69.26179@lists.openembedded.org>
X-Groupsio-MsgNum: 145741
Content-Type: multipart/mixed; boundary="===============6904408380219124306=="

--===============6904408380219124306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *p11-kit* to *0.23.22* has Succeeded.

Next steps:
    - apply the patch: git am 0001-p11-kit-upgrade-0.23.21-0.23.22.patch
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

--===============6904408380219124306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 1464 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (803 cached, 4 parsed). 1413 targets, 41 skipped, 0 masked, 0 errors.
Removing 96 recipes from the core2-32 sysroot...done.
Removing 99 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-9c83e8077871aa633ef69a0aeb5789aa95116005"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9c83e8077871aa633ef69a0aeb5789aa95116005"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 486 Found 478 Missed 8 Current 191 (98% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 192 of 677 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 193 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 194 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 195 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 196 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 197 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 199 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 200 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 203 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/os-release/os-release.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from c75b52a47ebbc6faa045e2ae3fc35eb6727940ec35f372a58438339d8ca7b6c8 to 7686d9f31c48d282fe14b380ad97ba91c5162a7d00caac537705035db7139c16. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/os-release/os-release.bb:do_compile, the basehash value changed from ecff77b3e7e75245fab3613e214d22cc7151cb2b45f15cd50f4ec7a9590de53b to ae1e9e1e76af2d5d5548dceec1ecb97b5a64ff7e168764099a5a6e4bf5071717. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake os-release -cdo_compile -Snone
ERROR: Then:
ERROR: $ bitbake os-release -cdo_compile -Sprintdiff

NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe os-release-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 243 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 244 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 245 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 246 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 248 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 249 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 251 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 253 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 254 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 255 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 256 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe os-release-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 258 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 259 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 262 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 269 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 270 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 271 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 272 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 273 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 277 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 280 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 281 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 282 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 283 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 285 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 286 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 287 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe openssl-1.1.1h-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 288 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 289 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 290 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 291 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 292 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 293 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 294 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 295 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 296 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 297 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 298 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 299 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 300 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 302 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 304 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 305 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 306 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 307 of 677 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 310 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 311 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 312 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 313 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 314 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 317 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 318 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 325 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 328 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 329 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 330 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 331 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 345 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 346 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 349 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 350 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 354 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 355 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 361 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_packagedata_setscene)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 366 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 372 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 373 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 374 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 384 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 385 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 394 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 720 of 2151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_fetch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 409 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 850 of 2151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_write_config)
NOTE: Running setscene task 410 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe p11-kit-0.23.22-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_fetch: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 972 of 2151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_unpack)
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_write_config: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 422 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe p11-kit-0.23.22-r0: task do_write_config: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe p11-kit-0.23.22-r0: task do_unpack: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 433 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 436 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe p11-kit-0.23.22-r0: task do_unpack: Succeeded
NOTE: Running task 1035 of 2151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_patch)
NOTE: recipe p11-kit-0.23.22-r0: task do_patch: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_patch: Succeeded
NOTE: Running task 1036 of 2151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_deploy_source_date_epoch)
NOTE: Running task 1037 of 2151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_populate_lic)
NOTE: recipe p11-kit-0.23.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_populate_lic: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe p11-kit-0.23.22-r0: task do_populate_lic: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_populate_lic unihash changed to 26a39458ee8abfb1114fc9f6d19673ac3dede97717432ac2d4e5b6ef95210fd3
NOTE: Running setscene task 452 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 459 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 470 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 492 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from c75b52a47ebbc6faa045e2ae3fc35eb6727940ec35f372a58438339d8ca7b6c8 to 7686d9f31c48d282fe14b380ad97ba91c5162a7d00caac537705035db7139c16. The metadata is not deterministic and this needs to be fixed.
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
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 497 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 503 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 527 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 572 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 579 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 589 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_packagedata_setscene)
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 593 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-src went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-dbg went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-staticdev went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-dev went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-doc went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-locale went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-bin went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 622 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 640 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 650 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 651 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 652 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 656 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 662 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 663 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 670 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 671 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 673 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 674 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 677 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1912 of 2151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe p11-kit-0.23.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2143 of 2151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_configure)
NOTE: recipe p11-kit-0.23.22-r0: task do_configure: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_configure: Succeeded
NOTE: Running task 2144 of 2151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_compile)
NOTE: recipe p11-kit-0.23.22-r0: task do_compile: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_compile: Succeeded
NOTE: Running task 2145 of 2151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_install)
NOTE: recipe p11-kit-0.23.22-r0: task do_install: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_install: Succeeded
NOTE: Running task 2146 of 2151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_package)
NOTE: Running task 2147 of 2151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_populate_sysroot)
NOTE: recipe p11-kit-0.23.22-r0: task do_package: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_populate_sysroot: Succeeded
NOTE: recipe p11-kit-0.23.22-r0: task do_package: Succeeded
NOTE: Running task 2148 of 2151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_packagedata)
NOTE: recipe p11-kit-0.23.22-r0: task do_packagedata: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_packagedata: Succeeded
NOTE: Running task 2149 of 2151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_package_write_rpm)
NOTE: Running task 2150 of 2151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_package_qa)
NOTE: recipe p11-kit-0.23.22-r0: task do_package_write_rpm: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_package_qa: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_package_qa: Succeeded
NOTE: recipe p11-kit-0.23.22-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2151 of 2151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_build)
NOTE: Tasks Summary: Attempted 2151 tasks of which 2135 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 23 ERROR messages shown, returning a non-zero exit code.

--===============6904408380219124306==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-p11-kit-upgrade-0.23.21-0.23.22.patch"

From c22a77117485834d3bc2c25b2fb64207dc4659fb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 15 Dec 2020 19:09:25 +0000
Subject: [PATCH] p11-kit: upgrade 0.23.21 -> 0.23.22

---
 .../p11-kit/{p11-kit_0.23.21.bb => p11-kit_0.23.22.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.23.21.bb => p11-kit_0.23.22.bb} (87%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
similarity index 87%
rename from meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
index b1fd2334b2..050ef2f3ed 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
@@ -8,8 +8,8 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
 
 DEPENDS_append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
-SRC_URI = "git://github.com/p11-glue/p11-kit"
-SRCREV = "fd8b56f3ee971f94dc6fc95411fc01e1c12153ab"
+SRC_URI = "git://github.com/p11-glue/p11-kit;branch=0.23"
+SRCREV = "bd97afbfe28d5fbbde95ce36ff7a8834fc0291ee"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
-- 
2.17.1


--===============6904408380219124306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/p11-kit: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit: SRC_URI changed from "git://github.com/p11-glue/p11-kit" to "git://github.com/p11-glue/p11-kit;branch=0.23"
packages/core2-32-poky-linux/p11-kit: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-bash-completion: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-bash-completion: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-dbg: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-dbg: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-dbg: PKGSIZE changed from 7405784 to 7412816 (+0%)
packages/core2-32-poky-linux/p11-kit/p11-kit-dev: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-dev: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-doc: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-doc: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ar: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ar: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-as: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-as: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ast: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ast: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-az: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-az: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-bg: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-bg: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-bn-in: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-bn-in: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ca+valencia: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ca+valencia: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ca: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ca: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-cs: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-cs: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-cy: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-cy: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-da: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-da: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-de: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-de: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-el: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-el: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-en-gb: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-en-gb: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-eo: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-eo: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-es: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-es: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-et: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-et: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-eu: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-eu: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fa: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fa: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fi: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fi: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fo: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fo: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fr: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fr: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fur: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-fur: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ga: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ga: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-gl: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-gl: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-gu: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-gu: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-he: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-he: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-hi: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-hi: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-hr: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-hr: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-hu: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-hu: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ia: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ia: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-id: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-id: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-it: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-it: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ja: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ja: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ka: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ka: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-kk: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-kk: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-kn: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-kn: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ko: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ko: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-lt: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-lt: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-lv: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-lv: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ml: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ml: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-mr: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-mr: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ms: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ms: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-nb: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-nb: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-nl: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-nl: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-nn: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-nn: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-oc: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-oc: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-or: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-or: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pa: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pa: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pl: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pl: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pt-br: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pt-br: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pt: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-pt: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ro: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ro: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ru: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ru: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sk: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sk: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sl: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sl: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sq: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sq: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sr+latin: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sr+latin: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sr: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sr: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sv: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-sv: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ta: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-ta: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-te: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-te: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-th: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-th: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-tr: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-tr: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-uk: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-uk: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-vi: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-vi: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-wa: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-wa: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-zh-cn: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-zh-cn: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-zh-hk: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-zh-hk: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-zh-tw: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-locale-zh-tw: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-src: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-src: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit-src: PKGSIZE changed from 1470733 to 1471776 (+0%)
packages/core2-32-poky-linux/p11-kit/p11-kit-staticdev: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit-staticdev: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit: PV changed from "0.23.21" to "0.23.22"
packages/core2-32-poky-linux/p11-kit/p11-kit: PKGV changed from 0.23.21 [default] to 0.23.22 [default]
packages/core2-32-poky-linux/p11-kit/p11-kit: PKGSIZE changed from 2966206 to 2967359 (+0%)

--===============6904408380219124306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 1466 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (803 cached, 4 parsed). 1413 targets, 49 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.2+snapshot-9c83e8077871aa633ef69a0aeb5789aa95116005"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9c83e8077871aa633ef69a0aeb5789aa95116005"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 23 Found 16 Missed 7 Current 643 (69% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 655 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 656 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 664 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Started
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-src went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-dbg went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-staticdev went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-dev went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-doc went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-locale went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-bin went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1444 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_fetch)
NOTE: Running task 1670 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_write_config)
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_fetch: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_fetch: Succeeded
NOTE: Running task 1836 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_unpack)
NOTE: Running task 1837 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe p11-kit-0.23.22-r0: task do_write_config: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_write_config: Succeeded
NOTE: recipe p11-kit-0.23.22-r0: task do_unpack: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_unpack: Succeeded
NOTE: Running task 2119 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_patch)
NOTE: recipe p11-kit-0.23.22-r0: task do_patch: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_patch: Succeeded
NOTE: Running task 2120 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_deploy_source_date_epoch)
NOTE: recipe p11-kit-0.23.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2121 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_populate_lic)
NOTE: recipe p11-kit-0.23.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_populate_lic: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_populate_lic unihash changed to 26a39458ee8abfb1114fc9f6d19673ac3dede97717432ac2d4e5b6ef95210fd3
NOTE: recipe p11-kit-0.23.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2122 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_configure)
NOTE: recipe p11-kit-0.23.22-r0: task do_configure: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_configure: Succeeded
NOTE: Running task 2123 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_compile)
NOTE: recipe p11-kit-0.23.22-r0: task do_compile: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_compile: Succeeded
NOTE: Running task 2124 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_install)
NOTE: recipe p11-kit-0.23.22-r0: task do_install: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_install: Succeeded
NOTE: Running task 2125 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_package)
NOTE: Running task 2126 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_populate_sysroot)
NOTE: recipe p11-kit-0.23.22-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_package: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_populate_sysroot: Succeeded
NOTE: recipe p11-kit-0.23.22-r0: task do_package: Succeeded
NOTE: Running task 2127 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_packagedata)
NOTE: recipe p11-kit-0.23.22-r0: task do_packagedata: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_packagedata: Succeeded
NOTE: Running task 2128 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_package_write_rpm)
NOTE: Running task 2129 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_package_qa)
NOTE: recipe p11-kit-0.23.22-r0: task do_package_write_rpm: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_package_qa: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_package_qa: Succeeded
NOTE: recipe p11-kit-0.23.22-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2130 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_build)
NOTE: Tasks Summary: Attempted 2130 tasks of which 2114 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============6904408380219124306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 1465 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (803 cached, 4 parsed). 1413 targets, 57 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.2+snapshot-9c83e8077871aa633ef69a0aeb5789aa95116005"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9c83e8077871aa633ef69a0aeb5789aa95116005"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 23 Found 16 Missed 7 Current 643 (69% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 655 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 656 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 664 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Started
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-src went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-dbg went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-staticdev went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-dev went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-doc went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-locale went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-bin went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
NOTE: Running task 1444 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_fetch)
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1670 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_write_config)
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_fetch: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_fetch: Succeeded
NOTE: Running task 1840 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_unpack)
NOTE: Running task 1841 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe p11-kit-0.23.22-r0: task do_write_config: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_write_config: Succeeded
NOTE: recipe p11-kit-0.23.22-r0: task do_unpack: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_unpack: Succeeded
NOTE: Running task 2119 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_patch)
NOTE: recipe p11-kit-0.23.22-r0: task do_patch: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_patch: Succeeded
NOTE: Running task 2120 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_deploy_source_date_epoch)
NOTE: Running task 2121 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_populate_lic)
NOTE: recipe p11-kit-0.23.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe p11-kit-0.23.22-r0: task do_populate_lic: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_populate_lic unihash changed to 26a39458ee8abfb1114fc9f6d19673ac3dede97717432ac2d4e5b6ef95210fd3
NOTE: recipe p11-kit-0.23.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2122 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_configure)
NOTE: recipe p11-kit-0.23.22-r0: task do_configure: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_configure: Succeeded
NOTE: Running task 2123 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_compile)
NOTE: recipe p11-kit-0.23.22-r0: task do_compile: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_compile: Succeeded
NOTE: Running task 2124 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_install)
NOTE: recipe p11-kit-0.23.22-r0: task do_install: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_install: Succeeded
NOTE: Running task 2125 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_package)
NOTE: Running task 2126 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_populate_sysroot)
NOTE: recipe p11-kit-0.23.22-r0: task do_package: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_populate_sysroot: Succeeded
NOTE: recipe p11-kit-0.23.22-r0: task do_package: Succeeded
NOTE: Running task 2127 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_packagedata)
NOTE: recipe p11-kit-0.23.22-r0: task do_packagedata: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_packagedata: Succeeded
NOTE: Running task 2128 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_package_write_rpm)
NOTE: Running task 2129 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_package_qa)
NOTE: recipe p11-kit-0.23.22-r0: task do_package_write_rpm: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_package_qa: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_package_qa: Succeeded
NOTE: recipe p11-kit-0.23.22-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2130 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_build)
NOTE: Tasks Summary: Attempted 2130 tasks of which 2114 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============6904408380219124306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 1465 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (803 cached, 4 parsed). 1413 targets, 66 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.2+snapshot-9c83e8077871aa633ef69a0aeb5789aa95116005"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9c83e8077871aa633ef69a0aeb5789aa95116005"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 23 Found 16 Missed 7 Current 643 (69% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 655 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 656 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 664 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Started
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-src went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-dbg went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-staticdev went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-dev went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-doc went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-locale went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-bin went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1444 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_fetch)
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe p11-kit-0.23.22-r0: task do_fetch: Started
NOTE: Running task 1767 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_write_config)
NOTE: recipe p11-kit-0.23.22-r0: task do_fetch: Succeeded
NOTE: Running task 1844 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_unpack)
NOTE: Running task 1845 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe p11-kit-0.23.22-r0: task do_write_config: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_unpack: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_write_config: Succeeded
NOTE: recipe p11-kit-0.23.22-r0: task do_unpack: Succeeded
NOTE: Running task 2119 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_patch)
NOTE: recipe p11-kit-0.23.22-r0: task do_patch: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_patch: Succeeded
NOTE: Running task 2120 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_deploy_source_date_epoch)
NOTE: Running task 2121 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_populate_lic)
NOTE: recipe p11-kit-0.23.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe p11-kit-0.23.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_populate_lic: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_populate_lic unihash changed to 26a39458ee8abfb1114fc9f6d19673ac3dede97717432ac2d4e5b6ef95210fd3
NOTE: recipe p11-kit-0.23.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2122 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_configure)
NOTE: recipe p11-kit-0.23.22-r0: task do_configure: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_configure: Succeeded
NOTE: Running task 2123 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_compile)
NOTE: recipe p11-kit-0.23.22-r0: task do_compile: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_compile: Succeeded
NOTE: Running task 2124 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_install)
NOTE: recipe p11-kit-0.23.22-r0: task do_install: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_install: Succeeded
NOTE: Running task 2125 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_package)
NOTE: Running task 2126 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_populate_sysroot)
NOTE: recipe p11-kit-0.23.22-r0: task do_package: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_populate_sysroot: Succeeded
NOTE: recipe p11-kit-0.23.22-r0: task do_package: Succeeded
NOTE: Running task 2127 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_packagedata)
NOTE: recipe p11-kit-0.23.22-r0: task do_packagedata: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_packagedata: Succeeded
NOTE: Running task 2128 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_package_write_rpm)
NOTE: Running task 2129 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_package_qa)
NOTE: recipe p11-kit-0.23.22-r0: task do_package_write_rpm: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_package_qa: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_package_qa: Succeeded
NOTE: recipe p11-kit-0.23.22-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2130 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_build)
NOTE: Tasks Summary: Attempted 2130 tasks of which 2114 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============6904408380219124306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1512 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (806 cached, 1 parsed). 1413 targets, 31 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.2+snapshot-9c83e8077871aa633ef69a0aeb5789aa95116005"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9c83e8077871aa633ef69a0aeb5789aa95116005"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 23 Found 16 Missed 7 Current 643 (69% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 655 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 656 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 664 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Started
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-src went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-dbg went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-staticdev went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-dev went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-doc went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-locale went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-bin went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
ERROR: libcap-ng-0.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng went backwards which would break package feeds (from 0:0.8.2-r0 to 0:0.8.1-r0) [version-going-backwards]
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1444 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_fetch)
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe p11-kit-0.23.22-r0: task do_fetch: Started
NOTE: Running task 1767 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_write_config)
NOTE: recipe p11-kit-0.23.22-r0: task do_fetch: Succeeded
NOTE: Running task 1807 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_unpack)
NOTE: Running task 1808 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe p11-kit-0.23.22-r0: task do_write_config: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_unpack: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_write_config: Succeeded
NOTE: recipe p11-kit-0.23.22-r0: task do_unpack: Succeeded
NOTE: Running task 2119 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_patch)
NOTE: recipe p11-kit-0.23.22-r0: task do_patch: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_patch: Succeeded
NOTE: Running task 2120 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_deploy_source_date_epoch)
NOTE: Running task 2121 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_populate_lic)
NOTE: recipe p11-kit-0.23.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe p11-kit-0.23.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_populate_lic: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_populate_lic unihash changed to 26a39458ee8abfb1114fc9f6d19673ac3dede97717432ac2d4e5b6ef95210fd3
NOTE: recipe p11-kit-0.23.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2122 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_configure)
NOTE: recipe p11-kit-0.23.22-r0: task do_configure: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_configure: Succeeded
NOTE: Running task 2123 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_compile)
NOTE: recipe p11-kit-0.23.22-r0: task do_compile: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_compile: Succeeded
NOTE: Running task 2124 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_install)
NOTE: recipe p11-kit-0.23.22-r0: task do_install: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_install: Succeeded
NOTE: Running task 2125 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_package)
NOTE: Running task 2126 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_populate_sysroot)
NOTE: recipe p11-kit-0.23.22-r0: task do_package: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_populate_sysroot: Succeeded
NOTE: recipe p11-kit-0.23.22-r0: task do_package: Succeeded
NOTE: Running task 2127 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_packagedata)
NOTE: recipe p11-kit-0.23.22-r0: task do_packagedata: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_packagedata: Succeeded
NOTE: Running task 2128 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_package_write_rpm)
NOTE: Running task 2129 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_package_qa)
NOTE: recipe p11-kit-0.23.22-r0: task do_package_write_rpm: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_package_qa: Started
NOTE: recipe p11-kit-0.23.22-r0: task do_package_qa: Succeeded
NOTE: recipe p11-kit-0.23.22-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2130 of 2130 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb:do_build)
NOTE: Tasks Summary: Attempted 2130 tasks of which 2114 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============6904408380219124306==--
