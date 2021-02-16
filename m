Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.5174.1613463852957224164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id D65AE38C112E
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:12 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to d4d9353b7290ed22cb7349226a8e4017402d3f02 SUCCEEDED
Message-ID: <MADEUP.16642CD3732A8133.7752@lists.openembedded.org>
X-Groupsio-MsgNum: 148144
Content-Type: multipart/mixed; boundary="===============5495491984969763565=="

--===============5495491984969763565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *d4d9353b7290ed22cb7349226a8e4017402d3f02* has Succeeded.

Next steps:
    - apply the patch: git am 0001-piglit-upgrade-to-latest-revision.patch
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

--===============5495491984969763565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1428 targets, 41 skipped, 0 masked, 0 errors.
Removing 122 recipes from the core2-32 sysroot...done.
Removing 126 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-15fe21b7a7793cfe7e43dce1366dfa186b60e18b"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:15fe21b7a7793cfe7e43dce1366dfa186b60e18b"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 580 Found 535 Missed 45 Current 209 (92% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 210 of 789 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.10.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 217 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.10.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 260 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 261 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 262 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 263 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 264 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 266 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 267 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 268 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 269 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 271 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 272 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 273 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 274 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 275 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 276 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 277 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 278 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 283 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_package_write_rpm_setscene)
NOTE: recipe mesa-2_20.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 289 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 292 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 311 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe iproute2-5.10.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 313 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 314 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 315 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 316 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 317 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 319 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 320 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 321 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 322 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 323 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 324 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 325 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 326 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 327 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 328 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 329 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 330 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 336 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 337 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 338 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 339 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 345 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 346 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 347 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 348 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 349 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 351 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 352 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 353 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 354 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 355 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 356 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 357 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 358 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 359 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 360 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 362 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_deploy_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 363 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 364 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 365 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 366 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 367 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.47.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 368 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.47-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 369 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 370 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 371 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 372 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 373 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 374 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_package_write_rpm_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 706 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_fetch)
NOTE: Running task 708 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_fetch)
NOTE: Running task 718 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_fetch)
NOTE: Running task 721 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_fetch)
NOTE: Running task 722 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_fetch)
NOTE: Running task 733 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 747 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_write_config)
NOTE: Running task 755 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_fetch)
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 756 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_fetch)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Started
NOTE: recipe glew-2.2.0-r0: task do_fetch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 899 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_unpack)
NOTE: Running task 900 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_unpack)
NOTE: Running task 901 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_unpack)
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_fetch: Started
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Started
NOTE: Running task 902 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_unpack)
NOTE: recipe python3-mako-1.1.4-r0: task do_fetch: Started
NOTE: Running task 903 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_unpack)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-mako-1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 904 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_unpack)
NOTE: Running task 905 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_unpack)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_fetch: Succeeded
NOTE: Running task 906 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Started
NOTE: recipe glew-2.2.0-r0: task do_unpack: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-mako-1.1.4-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 907 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_patch)
NOTE: recipe libcap-2.47-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 378 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 379 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 383 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 385 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-mako-1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 920 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_patch)
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 921 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_patch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 922 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_patch)
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Succeeded
NOTE: Running task 923 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.1.4-r0: task do_patch: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_patch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 932 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_patch)
NOTE: recipe waffle-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 933 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 938 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_patch)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_patch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 939 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 940 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glew-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 941 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 942 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 390 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 398 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 402 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 403 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 943 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_patch)
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 407 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Succeeded
NOTE: Running task 959 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 410 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 416 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_20.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 420 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_packagedata_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_20.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 426 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 431 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.7-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 437 of 789 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.36.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.9.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 438 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 445 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe iproute2-5.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 448 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_unpack: Succeeded
NOTE: Running task 1031 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_patch: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 476 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_patch: Succeeded
NOTE: Running task 1060 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1061 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1062 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 482 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_generate_toolchain_file: Started
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_populate_lic: Started
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to acabb0484b90ae443e6b9bb3706492d66778256d3dffb04d184e0aa57a5fad88
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe mesa-2_20.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 496 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 497 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 503 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_20.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.45.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 514 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 515 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 519 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_20.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 522 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 526 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdrm-2.4.104-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 528 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.104-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 535 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 536 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 538 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 541 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.104-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 544 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 545 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 546 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 547 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 573 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 582 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 584 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 586 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 587 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 596 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 600 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 606 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 608 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.47.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1201 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 1202 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1203 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 613 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 620 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 625 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 631 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 635 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 636 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1236 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 643 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 644 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 646 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1242 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1251 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1256 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 654 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 658 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 662 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 665 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 667 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 669 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 671 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1290 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1300 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 675 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 677 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 678 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 679 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 682 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 691 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 93e0e7aeb112d08033644aaddf772c7ec1b77e991074c4f3c566762e480becb9
NOTE: Running task 1305 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 695 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 698 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 700 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 702 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 709 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 710 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 715 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 717 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 722 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 727 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 733 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 735 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 736 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 737 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 743 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 745 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 746 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 749 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 751 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 753 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 755 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 757 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 759 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 760 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 761 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 763 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 764 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 769 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 771 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 772 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 776 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 777 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 782 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 783 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 787 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 789 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1727 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1988 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1993 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2122 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2323 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 055c4d134f82946839d7026b1c385802d69ba0394ea147e97f2f4e9ae021908c
NOTE: Running task 2348 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2393 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_configure)
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Started
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2394 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_configure)
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_configure: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2395 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_compile)
NOTE: recipe python3-mako-1.1.4-r0: task do_compile: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2396 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_install)
NOTE: recipe python3-mako-1.1.4-r0: task do_install: Started
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2397 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_configure)
NOTE: recipe waffle-1.6.1-r0: task do_configure: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2398 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_package)
NOTE: recipe python3-mako-1.1.4-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2399 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_compile)
NOTE: recipe waffle-1.6.1-r0: task do_compile: Started
NOTE: recipe waffle-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2400 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_install)
NOTE: recipe waffle-1.6.1-r0: task do_install: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2401 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_packagedata)
NOTE: recipe python3-mako-1.1.4-r0: task do_packagedata: Started
NOTE: recipe waffle-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2402 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package)
NOTE: Running task 2403 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_populate_sysroot)
NOTE: recipe python3-mako-1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2404 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_package_write_rpm)
NOTE: recipe waffle-1.6.1-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-mako-1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2405 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_packagedata)
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Started
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2406 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package_write_rpm)
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Succeeded
NOTE: Running task 2407 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_compile)
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Started
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Succeeded
NOTE: Running task 2408 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_install)
NOTE: recipe libglu-2_9.0.1-0: task do_install: Started
NOTE: recipe libglu-2_9.0.1-0: task do_install: Succeeded
NOTE: Running task 2409 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_populate_sysroot)
NOTE: Running task 2410 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package)
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2411 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_compile)
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Succeeded
NOTE: Running task 2412 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2413 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2414 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_install)
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2415 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2416 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package)
NOTE: recipe libglu-2_9.0.1-0: task do_package: Succeeded
NOTE: Running task 2417 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Succeeded
NOTE: Running task 2418 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2419 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2420 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_configure)
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2421 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2422 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_configure: Succeeded
NOTE: Running task 2423 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2424 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_compile)
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2425 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_install)
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2426 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 2427 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package)
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2428 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2429 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2430 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_compile)
NOTE: recipe glew-2.2.0-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2431 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_packagedata)
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2432 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package_write_rpm)
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2433 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_install)
NOTE: recipe glew-2.2.0-r0: task do_install: Started
NOTE: recipe glew-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 2434 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package)
NOTE: Running task 2435 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_populate_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_package: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2436 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2437 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 2438 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_packagedata)
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Started
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2439 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package_write_rpm)
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2440 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_compile)
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2441 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Succeeded
NOTE: Running task 2442 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Succeeded
NOTE: Running task 2443 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2444 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_compile: Succeeded
NOTE: Running task 2445 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_install: Succeeded
NOTE: Running task 2446 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2447 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package: Succeeded
NOTE: Running task 2448 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_packagedata: Succeeded
NOTE: Running task 2449 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 2450 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package_qa: Succeeded
NOTE: Running noexec task 2451 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2451 tasks of which 2341 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There were 28 ERROR messages shown, returning a non-zero exit code.

--===============5495491984969763565==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

From 1883486d613b9369d59f39fe1c3c3b2ec4f49447 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 16 Feb 2021 04:45:14 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 484b59df00..52c39fd681 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "d3a6e1293c43a6d989d4bcd59132317195d420c6"
+SRCREV = "d4d9353b7290ed22cb7349226a8e4017402d3f02"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.17.1


--===============5495491984969763565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+d3a6e1293c to 1.0+gitr0+d4d9353b72
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+d3a6e1293c to 1.0+gitr0+d4d9353b72
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+d3a6e1293c to 1.0+gitr0+d4d9353b72
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+d3a6e1293c to 1.0+gitr0+d4d9353b72
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+d3a6e1293c to 1.0+gitr0+d4d9353b72
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+d3a6e1293c to 1.0+gitr0+d4d9353b72
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+d3a6e1293c to 1.0+gitr0+d4d9353b72
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+d3a6e1293c to 1.0+gitr0+d4d9353b72

--===============5495491984969763565==
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
DISTRO_VERSION       = "3.2+snapshot-15fe21b7a7793cfe7e43dce1366dfa186b60e18b"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:15fe21b7a7793cfe7e43dce1366dfa186b60e18b"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 52 Found 8 Missed 44 Current 726 (15% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 738 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 764 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_20.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1111 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe mesa-2_20.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_20.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_20.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1494 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_fetch)
NOTE: Running task 1497 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_fetch)
NOTE: Running task 1545 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_fetch)
NOTE: Running task 1573 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_fetch)
NOTE: Running task 1613 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_fetch)
NOTE: Running task 1644 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1709 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_write_config)
NOTE: Running task 1725 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_fetch)
NOTE: Running task 1727 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_fetch)
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Started
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Succeeded
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1886 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_unpack)
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Started
NOTE: Running task 1906 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_unpack)
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: Running task 1907 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Started
NOTE: recipe glew-2.2.0-r0: task do_fetch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Succeeded
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: Running task 1932 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_unpack)
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Succeeded
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe glew-2.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1949 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_unpack)
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: Running task 1960 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_unpack)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_fetch: Started
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_fetch: Started
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_fetch: Succeeded
NOTE: recipe python3-mako-1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 2129 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 2151 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_unpack)
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2152 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2153 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_unpack)
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Succeeded
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Started
NOTE: recipe glew-2.2.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Succeeded
NOTE: Running task 2265 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_prepare_recipe_sysroot: Started
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 2266 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_patch)
NOTE: Running task 2267 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_patch)
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe glew-2.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2268 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_patch)
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2269 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2270 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Started
NOTE: Running task 2271 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_patch)
NOTE: recipe python3-mako-1.1.4-r0: task do_patch: Started
NOTE: recipe glew-2.2.0-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.6.1-r0: task do_patch: Started
NOTE: recipe waffle-1.6.1-r0: task do_patch: Succeeded
NOTE: Running task 2272 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2273 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_deploy_source_date_epoch)
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Started
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_20.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 778 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mesa-2_20.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_20.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2286 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2287 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2289 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_patch)
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2290 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_unpack: Succeeded
NOTE: Running task 2291 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_patch: Succeeded
NOTE: Running task 2292 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2293 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2294 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to acabb0484b90ae443e6b9bb3706492d66778256d3dffb04d184e0aa57a5fad88
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2295 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2296 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2297 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2298 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_configure)
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2299 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2300 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_configure)
NOTE: recipe python3-mako-1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2301 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_configure)
NOTE: recipe python3-mako-1.1.4-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 9be73892817ccae6a1679d6602b61f68cb686db2a571abe1d29b85f617ac1e25
NOTE: Running task 2322 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mako-1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2344 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_compile)
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_compile: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2345 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_install)
NOTE: recipe python3-mako-1.1.4-r0: task do_install: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2346 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_package)
NOTE: recipe python3-mako-1.1.4-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2347 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 34ae1f9d59024cf3248f55464cec110c7b18e0eb3d540ee9ad905def0f031610
NOTE: Setscene tasks completed
NOTE: Running task 2373 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2377 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_configure)
NOTE: recipe waffle-1.6.1-r0: task do_configure: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2378 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_packagedata)
NOTE: recipe python3-mako-1.1.4-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2379 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2380 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_compile)
NOTE: recipe waffle-1.6.1-r0: task do_compile: Started
NOTE: recipe waffle-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2381 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_install)
NOTE: recipe waffle-1.6.1-r0: task do_install: Started
NOTE: recipe waffle-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2382 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package)
NOTE: Running task 2383 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_populate_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Succeeded
NOTE: Running task 2384 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_compile)
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2385 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_compile)
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Started
NOTE: recipe waffle-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2386 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Succeeded
NOTE: Running task 2387 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_install)
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2388 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_install)
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_install: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.1-0: task do_install: Succeeded
NOTE: Running task 2389 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_populate_sysroot)
NOTE: Running task 2390 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package)
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2391 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2392 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2393 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package)
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Succeeded
NOTE: Running task 2394 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2395 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2396 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_configure)
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2397 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Succeeded
NOTE: Running task 2398 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Succeeded
NOTE: Running task 2399 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2400 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2401 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2402 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_compile)
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_configure: Succeeded
NOTE: Running task 2403 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2404 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_install)
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2405 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 2406 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package)
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2407 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2408 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2409 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_compile)
NOTE: recipe glew-2.2.0-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2410 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_packagedata)
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2411 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package_write_rpm)
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2412 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_install)
NOTE: recipe glew-2.2.0-r0: task do_install: Started
NOTE: recipe glew-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 2413 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package)
NOTE: Running task 2414 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_populate_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_package: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2415 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2416 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 2417 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_packagedata)
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Started
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2418 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package_write_rpm)
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2419 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_compile)
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2420 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Succeeded
NOTE: Running task 2421 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Succeeded
NOTE: Running task 2422 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2423 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_compile: Succeeded
NOTE: Running task 2424 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_install: Succeeded
NOTE: Running task 2425 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2426 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package: Succeeded
NOTE: Running task 2427 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_packagedata: Succeeded
NOTE: Running task 2428 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 2429 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package_qa: Succeeded
NOTE: Running noexec task 2430 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2430 tasks of which 2326 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds

Summary: There were 28 ERROR messages shown, returning a non-zero exit code.

--===============5495491984969763565==
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
DISTRO_VERSION       = "3.2+snapshot-15fe21b7a7793cfe7e43dce1366dfa186b60e18b"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:15fe21b7a7793cfe7e43dce1366dfa186b60e18b"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 52 Found 8 Missed 44 Current 726 (15% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 738 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 764 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_20.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1111 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1494 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_fetch)
NOTE: Running task 1497 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_fetch)
NOTE: Running task 1545 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_fetch)
NOTE: Running task 1573 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_fetch)
NOTE: Running task 1614 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_fetch)
NOTE: Running task 1644 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Started
NOTE: Running task 1709 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_write_config)
NOTE: Running task 1726 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_fetch)
NOTE: Running task 1727 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_fetch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Started
NOTE: recipe mesa-2_20.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 776 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_packagedata_setscene)
NOTE: Running task 1821 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_unpack)
NOTE: Running task 1822 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_unpack)
NOTE: Running task 1823 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_fetch: Started
NOTE: recipe mesa-2_20.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1845 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_unpack)
NOTE: recipe glew-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Started
NOTE: Running task 1866 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_unpack)
NOTE: Running task 1877 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_unpack)
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_fetch: Succeeded
NOTE: Running task 1973 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Started
NOTE: Running task 2020 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_unpack)
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2021 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2022 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_unpack)
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_20.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Started
NOTE: recipe glew-2.2.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Succeeded
NOTE: Running task 2193 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_patch)
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2266 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_patch)
NOTE: recipe python3-mako-1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 2267 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_patch)
NOTE: recipe glew-2.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2268 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_patch)
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2269 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_patch)
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Succeeded
NOTE: Running task 2270 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_patch: Started
NOTE: recipe glew-2.2.0-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2271 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_patch)
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe waffle-1.6.1-r0: task do_patch: Started
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe waffle-1.6.1-r0: task do_patch: Succeeded
NOTE: Running task 2272 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2273 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_deploy_source_date_epoch)
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2274 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Started
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe mesa-2_20.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe mesa-2_20.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2276 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_patch)
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Started
NOTE: recipe mesa-2_20.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2288 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2290 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_unpack: Succeeded
NOTE: Running task 2291 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2292 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2293 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2294 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_configure)
NOTE: recipe python3-mako-1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2295 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2296 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2297 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_patch: Succeeded
NOTE: Running task 2298 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2299 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2300 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.1.4-r0: task do_configure: Started
NOTE: Running task 2301 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_populate_lic: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to acabb0484b90ae443e6b9bb3706492d66778256d3dffb04d184e0aa57a5fad88
NOTE: recipe python3-mako-1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2302 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_compile)
NOTE: recipe python3-mako-1.1.4-r0: task do_compile: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2303 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_install)
NOTE: recipe python3-mako-1.1.4-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 947b3f3eeb0dfbbf6b71a2570cf7038cea898c207019c744a3a1ca5df19e8530
NOTE: Running task 2324 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2346 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_package)
NOTE: recipe python3-mako-1.1.4-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2347 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0b1db967e13a1cce76dacb0a93759952734dd0c6028b6c011e72a5e0f26fbaff
NOTE: Setscene tasks completed
NOTE: Running task 2373 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2377 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_configure)
NOTE: recipe waffle-1.6.1-r0: task do_configure: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2378 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_packagedata)
NOTE: recipe python3-mako-1.1.4-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2379 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2380 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_compile)
NOTE: recipe waffle-1.6.1-r0: task do_compile: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2381 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_install)
NOTE: recipe waffle-1.6.1-r0: task do_install: Started
NOTE: recipe waffle-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2382 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package)
NOTE: Running task 2383 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_populate_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.6.1-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Succeeded
NOTE: Running task 2384 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_compile)
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2385 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_compile)
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Started
NOTE: recipe waffle-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2386 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_packagedata)
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Succeeded
NOTE: Running task 2387 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_install)
NOTE: recipe libglu-2_9.0.1-0: task do_install: Started
NOTE: recipe libglu-2_9.0.1-0: task do_install: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2388 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_populate_sysroot)
NOTE: Running task 2389 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package)
NOTE: Running task 2390 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2391 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_install)
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Succeeded
NOTE: Running task 2392 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2393 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2394 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package)
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2395 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2396 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_configure: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2397 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_configure)
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Succeeded
NOTE: Running task 2398 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Succeeded
NOTE: Running task 2399 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2400 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2401 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_configure: Succeeded
NOTE: Running task 2402 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2403 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_compile)
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2404 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_install)
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2405 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 2406 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package)
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2407 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2408 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2409 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_compile)
NOTE: recipe glew-2.2.0-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2410 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_packagedata)
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2411 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package_write_rpm)
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2412 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_install)
NOTE: recipe glew-2.2.0-r0: task do_install: Started
NOTE: recipe glew-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 2413 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package)
NOTE: Running task 2414 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_populate_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_package: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2415 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2416 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 2417 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_packagedata)
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Started
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2418 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package_write_rpm)
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2419 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_compile)
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2420 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Succeeded
NOTE: Running task 2421 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Succeeded
NOTE: Running task 2422 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2423 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_compile: Succeeded
NOTE: Running task 2424 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_install: Succeeded
NOTE: Running task 2425 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2426 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package: Succeeded
NOTE: Running task 2427 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_packagedata: Succeeded
NOTE: Running task 2428 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 2429 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package_qa: Succeeded
NOTE: Running noexec task 2430 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2430 tasks of which 2326 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There were 28 ERROR messages shown, returning a non-zero exit code.

--===============5495491984969763565==
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
DISTRO_VERSION       = "3.2+snapshot-15fe21b7a7793cfe7e43dce1366dfa186b60e18b"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:15fe21b7a7793cfe7e43dce1366dfa186b60e18b"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 52 Found 8 Missed 44 Current 726 (15% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 738 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 764 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_20.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1111 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1493 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_fetch)
NOTE: Running task 1497 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_fetch)
NOTE: Running task 1545 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_fetch)
NOTE: Running task 1573 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_fetch)
NOTE: Running task 1613 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_fetch)
NOTE: Running task 1644 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1709 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_write_config)
NOTE: Running task 1726 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_fetch)
NOTE: Running task 1727 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_fetch)
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Started
NOTE: Running task 1868 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_unpack)
NOTE: Running task 1882 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_unpack)
NOTE: Running task 1883 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1904 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_unpack)
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_fetch: Started
NOTE: Running task 1920 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_unpack)
NOTE: recipe glew-2.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1934 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_unpack)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_fetch: Started
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Started
NOTE: Running task 2041 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe python3-mako-1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 2073 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_unpack)
NOTE: Running task 2074 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2094 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_unpack)
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe glew-2.2.0-r0: task do_unpack: Started
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Succeeded
NOTE: Running task 2265 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Started
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Started
NOTE: recipe mesa-2_20.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 776 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_20.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 2266 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_patch)
NOTE: Running task 2267 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_patch)
NOTE: recipe python3-mako-1.1.4-r0: task do_patch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Started
NOTE: recipe glew-2.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2268 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_patch)
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2269 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2270 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2271 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_patch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2272 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe glew-2.2.0-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Started
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.6.1-r0: task do_patch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.6.1-r0: task do_patch: Succeeded
NOTE: Running task 2273 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_deploy_source_date_epoch)
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Started
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe glew-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2274 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_deploy_source_date_epoch)
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Started
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe mesa-2_20.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2276 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe mesa-2_20.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Started
NOTE: recipe mesa-2_20.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2288 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2290 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_unpack: Succeeded
NOTE: Running task 2291 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2292 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2293 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_patch: Succeeded
NOTE: Running task 2294 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2295 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2296 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to acabb0484b90ae443e6b9bb3706492d66778256d3dffb04d184e0aa57a5fad88
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 517200faa79489c03aaee74d243275f29de67290a89364e59cd5fcf52c63e1e4
NOTE: Running task 2317 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2339 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2340 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_configure)
NOTE: recipe python3-mako-1.1.4-r0: task do_configure: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2341 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_compile)
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2342 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_configure)
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.1.4-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2343 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2344 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_configure)
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2345 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_install)
NOTE: recipe python3-mako-1.1.4-r0: task do_install: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2346 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_package)
NOTE: recipe python3-mako-1.1.4-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2347 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 4d36386f84f1f8a6eeadb3b159bce7be17a46afff77c0a8da00b9ade299130f5
NOTE: Setscene tasks completed
NOTE: Running task 2373 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2377 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_configure)
NOTE: recipe waffle-1.6.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-mako-1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2378 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_packagedata)
NOTE: recipe waffle-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2379 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_compile)
NOTE: recipe python3-mako-1.1.4-r0: task do_packagedata: Started
NOTE: recipe waffle-1.6.1-r0: task do_compile: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2380 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2381 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_install)
NOTE: recipe waffle-1.6.1-r0: task do_install: Started
NOTE: recipe waffle-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2382 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package)
NOTE: Running task 2383 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_populate_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.6.1-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Succeeded
NOTE: Running task 2384 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_compile)
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2385 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_compile)
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Succeeded
NOTE: Running task 2386 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_install)
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2387 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_install)
NOTE: recipe waffle-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2388 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.1-0: task do_install: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Started
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_install: Succeeded
NOTE: Running task 2389 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_populate_sysroot)
NOTE: Running task 2390 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package)
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2391 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2392 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2393 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package)
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Succeeded
NOTE: Running task 2394 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2395 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2396 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_configure)
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2397 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Succeeded
NOTE: Running task 2398 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2399 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_packagedata)
NOTE: Running task 2400 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2401 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_configure: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Succeeded
NOTE: Running task 2402 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_compile)
NOTE: Running task 2403 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2404 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_install)
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2405 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 2406 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package)
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2407 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2408 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2409 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_compile)
NOTE: recipe glew-2.2.0-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2410 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_packagedata)
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2411 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package_write_rpm)
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2412 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_install)
NOTE: recipe glew-2.2.0-r0: task do_install: Started
NOTE: recipe glew-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 2413 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package)
NOTE: Running task 2414 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_populate_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_package: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2415 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2416 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 2417 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_packagedata)
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Started
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2418 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package_write_rpm)
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2419 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_compile)
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2420 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Succeeded
NOTE: Running task 2421 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Succeeded
NOTE: Running task 2422 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2423 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_compile: Succeeded
NOTE: Running task 2424 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_install: Succeeded
NOTE: Running task 2425 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2426 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package: Succeeded
NOTE: Running task 2427 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_packagedata: Succeeded
NOTE: Running task 2428 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 2429 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2430 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2430 tasks of which 2326 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There were 28 ERROR messages shown, returning a non-zero exit code.

--===============5495491984969763565==
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
DISTRO_VERSION       = "3.2+snapshot-15fe21b7a7793cfe7e43dce1366dfa186b60e18b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:15fe21b7a7793cfe7e43dce1366dfa186b60e18b"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 52 Found 8 Missed 44 Current 726 (15% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 738 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 764 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_20.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1111 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1494 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_fetch)
NOTE: Running task 1497 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_fetch)
NOTE: Running task 1546 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_fetch)
NOTE: Running task 1573 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_fetch)
NOTE: Running task 1614 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_fetch)
NOTE: Running task 1644 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1709 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_write_config)
NOTE: Running task 1725 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_fetch)
NOTE: Running task 1726 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_fetch)
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_fetch: Started
NOTE: recipe glew-2.2.0-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Succeeded
NOTE: Running task 2011 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_unpack)
NOTE: Running task 2012 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Started
NOTE: Running task 2013 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_unpack)
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2258 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_unpack)
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2259 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Started
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2260 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_unpack)
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 2261 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_unpack)
NOTE: Running task 2262 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_unpack)
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Started
NOTE: Running task 2263 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_patch)
NOTE: recipe python3-mako-1.1.4-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_unpack: Started
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe glew-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 2264 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_unpack)
NOTE: Running task 2265 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2266 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_patch)
NOTE: recipe mesa-2_20.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 776 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_packagedata_setscene)
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Succeeded
NOTE: Running task 2267 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_patch)
NOTE: Running task 2268 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Started
NOTE: recipe glew-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.1.4-r0: task do_unpack: Started
NOTE: Running task 2269 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_patch)
NOTE: recipe python3-mako-1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_20.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Started
NOTE: Running task 2270 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_patch)
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 2271 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_patch)
NOTE: recipe mesa-2_20.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glew-2.2.0-r0: task do_patch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2272 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe glew-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.1.4-r0: task do_patch: Started
NOTE: Running task 2273 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.6.1-r0: task do_patch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.6.1-r0: task do_patch: Succeeded
NOTE: Running task 2274 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Started
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
ERROR: mesa-2_20.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:20.3.4-r0 to 2:20.3.2-r0) [version-going-backwards]
NOTE: recipe mesa-2_20.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 778 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_20.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2276 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_patch)
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Started
NOTE: recipe mesa-2_20.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2288 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_unpack: Succeeded
NOTE: Running task 2290 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_patch: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2291 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_patch: Succeeded
NOTE: Running task 2292 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2293 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2294 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to acabb0484b90ae443e6b9bb3706492d66778256d3dffb04d184e0aa57a5fad88
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2295 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2296 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2297 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2298 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2299 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_configure)
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2300 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_configure)
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2301 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_configure)
NOTE: recipe python3-mako-1.1.4-r0: task do_configure: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2302 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_compile)
NOTE: recipe python3-mako-1.1.4-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe python3-mako-1.1.4-r0: task do_compile: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 2e06541ff4c1e71ad371a85f393c3f35ed840fa219ee311f9a83df5e15081efc
NOTE: Running task 2323 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2332 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_install)
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2346 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-mako-1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2347 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 664e107f7e4384d7a71270232afba85e211fe63f8509de7e39ef4650d4c4d829
NOTE: Setscene tasks completed
NOTE: Running task 2373 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2377 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_configure)
NOTE: recipe waffle-1.6.1-r0: task do_configure: Started
NOTE: recipe waffle-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2378 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_compile)
NOTE: recipe waffle-1.6.1-r0: task do_compile: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2379 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_packagedata)
NOTE: recipe python3-mako-1.1.4-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2380 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.4.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2381 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_install)
NOTE: recipe waffle-1.6.1-r0: task do_install: Started
NOTE: recipe waffle-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2382 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package)
NOTE: Running task 2383 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_populate_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Succeeded
NOTE: Running task 2384 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_compile)
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2385 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_compile)
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2386 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_install)
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Succeeded
NOTE: Running task 2387 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_install)
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2388 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2389 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package)
NOTE: recipe libglu-2_9.0.1-0: task do_install: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.1-0: task do_install: Succeeded
NOTE: Running task 2390 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_populate_sysroot)
NOTE: Running task 2391 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package)
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2392 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_packagedata)
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2393 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Succeeded
NOTE: Running task 2394 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2395 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package_write_rpm)
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2396 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_configure)
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Started
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2397 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Succeeded
NOTE: Running task 2398 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2399 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Succeeded
NOTE: Running task 2400 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2401 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2402 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_compile)
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2403 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_install)
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2404 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 2405 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package)
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2406 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2407 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2408 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_compile)
NOTE: recipe glew-2.2.0-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_configure: Succeeded
NOTE: Running task 2409 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2410 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_packagedata)
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2411 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package_write_rpm)
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2412 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_install)
NOTE: recipe glew-2.2.0-r0: task do_install: Started
NOTE: recipe glew-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 2413 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package)
NOTE: Running task 2414 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_populate_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_package: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2415 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2416 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 2417 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_packagedata)
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Started
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2418 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package_write_rpm)
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2419 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_compile)
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2420 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Succeeded
NOTE: Running task 2421 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Succeeded
NOTE: Running task 2422 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2423 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_compile: Succeeded
NOTE: Running task 2424 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_install: Succeeded
NOTE: Running task 2425 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2426 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package: Succeeded
NOTE: Running task 2427 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_packagedata: Succeeded
NOTE: Running task 2428 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 2429 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d4d9353b72-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2430 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2430 tasks of which 2326 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 8 seconds

Summary: There were 28 ERROR messages shown, returning a non-zero exit code.

--===============5495491984969763565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+d3a6e1293c [default] to 1.0+gitrAUTOINC+d4d9353b72 [default]
packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+d3a6e1293c" to "1.0+gitrAUTOINC+d4d9353b72"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+d3a6e1293c to 1.0+gitr0+d4d9353b72
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+d3a6e1293c" to "1.0+gitrAUTOINC+d4d9353b72"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+d3a6e1293c to 1.0+gitr0+d4d9353b72
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+d3a6e1293c" to "1.0+gitrAUTOINC+d4d9353b72"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+d3a6e1293c to 1.0+gitr0+d4d9353b72
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+d3a6e1293c" to "1.0+gitrAUTOINC+d4d9353b72"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+d3a6e1293c to 1.0+gitr0+d4d9353b72
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+d3a6e1293c" to "1.0+gitrAUTOINC+d4d9353b72"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+d3a6e1293c to 1.0+gitr0+d4d9353b72
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+d3a6e1293c" to "1.0+gitrAUTOINC+d4d9353b72"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+d3a6e1293c to 1.0+gitr0+d4d9353b72
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+d3a6e1293c" to "1.0+gitrAUTOINC+d4d9353b72"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+d3a6e1293c to 1.0+gitr0+d4d9353b72
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+d3a6e1293c" to "1.0+gitrAUTOINC+d4d9353b72"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+d3a6e1293c to 1.0+gitr0+d4d9353b72
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+d3a6e1293c" to "1.0+gitrAUTOINC+d4d9353b72"
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2041682061 to 2041747147 (+0%)

--===============5495491984969763565==--
