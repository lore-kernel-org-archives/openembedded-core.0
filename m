Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.24166.1608473714406093511
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id CACBB38C1404
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:13 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dnf: upgrading to 4.5.2 SUCCEEDED
Message-ID: <MADEUP.165272524B64256F.5278@lists.openembedded.org>
X-Groupsio-MsgNum: 145937
Content-Type: multipart/mixed; boundary="===============4000030297056990263=="

--===============4000030297056990263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dnf* to *4.5.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.4.0-4.5.2.patch
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

--===============4000030297056990263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (0 cached, 807 parsed). 1416 targets, 41 skipped, 0 masked, 0 errors.
Removing 124 recipes from the core2-32 sysroot...done.
Removing 128 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-fed3ceade259a7a54a62648e51c3520658f0951b"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fed3ceade259a7a54a62648e51c3520658f0951b"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 613 Found 463 Missed 150 Current 203 (75% match, 81% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 204 of 816 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 211 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 293 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 294 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 295 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 296 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 297 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 298 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_package_write_rpm_setscene)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 300 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 301 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 316 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 317 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 318 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 319 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 320 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 321 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 322 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 323 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 324 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 325 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 326 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 327 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 338 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 339 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 340 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 341 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 342 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 343 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 344 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 345 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 346 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 347 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 348 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 349 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 350 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 351 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 352 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 353 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 354 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 355 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 356 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 357 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 358 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 359 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 360 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 361 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 367 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 368 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 369 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 370 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 390 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 391 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 392 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 400 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 401 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Started
NOTE: Running setscene task 406 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 407 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 408 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 409 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 422 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 433 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 461 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 462 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 463 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package_write_rpm_setscene)
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 464 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 466 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 600 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_fetch)
NOTE: Running task 641 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_fetch)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: Running task 642 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_fetch)
NOTE: Running task 649 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_fetch)
NOTE: Running task 655 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_fetch)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 656 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_fetch)
NOTE: Running task 659 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 660 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running task 661 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_fetch)
NOTE: Running task 674 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_fetch)
NOTE: Running task 675 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_fetch)
NOTE: Running task 676 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_fetch)
NOTE: Running task 677 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_fetch)
NOTE: Running task 678 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_fetch)
NOTE: Running task 683 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 694 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: Running task 706 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_fetch)
NOTE: Running task 707 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_fetch)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.6-r0: task do_fetch: Started
NOTE: Running task 723 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_fetch)
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Started
NOTE: recipe nettle-3.6-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Started
NOTE: recipe libassuan-2.5.4-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: Running task 724 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_unpack)
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Succeeded
NOTE: Running task 725 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_unpack)
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libassuan-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Started
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: Running task 726 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_unpack)
NOTE: recipe librepo-1.12.1-r0: task do_fetch: Started
NOTE: Running task 727 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_unpack)
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe gpgme-1.15.0-r0: task do_fetch: Started
NOTE: recipe curl-7.73.0-r0: task do_fetch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_fetch: Succeeded
NOTE: Running setscene task 473 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running task 728 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_unpack)
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: Running task 729 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_unpack)
NOTE: recipe gpgme-1.15.0-r0: task do_fetch: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.15-r0: task do_fetch: Started
NOTE: recipe libsolv-0.7.16-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Started
NOTE: Running task 730 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 731 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: Running task 732 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_unpack)
NOTE: Running task 733 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_unpack)
NOTE: Running task 734 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_unpack)
NOTE: Running task 735 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_unpack)
NOTE: recipe rpm-1_4.16.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_fetch: Started
NOTE: recipe json-c-0.15-r0: task do_fetch: Succeeded
NOTE: Running task 736 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_unpack)
NOTE: recipe libsolv-0.7.16-r0: task do_fetch: Succeeded
NOTE: Running task 737 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_unpack)
NOTE: Running task 738 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 739 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: recipe python3-six-1.15.0-r0: task do_fetch: Succeeded
NOTE: Running task 740 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_fetch)
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Started
NOTE: recipe nettle-3.6-r0: task do_unpack: Started
NOTE: recipe libassuan-2.5.4-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe gnutls-3.6.15-r0: task do_unpack: Started
NOTE: recipe gpgme-1.15.0-r0: task do_unpack: Started
NOTE: recipe librepo-1.12.1-r0: task do_unpack: Started
NOTE: recipe curl-7.73.0-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Started
NOTE: Running task 741 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe gtk-doc-1.33.1-r0: task do_fetch: Started
NOTE: recipe nettle-3.6-r0: task do_unpack: Succeeded
NOTE: Running task 742 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_patch)
NOTE: recipe gtk-doc-1.33.1-r0: task do_fetch: Succeeded
NOTE: Running task 743 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe libassuan-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 744 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: Running task 745 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_patch)
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: Running task 746 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_patch)
NOTE: Running task 747 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 748 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_patch)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe nettle-3.6-r0: task do_patch: Started
NOTE: Running setscene task 478 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 479 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: Running task 749 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_unpack)
NOTE: recipe libassuan-2.5.4-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: recipe libmodulemd-2.9.4-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: Running task 750 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 751 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_unpack)
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 482 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 752 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 483 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 767 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_write_config)
NOTE: recipe json-c-0.15-r0: task do_unpack: Started
NOTE: Running task 768 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_fetch)
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_unpack: Started
NOTE: Running task 772 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_fetch)
NOTE: Running task 776 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_unpack)
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 777 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_unpack)
NOTE: recipe librepo-1.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 778 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_patch)
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 779 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Succeeded
NOTE: Running task 780 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: Running task 787 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_fetch)
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_unpack: Started
NOTE: Running task 788 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_patch)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_unpack: Started
NOTE: Running task 789 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe librepo-1.12.1-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: Running task 791 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_fetch)
NOTE: recipe libdnf-0.55.0-r0: task do_fetch: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_unpack: Started
NOTE: recipe libcomps-0.1.15-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 498 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 796 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_fetch)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 804 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: Running task 809 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_fetch)
NOTE: recipe python3-six-1.15.0-r0: task do_unpack: Succeeded
NOTE: recipe json-c-0.15-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_fetch: Started
NOTE: Running task 810 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_patch)
NOTE: Running task 811 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_fetch: Succeeded
NOTE: Running task 812 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libksba-1.4.0-r0: task do_fetch: Started
NOTE: Running task 813 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_unpack)
NOTE: recipe libksba-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 817 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libassuan-2.5.4-r0: task do_patch: Succeeded
NOTE: Running task 826 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 833 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_fetch)
NOTE: recipe libcomps-0.1.15-r0: task do_fetch: Succeeded
NOTE: recipe npth-1.6-r0: task do_fetch: Started
NOTE: Running task 834 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_unpack)
NOTE: recipe libmodulemd-2.9.4-r0: task do_write_config: Started
NOTE: recipe dnf-4.5.2-r0: task do_fetch: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_patch: Started
NOTE: recipe json-c-0.15-r0: task do_patch: Started
NOTE: Running task 835 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_unpack)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 851 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_fetch)
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 508 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_packagedata_setscene)
NOTE: recipe npth-1.6-r0: task do_fetch: Succeeded
NOTE: Running task 911 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_unpack)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libassuan-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_unpack: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_fetch: Started
NOTE: recipe dnf-4.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_unpack: Started
NOTE: recipe libdnf-0.55.0-r0: task do_unpack: Started
NOTE: recipe libksba-1.4.0-r0: task do_unpack: Started
NOTE: Running task 988 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: Running task 999 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_unpack)
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmodulemd-2.9.4-r0: task do_write_config: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_unpack: Started
NOTE: recipe gnupg-2.2.23-r0: task do_fetch: Succeeded
NOTE: Running task 1000 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_unpack)
NOTE: recipe elfutils-0.182-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Started
NOTE: recipe libsolv-0.7.16-r0: task do_unpack: Succeeded
NOTE: Running task 1001 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_patch)
NOTE: recipe python3-six-1.15.0-r0: task do_patch: Succeeded
NOTE: Running task 1002 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pinentry-1.1.0-r0: task do_fetch: Started
NOTE: recipe npth-1.6-r0: task do_unpack: Started
NOTE: recipe json-c-0.15-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.6-r0: task do_patch: Succeeded
NOTE: Running task 1003 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_generate_toolchain_file)
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: Running task 1004 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 1005 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1006 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe libmodulemd-2.9.4-r0: task do_patch: Started
NOTE: recipe dnf-4.5.2-r0: task do_unpack: Started
NOTE: recipe libsolv-0.7.16-r0: task do_patch: Started
NOTE: recipe gnupg-2.2.23-r0: task do_unpack: Started
NOTE: recipe python3-six-1.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-c-0.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 513 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 514 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 517 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: recipe rpm-1_4.16.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_unpack: Succeeded
NOTE: recipe json-c-0.15-r0: task do_generate_toolchain_file: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1011 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_patch)
NOTE: Running task 1012 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Succeeded
NOTE: Running task 1013 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe json-c-0.15-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_patch: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_patch: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 519 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe pinentry-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libassuan-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1014 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_unpack)
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_patch: Succeeded
NOTE: Running task 1015 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_deploy_source_date_epoch)
NOTE: Running task 1016 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_generate_toolchain_file)
NOTE: Running task 1017 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Succeeded
NOTE: Running task 1018 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_patch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-c-0.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pinentry-1.1.0-r0: task do_unpack: Started
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe npth-1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1034 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_patch)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librepo-1.12.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Started
NOTE: recipe libksba-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1042 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_patch)
NOTE: recipe libsolv-0.7.16-r0: task do_patch: Succeeded
NOTE: Running task 1043 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_generate_toolchain_file)
NOTE: Running task 1044 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_deploy_source_date_epoch)
NOTE: recipe npth-1.6-r0: task do_patch: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_patch: Started
NOTE: recipe libsolv-0.7.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pinentry-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_unpack: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_unpack: Succeeded
NOTE: Running task 1057 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_patch)
NOTE: Running task 1058 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_patch)
NOTE: Running task 1062 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_patch)
NOTE: recipe libmodulemd-2.9.4-r0: task do_patch: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1064 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iniparse-0.4-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1065 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gpgme-1.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1066 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_patch)
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_unpack: Succeeded
NOTE: Running task 1067 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_patch)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Succeeded
NOTE: recipe npth-1.6-r0: task do_patch: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1068 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1069 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_patch)
NOTE: Running task 1070 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1071 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsolv-0.7.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dnf-4.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1072 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_patch)
NOTE: recipe gtk-doc-1.33.1-r0: task do_patch: Started
NOTE: recipe pinentry-1.1.0-r0: task do_patch: Started
NOTE: recipe libcomps-0.1.15-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gpgme-1.15.0-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Started
NOTE: recipe libdnf-0.55.0-r0: task do_patch: Started
NOTE: recipe libksba-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.5.2-r0: task do_patch: Started
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_unpack: Succeeded
NOTE: Running task 1073 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_patch)
NOTE: recipe python3-iniparse-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pinentry-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_unpack: Succeeded
NOTE: Running task 1074 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_patch)
NOTE: Running task 1075 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcomps-0.1.15-r0: task do_patch: Succeeded
NOTE: Running task 1076 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_generate_toolchain_file)
NOTE: Running task 1077 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_deploy_source_date_epoch)
NOTE: recipe libksba-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_patch: Succeeded
NOTE: Running task 1078 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.73.0-r0: task do_patch: Started
NOTE: recipe pinentry-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.6.15-r0: task do_patch: Started
NOTE: recipe libcomps-0.1.15-r0: task do_generate_toolchain_file: Started
NOTE: recipe libcomps-0.1.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.6.15-r0: task do_patch: Succeeded
NOTE: Running task 1079 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.73.0-r0: task do_patch: Succeeded
NOTE: Running task 1080 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pinentry-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_patch: Succeeded
NOTE: Running task 1081 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_generate_toolchain_file)
NOTE: Running task 1082 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk-doc-1.33.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.5.2-r0: task do_patch: Succeeded
NOTE: Running task 1083 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_generate_toolchain_file)
NOTE: Running task 1084 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1085 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_populate_lic)
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 1086 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libdnf-0.55.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libdnf-0.55.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.55.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_patch: Succeeded
NOTE: Running task 1087 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe dnf-4.5.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe dnf-4.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1088 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe dnf-4.5.2-r0: task do_populate_lic: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dnf-4.5.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_unpack: Succeeded
NOTE: Running task 1089 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_patch)
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dnf-4.5.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_populate_lic unihash changed to 8aec06e53131c1eeaa060d7dd31d9117c1200a8351ba162474370c49556df793
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_patch: Started
NOTE: recipe libcomps-0.1.15-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 537 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 542 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 545 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 548 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 552 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_patch: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1099 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 553 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnupg-2.2.23-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 563 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 570 of 816 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 576 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 579 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 582 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 585 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 589 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 593 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 595 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 602 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 613 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 620 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 623 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 624 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 628 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 635 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1198 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 641 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 1203 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1204 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 645 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 649 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 650 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: Running setscene task 651 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 653 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 655 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 656 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 660 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1218 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1246 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 662 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 668 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 669 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 672 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 673 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1267 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: Running setscene task 679 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1276 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 682 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 683 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 684 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 687 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 689 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 691 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 693 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 694 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 695 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 697 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 701 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 703 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 711 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1319 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-src went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dbg went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Succeeded
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libsmartcols went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libmount went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libfdisk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libblkid went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swaponoff went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ptest went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-staticdev went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dev went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-doc went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-bash-completion went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dmesg went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-getopt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-kill went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-more went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mount went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mountpoint went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-su went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-umount went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-agetty went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkid went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blockdev went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-cfdisk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ctrlaltdel went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fdisk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsck went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fstrim went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hwclock went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-losetup went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkswap went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-nologin went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-pivot-root went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-sulogin went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swapoff went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swapon went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-switch-root went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-cal went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chmem went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-choom went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chrt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-col went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-colcrt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-colrm went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-column went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-eject went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fallocate went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fincore went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-findmnt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-flock went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hardlink went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hexdump went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ionice went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcmk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcrm went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-irqtop went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-isosize went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-last went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-logger went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-look went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsblk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lscpu went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsipc went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsirq went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lslocks went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lslogins went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsmem went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsns went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mcookie went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mesg went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-namei went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-nsenter went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-prlimit went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rename went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-renice went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rev went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-script went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-scriptlive went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-scriptreplay went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setarch went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setpriv went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setsid went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setterm went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-taskset went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ul went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-unshare went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-utmpdump went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidgen went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidparse went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wall went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wdctl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-whereis went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-write went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-addpart went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkdiscard went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkzone went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chcpu went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-delpart went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fdformat went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-findfs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsck.cramfs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsfreeze went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ldattach went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkfs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkfs.cramfs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-partx went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-raw went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-readprofile went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-resizepart went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rfkill went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rtcwake went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-runuser went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-sfdisk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swaplabel went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidd went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wipefs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-zramctl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ca went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-cs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-da went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-de went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: Running setscene task 722 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_populate_sysroot_setscene)
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-es went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: Running setscene task 723 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 726 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 730 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_populate_sysroot_setscene)
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-et went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-eu went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-fi went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-fr went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-gl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-hr went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-hu went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-id went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-it went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ja went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-nl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pt-br went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ru went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sv went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-tr went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-uk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-vi went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-zh-cn went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-zh-tw went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 732 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 733 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 734 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 735 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 736 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 739 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 740 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 741 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 743 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 745 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 750 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 754 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 756 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 758 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 760 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 761 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 763 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1376 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 771 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 772 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 773 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 774 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 775 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ac9535620c869a5ab0014bf3b6f9b8138e6f7b60a06f668c27308a6b7faf6f5c
NOTE: Running task 1393 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 780 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 783 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: Running setscene task 784 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 786 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 787 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 788 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 792 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 796 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 797 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 798 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 800 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 805 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 806 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 810 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 811 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 813 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 814 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 815 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 816 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 817 of 816 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1723 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1786 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1831 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1832 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1896 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1897 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1917 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1925 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 1951 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1953 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1954 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1992 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2220 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure)
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2221 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_configure)
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2222 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2223 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2224 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: Running task 2225 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2226 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 6c0422073d22e07b8d4a881cee113af4d2adac7abce1d859c2ffb593aace9791
NOTE: Running task 2251 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk-doc-1.33.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2252 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_configure)
NOTE: Running task 2257 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_configure)
NOTE: recipe nettle-3.6-r0: task do_configure: Started
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe json-c-0.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2298 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_configure)
NOTE: recipe gtk-doc-1.33.1-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_configure: Started
NOTE: recipe json-c-0.15-r0: task do_configure: Started
NOTE: recipe python3-six-1.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2299 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_configure)
NOTE: recipe python3-six-1.15.0-r0: task do_configure: Started
NOTE: recipe python3-six-1.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2300 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_compile)
NOTE: recipe python3-six-1.15.0-r0: task do_compile: Started
NOTE: recipe python3-six-1.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2301 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_install)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2302 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_configure)
NOTE: recipe python3-six-1.15.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Started
NOTE: recipe python3-six-1.15.0-r0: task do_install: Succeeded
NOTE: Running task 2303 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_populate_sysroot)
NOTE: Running task 2304 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_package)
NOTE: recipe python3-six-1.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-six-1.15.0-r0: task do_package: Started
NOTE: recipe python3-six-1.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2305 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniparse-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.15.0-r0: task do_package: Succeeded
NOTE: Running task 2306 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2307 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_configure)
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_configure: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_configure: Succeeded
NOTE: Running task 2308 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_compile)
NOTE: recipe json-c-0.15-r0: task do_configure: Succeeded
NOTE: Running task 2309 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_compile)
NOTE: recipe python3-iniparse-0.4-r0: task do_compile: Started
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2310 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_package_write_rpm)
NOTE: recipe json-c-0.15-r0: task do_compile: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_compile: Succeeded
NOTE: Running task 2311 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_install)
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Succeeded
NOTE: Running task 2312 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_compile)
NOTE: recipe python3-iniparse-0.4-r0: task do_install: Succeeded
NOTE: Running task 2313 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_package)
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2314 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_populate_sysroot)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_compile: Started
NOTE: recipe nettle-3.6-r0: task do_configure: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_package: Started
NOTE: Running task 2315 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure_ptest_base)
NOTE: recipe json-c-0.15-r0: task do_compile: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_populate_sysroot: Started
NOTE: Running task 2316 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_install)
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Started
NOTE: recipe json-c-0.15-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2317 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile)
NOTE: recipe python3-iniparse-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.6-r0: task do_compile: Started
NOTE: recipe json-c-0.15-r0: task do_install: Succeeded
NOTE: Running task 2318 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_populate_sysroot)
NOTE: Running task 2319 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_package)
NOTE: recipe json-c-0.15-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.15-r0: task do_package: Started
NOTE: recipe json-c-0.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_package: Succeeded
NOTE: Running task 2320 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.4-r0: task do_packagedata: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2321 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_package_write_rpm)
NOTE: recipe python3-iniparse-0.4-r0: task do_package_write_rpm: Started
NOTE: recipe json-c-0.15-r0: task do_package: Succeeded
NOTE: Running task 2322 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_packagedata)
NOTE: recipe json-c-0.15-r0: task do_packagedata: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe json-c-0.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2323 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_package_write_rpm)
NOTE: recipe json-c-0.15-r0: task do_package_write_rpm: Started
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 2324 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: recipe json-c-0.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2325 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_configure: Succeeded
NOTE: Running task 2326 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_compile)
NOTE: recipe gtk-doc-1.33.1-r0: task do_compile: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_compile: Succeeded
NOTE: Running task 2327 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 2328 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: Running task 2329 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: recipe gtk-doc-1.33.1-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe npth-1.6-r0: task do_configure: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2330 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_compile)
NOTE: Running task 2331 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe npth-1.6-r0: task do_compile: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_install: Succeeded
NOTE: Running task 2332 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_populate_sysroot)
NOTE: Running task 2333 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_package)
NOTE: recipe gtk-doc-1.33.1-r0: task do_populate_sysroot: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe npth-1.6-r0: task do_compile: Succeeded
NOTE: Running task 2334 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_install)
NOTE: recipe npth-1.6-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2335 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe npth-1.6-r0: task do_install: Succeeded
NOTE: Running task 2336 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package)
NOTE: Running task 2337 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_populate_sysroot)
NOTE: recipe npth-1.6-r0: task do_package: Started
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2338 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2339 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.6-r0: task do_compile: Succeeded
NOTE: Running task 2340 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_package: Succeeded
NOTE: Running task 2341 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_packagedata)
NOTE: recipe gtk-doc-1.33.1-r0: task do_packagedata: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 2342 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2343 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_package_write_rpm)
NOTE: recipe gtk-doc-1.33.1-r0: task do_package_write_rpm: Started
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2344 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package_write_rpm)
NOTE: recipe libyaml-0.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe npth-1.6-r0: task do_package: Succeeded
NOTE: Running task 2345 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_packagedata)
NOTE: recipe npth-1.6-r0: task do_packagedata: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2346 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe npth-1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2347 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe npth-1.6-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2348 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe npth-1.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2349 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2350 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2351 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2352 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2353 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2354 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2355 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2356 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install)
NOTE: recipe nettle-3.6-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_install: Succeeded
NOTE: Running task 2357 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2358 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_populate_sysroot)
NOTE: Running task 2359 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2360 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe nettle-3.6-r0: task do_package: Started
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2361 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2362 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_compile: Succeeded
NOTE: Running task 2363 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_install)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_install: Succeeded
NOTE: Running task 2364 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot)
NOTE: Running task 2365 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2366 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2367 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Succeeded
NOTE: Running task 2368 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_compile)
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 2369 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libcomps-0.1.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2370 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_configure)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2371 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package_write_rpm)
NOTE: recipe libcomps-0.1.15-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm: Started
NOTE: recipe libcomps-0.1.15-r0: task do_configure: Succeeded
NOTE: Running task 2372 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_compile)
NOTE: recipe libmodulemd-2.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2373 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_configure)
NOTE: recipe libcomps-0.1.15-r0: task do_compile: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package: Succeeded
NOTE: Running task 2374 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata: Started
NOTE: recipe libcomps-0.1.15-r0: task do_compile: Succeeded
NOTE: Running task 2375 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_install)
NOTE: recipe libcomps-0.1.15-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2376 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm: Started
NOTE: recipe libcomps-0.1.15-r0: task do_install: Succeeded
NOTE: Running task 2377 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_package)
NOTE: Running task 2378 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_populate_sysroot)
NOTE: recipe libcomps-0.1.15-r0: task do_package: Started
NOTE: recipe libcomps-0.1.15-r0: task do_populate_sysroot: Started
NOTE: recipe libcomps-0.1.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Succeeded
NOTE: Running task 2379 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_install)
NOTE: recipe libmodulemd-2.9.4-r0: task do_configure: Succeeded
NOTE: Running task 2380 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_compile)
NOTE: recipe libgpg-error-1.39-r0: task do_install: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_compile: Started
NOTE: recipe libcomps-0.1.15-r0: task do_package: Succeeded
NOTE: Running task 2381 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_packagedata)
NOTE: recipe libgpg-error-1.39-r0: task do_install: Succeeded
NOTE: Running task 2382 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_populate_sysroot)
NOTE: Running task 2383 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package)
NOTE: recipe libcomps-0.1.15-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Started
NOTE: recipe nettle-3.6-r0: task do_package: Succeeded
NOTE: Running task 2384 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_packagedata)
NOTE: recipe libcomps-0.1.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2385 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_package_write_rpm)
NOTE: recipe nettle-3.6-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2386 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2387 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2388 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcomps-0.1.15-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libassuan-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libksba-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2389 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_configure)
NOTE: recipe libksba-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2390 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_configure)
NOTE: recipe nettle-3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2391 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Started
NOTE: recipe libksba-1.4.0-r0: task do_configure: Started
NOTE: recipe libassuan-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2392 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_configure)
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe libassuan-2.5.4-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_package: Succeeded
NOTE: Running task 2393 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_packagedata)
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2394 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_compile: Succeeded
NOTE: Running task 2395 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_install)
NOTE: recipe libmodulemd-2.9.4-r0: task do_install: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmodulemd-2.9.4-r0: task do_install: Succeeded
NOTE: Running task 2396 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_sysroot)
NOTE: Running task 2397 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package)
NOTE: recipe libmodulemd-2.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_package: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2398 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_compile)
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_package: Succeeded
NOTE: Running task 2399 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata)
NOTE: recipe libmodulemd-2.9.4-r0: task do_packagedata: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2400 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package_write_rpm)
NOTE: recipe libmodulemd-2.9.4-r0: task do_package_write_rpm: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2401 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_compile)
NOTE: recipe libksba-1.4.0-r0: task do_compile: Started
NOTE: recipe libassuan-2.5.4-r0: task do_configure: Succeeded
NOTE: Running task 2402 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_compile)
NOTE: recipe libassuan-2.5.4-r0: task do_compile: Started
NOTE: recipe libassuan-2.5.4-r0: task do_compile: Succeeded
NOTE: Running task 2403 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_install)
NOTE: recipe libassuan-2.5.4-r0: task do_install: Started
NOTE: recipe libassuan-2.5.4-r0: task do_install: Succeeded
NOTE: Running task 2404 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_populate_sysroot)
NOTE: Running task 2405 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_package)
NOTE: recipe libksba-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2406 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_install)
NOTE: recipe libassuan-2.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libassuan-2.5.4-r0: task do_package: Started
NOTE: recipe libksba-1.4.0-r0: task do_install: Started
NOTE: recipe libassuan-2.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2407 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2408 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libksba-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2409 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_package)
NOTE: Running task 2410 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_populate_sysroot)
NOTE: recipe pinentry-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-1.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libksba-1.4.0-r0: task do_package: Started
NOTE: recipe libksba-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 2411 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_compile)
NOTE: recipe pinentry-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2412 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Started
NOTE: recipe pinentry-1.1.0-r0: task do_configure: Started
NOTE: recipe libksba-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2413 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_configure)
NOTE: recipe gpgme-1.15.0-r0: task do_configure: Started
NOTE: recipe libassuan-2.5.4-r0: task do_package: Succeeded
NOTE: Running task 2414 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_packagedata)
NOTE: recipe libassuan-2.5.4-r0: task do_packagedata: Started
NOTE: recipe libassuan-2.5.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2415 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_package_write_rpm)
NOTE: recipe libassuan-2.5.4-r0: task do_package_write_rpm: Started
NOTE: recipe libksba-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2416 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_packagedata)
NOTE: recipe libksba-1.4.0-r0: task do_packagedata: Started
NOTE: recipe libksba-1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2417 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_package_write_rpm)
NOTE: recipe libassuan-2.5.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe libksba-1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pinentry-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2418 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_compile)
NOTE: recipe pinentry-1.1.0-r0: task do_compile: Started
NOTE: recipe pinentry-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2419 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_install)
NOTE: recipe pinentry-1.1.0-r0: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2420 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_install)
NOTE: recipe pinentry-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2421 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_package)
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Started
NOTE: recipe pinentry-1.1.0-r0: task do_package: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 2422 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_populate_sysroot)
NOTE: Running task 2423 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package)
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2424 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pinentry-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2425 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_packagedata)
NOTE: recipe pinentry-1.1.0-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 2426 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_packagedata)
NOTE: recipe pinentry-1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2427 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2428 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Started
NOTE: recipe pinentry-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2429 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe pinentry-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2430 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_compile)
NOTE: recipe gpgme-1.15.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2431 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_compile)
NOTE: recipe rpm-1_4.16.0-r0: task do_compile: Started
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2432 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_install)
NOTE: recipe libunistring-0.9.10-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2433 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2434 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package)
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2435 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_install)
NOTE: recipe rpm-1_4.16.0-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2436 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2437 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_configure)
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_install: Succeeded
NOTE: Running task 2438 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_populate_sysroot)
NOTE: Running task 2439 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_package)
NOTE: recipe rpm-1_4.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_package: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2440 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2441 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsolv-0.7.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2442 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2443 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_configure)
NOTE: recipe libsolv-0.7.16-r0: task do_configure: Started
NOTE: recipe libsolv-0.7.16-r0: task do_configure: Succeeded
NOTE: Running task 2444 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_compile)
NOTE: recipe libsolv-0.7.16-r0: task do_compile: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_package: Succeeded
NOTE: Running task 2445 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2446 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.16-r0: task do_compile: Succeeded
NOTE: Running task 2447 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_install)
NOTE: recipe rpm-1_4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_install: Started
NOTE: recipe libsolv-0.7.16-r0: task do_install: Succeeded
NOTE: Running task 2448 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_populate_sysroot)
NOTE: Running task 2449 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_package)
NOTE: recipe libsolv-0.7.16-r0: task do_package: Started
NOTE: recipe libsolv-0.7.16-r0: task do_populate_sysroot: Started
NOTE: recipe libsolv-0.7.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_package: Succeeded
NOTE: Running task 2450 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_packagedata)
NOTE: recipe libsolv-0.7.16-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.16-r0: task do_packagedata: Succeeded
NOTE: Running task 2451 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_package_write_rpm)
NOTE: recipe libsolv-0.7.16-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2452 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_install)
NOTE: recipe gpgme-1.15.0-r0: task do_install: Started
NOTE: recipe gpgme-1.15.0-r0: task do_install: Succeeded
NOTE: Running task 2453 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_populate_sysroot)
NOTE: Running task 2454 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_package)
NOTE: recipe gpgme-1.15.0-r0: task do_package: Started
NOTE: recipe gpgme-1.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe gpgme-1.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_package: Succeeded
NOTE: Running task 2455 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_packagedata)
NOTE: recipe gpgme-1.15.0-r0: task do_packagedata: Started
NOTE: recipe gpgme-1.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2456 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_package_write_rpm)
NOTE: recipe gpgme-1.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2457 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_compile)
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2458 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_install)
NOTE: recipe gpgme-1.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_install: Started
NOTE: recipe libidn2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2459 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot)
NOTE: Running task 2460 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package)
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2461 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2462 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_configure)
NOTE: recipe gnutls-3.6.15-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 2463 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata)
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2464 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_configure: Succeeded
NOTE: Running task 2465 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_compile)
NOTE: recipe gnutls-3.6.15-r0: task do_compile: Started
NOTE: recipe gnutls-3.6.15-r0: task do_compile: Succeeded
NOTE: Running task 2466 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_install)
NOTE: recipe gnutls-3.6.15-r0: task do_install: Started
NOTE: recipe gnutls-3.6.15-r0: task do_install: Succeeded
NOTE: Running task 2467 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_populate_sysroot)
NOTE: Running task 2468 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_package)
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package: Started
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2469 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2470 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.73.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnupg-2.2.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.73.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2471 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_configure)
NOTE: recipe gnupg-2.2.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2472 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_configure)
NOTE: recipe curl-7.73.0-r0: task do_configure: Started
NOTE: recipe gnupg-2.2.23-r0: task do_configure: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package: Succeeded
NOTE: Running task 2473 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_packagedata)
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2474 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_package_write_rpm)
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_configure: Succeeded
NOTE: Running task 2475 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_compile)
NOTE: recipe gnupg-2.2.23-r0: task do_compile: Started
NOTE: recipe gnupg-2.2.23-r0: task do_compile: Succeeded
NOTE: Running task 2476 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_install)
NOTE: recipe gnupg-2.2.23-r0: task do_install: Started
NOTE: recipe gnupg-2.2.23-r0: task do_install: Succeeded
NOTE: Running task 2477 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_package)
NOTE: recipe gnupg-2.2.23-r0: task do_package: Started
NOTE: recipe curl-7.73.0-r0: task do_configure: Succeeded
NOTE: Running task 2478 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_compile)
NOTE: recipe curl-7.73.0-r0: task do_compile: Started
NOTE: recipe curl-7.73.0-r0: task do_compile: Succeeded
NOTE: Running task 2479 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_install)
NOTE: recipe curl-7.73.0-r0: task do_install: Started
NOTE: recipe gnupg-2.2.23-r0: task do_package: Succeeded
NOTE: Running task 2480 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_packagedata)
NOTE: recipe gnupg-2.2.23-r0: task do_packagedata: Started
NOTE: recipe curl-7.73.0-r0: task do_install: Succeeded
NOTE: Running task 2481 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_populate_sysroot)
NOTE: Running task 2482 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_package)
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.73.0-r0: task do_package: Started
NOTE: recipe gnupg-2.2.23-r0: task do_packagedata: Succeeded
NOTE: Running task 2483 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_package_write_rpm)
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2484 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnupg-2.2.23-r0: task do_package_write_rpm: Started
NOTE: recipe librepo-1.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librepo-1.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2485 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_configure)
NOTE: recipe librepo-1.12.1-r0: task do_configure: Started
NOTE: recipe librepo-1.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2486 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_compile)
NOTE: recipe librepo-1.12.1-r0: task do_compile: Started
NOTE: recipe librepo-1.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2487 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_install)
NOTE: recipe librepo-1.12.1-r0: task do_install: Started
NOTE: recipe curl-7.73.0-r0: task do_package: Succeeded
NOTE: Running task 2488 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_packagedata)
NOTE: recipe librepo-1.12.1-r0: task do_install: Succeeded
NOTE: Running task 2489 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_populate_sysroot)
NOTE: recipe curl-7.73.0-r0: task do_packagedata: Started
NOTE: recipe librepo-1.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.73.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2490 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_package)
NOTE: Running task 2491 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_package_write_rpm)
NOTE: recipe librepo-1.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2492 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe librepo-1.12.1-r0: task do_package: Started
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm: Started
NOTE: recipe libdnf-0.55.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdnf-0.55.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2493 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_configure)
NOTE: recipe libdnf-0.55.0-r0: task do_configure: Started
NOTE: recipe librepo-1.12.1-r0: task do_package: Succeeded
NOTE: Running task 2494 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_packagedata)
NOTE: recipe librepo-1.12.1-r0: task do_packagedata: Started
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2495 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_package_write_rpm)
NOTE: recipe libdnf-0.55.0-r0: task do_configure: Succeeded
NOTE: Running task 2496 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_compile)
NOTE: recipe librepo-1.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe libdnf-0.55.0-r0: task do_compile: Started
NOTE: recipe gnupg-2.2.23-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_compile: Succeeded
NOTE: Running task 2497 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_install)
NOTE: recipe libdnf-0.55.0-r0: task do_install: Started
NOTE: recipe libdnf-0.55.0-r0: task do_install: Succeeded
NOTE: Running task 2498 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_package)
NOTE: Running task 2499 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_populate_sysroot)
NOTE: recipe libdnf-0.55.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdnf-0.55.0-r0: task do_package: Started
NOTE: recipe libdnf-0.55.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2500 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe dnf-4.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dnf-4.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2501 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_configure)
NOTE: recipe dnf-4.5.2-r0: task do_configure: Started
NOTE: recipe dnf-4.5.2-r0: task do_configure: Succeeded
NOTE: Running task 2502 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_compile)
NOTE: recipe dnf-4.5.2-r0: task do_compile: Started
NOTE: recipe dnf-4.5.2-r0: task do_compile: Succeeded
NOTE: Running task 2503 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_install)
NOTE: recipe dnf-4.5.2-r0: task do_install: Started
NOTE: recipe dnf-4.5.2-r0: task do_install: Succeeded
NOTE: Running task 2504 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_populate_sysroot)
NOTE: recipe dnf-4.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe dnf-4.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_package: Succeeded
NOTE: Running task 2505 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_packagedata)
NOTE: recipe libdnf-0.55.0-r0: task do_packagedata: Started
NOTE: recipe libdnf-0.55.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2506 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_package)
NOTE: Running task 2507 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_package_write_rpm)
NOTE: recipe dnf-4.5.2-r0: task do_package: Started
NOTE: recipe libdnf-0.55.0-r0: task do_package_write_rpm: Started
NOTE: recipe dnf-4.5.2-r0: task do_package: Succeeded
NOTE: Running task 2508 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_packagedata)
NOTE: recipe dnf-4.5.2-r0: task do_packagedata: Started
NOTE: recipe dnf-4.5.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2509 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_package_write_rpm)
NOTE: Running task 2510 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_package_qa)
NOTE: recipe dnf-4.5.2-r0: task do_package_write_rpm: Started
NOTE: recipe dnf-4.5.2-r0: task do_package_qa: Started
NOTE: recipe dnf-4.5.2-r0: task do_package_qa: Succeeded
NOTE: recipe dnf-4.5.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2511 of 2511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2511 tasks of which 2140 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 147 ERROR messages shown, returning a non-zero exit code.

--===============4000030297056990263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (0 cached, 807 parsed). 1416 targets, 48 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.2+snapshot-fed3ceade259a7a54a62648e51c3520658f0951b"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fed3ceade259a7a54a62648e51c3520658f0951b"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 236 Found 86 Missed 150 Current 569 (36% match, 81% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 571 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 572 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 573 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 574 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 579 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 580 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 581 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 582 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 583 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 591 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 618 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 629 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 631 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 646 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 647 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 648 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 659 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 660 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 661 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 662 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 663 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 665 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 667 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: Running setscene task 668 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 669 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 675 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 748 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_14b463d0e5-r0: task do_deploy_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_14b463d0e5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 750 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 751 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 752 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: Running task 1002 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_fetch)
NOTE: Running task 1082 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_fetch)
NOTE: Running task 1083 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_fetch)
NOTE: Running task 1109 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_fetch)
NOTE: Running task 1150 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_fetch)
NOTE: Running task 1151 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_fetch)
NOTE: Running task 1156 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running task 1157 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1158 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_fetch)
NOTE: Running task 1187 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_fetch)
NOTE: Running task 1190 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_fetch)
NOTE: Running task 1192 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_fetch)
NOTE: Running task 1193 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_fetch)
NOTE: Running task 1196 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_fetch)
NOTE: Running task 1201 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 1224 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: Running task 1237 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_fetch)
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1238 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_fetch)
NOTE: Running task 1261 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_fetch)
NOTE: Running setscene task 753 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe nettle-3.6-r0: task do_fetch: Started
NOTE: Running task 1264 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: Running task 1265 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_fetch)
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Started
NOTE: Running task 1295 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_write_config)
NOTE: Running task 1299 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_fetch)
NOTE: Running task 1300 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_fetch)
NOTE: Running task 1313 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_fetch)
NOTE: recipe nettle-3.6-r0: task do_fetch: Succeeded
NOTE: Running task 1330 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_unpack)
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Started
NOTE: Running task 1331 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_14b463d0e5-r0: task do_deploy_setscene: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Started
NOTE: Running setscene task 754 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1332 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_unpack)
NOTE: recipe libassuan-2.5.4-r0: task do_fetch: Started
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: Running task 1333 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_unpack)
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: Running task 1334 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.0-r0: task do_fetch: Started
NOTE: recipe libassuan-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_fetch: Started
NOTE: recipe librepo-1.12.1-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Started
NOTE: Running task 1335 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_unpack)
NOTE: Running task 1336 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_unpack)
NOTE: Running task 1337 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.15-r0: task do_fetch: Started
NOTE: Running task 1338 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1339 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.73.0-r0: task do_fetch: Started
NOTE: recipe gnutls-3.6.15-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Succeeded
NOTE: Running task 1340 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_unpack)
NOTE: Running task 1341 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: Running task 1342 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.15-r0: task do_fetch: Succeeded
NOTE: Running task 1343 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_unpack)
NOTE: Running task 1344 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_unpack)
NOTE: recipe gpgme-1.15.0-r0: task do_fetch: Started
NOTE: recipe curl-7.73.0-r0: task do_fetch: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_fetch: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_fetch: Started
NOTE: recipe python3-six-1.15.0-r0: task do_fetch: Started
NOTE: Running task 1345 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_unpack)
NOTE: recipe rpm-1_4.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe python3-six-1.15.0-r0: task do_fetch: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_fetch: Started
NOTE: Running task 1346 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_unpack)
NOTE: Running task 1347 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_unpack)
NOTE: Running task 1348 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 1349 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_unpack)
NOTE: Running task 1350 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_unpack)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1351 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniparse-0.4-r0: task do_fetch: Started
NOTE: Running task 1353 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_fetch)
NOTE: Running task 1354 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_fetch)
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_fetch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_fetch: Succeeded
NOTE: Running task 1375 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_unpack)
NOTE: recipe libmodulemd-2.9.4-r0: task do_fetch: Started
NOTE: recipe nettle-3.6-r0: task do_unpack: Started
NOTE: recipe libdnf-0.55.0-r0: task do_fetch: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_fetch: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_fetch: Started
NOTE: Running task 1376 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_unpack)
NOTE: recipe libcomps-0.1.15-r0: task do_fetch: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Started
NOTE: Running task 1377 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: recipe libmodulemd-2.9.4-r0: task do_fetch: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_fetch: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_fetch: Succeeded
NOTE: Running task 1379 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: Running task 1380 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_unpack)
NOTE: Running task 1383 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_unpack)
NOTE: Running task 1384 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_unpack)
NOTE: Running task 1385 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Succeeded
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Started
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe nettle-3.6-r0: task do_unpack: Succeeded
NOTE: recipe libassuan-2.5.4-r0: task do_unpack: Started
NOTE: Running task 1386 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 756 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 757 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running task 1388 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_patch)
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: Running task 1389 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running setscene task 758 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: Running task 1390 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_unpack: Started
NOTE: Running task 1391 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe gnutls-3.6.15-r0: task do_unpack: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_14b463d0e5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1392 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.15.0-r0: task do_unpack: Started
NOTE: recipe curl-7.73.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Started
NOTE: Running task 1398 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_fetch)
NOTE: recipe librepo-1.12.1-r0: task do_unpack: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_14b463d0e5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe json-c-0.15-r0: task do_unpack: Started
NOTE: recipe python3-six-1.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1416 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_patch)
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_fetch: Started
NOTE: recipe npth-1.6-r0: task do_fetch: Started
NOTE: Running task 1433 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_patch)
NOTE: recipe libassuan-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_unpack: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_unpack: Started
NOTE: Running task 1448 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_patch)
NOTE: recipe libcomps-0.1.15-r0: task do_unpack: Started
NOTE: Running setscene task 761 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: Running task 1450 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe json-c-0.15-r0: task do_unpack: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe npth-1.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_unpack: Started
NOTE: Running task 1456 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_patch)
NOTE: recipe gpgme-1.15.0-r0: task do_unpack: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1457 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_unpack)
NOTE: Running task 1458 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_unpack)
NOTE: Running task 1459 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_fetch)
NOTE: Running task 1468 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdnf-0.55.0-r0: task do_unpack: Started
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Succeeded
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1469 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: recipe nettle-3.6-r0: task do_patch: Started
NOTE: Running task 1470 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_patch)
NOTE: Running task 1471 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: Running task 1472 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_patch)
NOTE: recipe json-c-0.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_write_config: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dnf-4.5.2-r0: task do_fetch: Started
NOTE: recipe librepo-1.12.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_patch: Started
NOTE: Running task 1511 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_patch)
NOTE: recipe libmodulemd-2.9.4-r0: task do_write_config: Succeeded
NOTE: Running task 1530 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_fetch)
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libassuan-2.5.4-r0: task do_patch: Started
NOTE: Running task 1542 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_patch)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_14b463d0e5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dnf-4.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_unpack: Succeeded
NOTE: recipe libmodulemd-2.9.4-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: Running task 1545 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_patch)
NOTE: Running task 1546 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: Running task 1547 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_unpack)
NOTE: recipe json-c-0.15-r0: task do_patch: Started
NOTE: recipe libksba-1.4.0-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe npth-1.6-r0: task do_unpack: Started
NOTE: recipe gnupg-2.2.23-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_14b463d0e5-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_unpack: Succeeded
NOTE: Running task 1590 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_patch)
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1593 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 1594 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_patch)
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Started
NOTE: Running task 1595 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_patch)
NOTE: recipe python3-six-1.15.0-r0: task do_patch: Succeeded
NOTE: Running task 1621 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gnupg-2.2.23-r0: task do_fetch: Succeeded
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_patch: Started
NOTE: Running task 1622 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_unpack)
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1650 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1651 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1663 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: recipe npth-1.6-r0: task do_unpack: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_patch: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1677 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe pinentry-1.1.0-r0: task do_fetch: Started
NOTE: Running task 1678 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_patch)
NOTE: recipe libdnf-0.55.0-r0: task do_unpack: Succeeded
NOTE: Running task 1700 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_patch)
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Started
NOTE: recipe libsolv-0.7.16-r0: task do_patch: Started
NOTE: recipe dnf-4.5.2-r0: task do_unpack: Started
NOTE: recipe libassuan-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe pinentry-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1725 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1726 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_patch)
NOTE: recipe libmodulemd-2.9.4-r0: task do_patch: Started
NOTE: Running task 1739 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_unpack)
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: Running task 1773 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcomps-0.1.15-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_patch: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_patch: Started
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1821 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.6-r0: task do_patch: Succeeded
NOTE: Running task 1822 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnupg-2.2.23-r0: task do_unpack: Started
NOTE: Running task 1833 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libsolv-0.7.16-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe npth-1.6-r0: task do_patch: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_patch: Started
NOTE: Running task 1853 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_generate_toolchain_file)
NOTE: Running task 1854 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1890 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_patch)
NOTE: recipe libdnf-0.55.0-r0: task do_patch: Started
NOTE: recipe libassuan-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gpgme-1.15.0-r0: task do_unpack: Succeeded
NOTE: recipe json-c-0.15-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pinentry-1.1.0-r0: task do_unpack: Started
NOTE: Running task 1948 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_patch)
NOTE: Running task 1949 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_generate_toolchain_file)
NOTE: Running task 1950 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Succeeded
NOTE: Running task 1975 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_deploy_source_date_epoch)
NOTE: recipe libmodulemd-2.9.4-r0: task do_patch: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_patch: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_patch: Started
NOTE: Running task 1982 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1983 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_generate_toolchain_file)
NOTE: Running task 1984 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe npth-1.6-r0: task do_patch: Succeeded
NOTE: Running task 1985 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iniparse-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsolv-0.7.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1986 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_patch)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1987 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1988 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: recipe python3-six-1.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pinentry-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1989 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1990 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_patch)
NOTE: recipe gnutls-3.6.15-r0: task do_unpack: Succeeded
NOTE: Running task 1991 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe libcomps-0.1.15-r0: task do_patch: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_patch: Started
NOTE: recipe json-c-0.15-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1992 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_patch)
NOTE: Running task 1993 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_generate_toolchain_file)
NOTE: Running task 1994 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librepo-1.12.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe json-c-0.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librepo-1.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libassuan-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-c-0.15-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.73.0-r0: task do_unpack: Succeeded
NOTE: Running task 1995 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1996 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_patch)
NOTE: recipe librepo-1.12.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_patch: Succeeded
NOTE: Running task 1999 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_deploy_source_date_epoch)
NOTE: recipe dnf-4.5.2-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2002 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe python3-iniparse-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.6.15-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2003 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_configure)
NOTE: recipe pinentry-1.1.0-r0: task do_patch: Started
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2004 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure)
NOTE: recipe libcomps-0.1.15-r0: task do_generate_toolchain_file: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.73.0-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libksba-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2005 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_configure)
NOTE: recipe librepo-1.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-c-0.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: Running task 2006 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_configure)
NOTE: Running task 2007 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_configure)
NOTE: recipe gnutls-3.6.15-r0: task do_patch: Succeeded
NOTE: Running task 2008 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Started
NOTE: recipe libdnf-0.55.0-r0: task do_patch: Succeeded
NOTE: Running task 2009 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_generate_toolchain_file)
NOTE: Running task 2010 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.6-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Started
NOTE: recipe curl-7.73.0-r0: task do_patch: Succeeded
NOTE: Running task 2011 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pinentry-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.15-r0: task do_configure: Started
NOTE: recipe npth-1.6-r0: task do_configure: Started
NOTE: Running task 2012 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk-doc-1.33.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2013 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_configure)
NOTE: recipe libksba-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.55.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libdnf-0.55.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pinentry-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 2014 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dnf-4.5.2-r0: task do_patch: Succeeded
NOTE: Running task 2015 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_generate_toolchain_file)
NOTE: Running task 2016 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2017 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_populate_lic)
NOTE: recipe gpgme-1.15.0-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2018 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libdnf-0.55.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dnf-4.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.5.2-r0: task do_populate_lic: Started
NOTE: recipe dnf-4.5.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe gpgme-1.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pinentry-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_patch: Succeeded
NOTE: recipe dnf-4.5.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2023 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 770 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dnf-4.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dnf-4.5.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_populate_lic unihash changed to 8aec06e53131c1eeaa060d7dd31d9117c1200a8351ba162474370c49556df793
NOTE: recipe gnupg-2.2.23-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gpgme-1.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2029 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_patch)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnupg-2.2.23-r0: task do_patch: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_patch: Succeeded
NOTE: Running task 2030 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_deploy_source_date_epoch)
NOTE: recipe gnupg-2.2.23-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnupg-2.2.23-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 772 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_14b463d0e5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.15-r0: task do_configure: Succeeded
NOTE: Running task 2067 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_compile)
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.15-r0: task do_compile: Started
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 783 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 784 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 786 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running task 2076 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.6-r0: task do_configure: Succeeded
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2082 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure_ptest_base)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2095 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 789 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 790 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 791 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.6-r0: task do_compile: Started
NOTE: recipe json-c-0.15-r0: task do_compile: Succeeded
NOTE: Running task 2101 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_install)
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.15-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.15-r0: task do_install: Succeeded
NOTE: Running task 2117 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_populate_sysroot)
NOTE: Running task 2118 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_package)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.15-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.15-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2119 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2120 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe json-c-0.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 4afa4bf6d6af0f9b0ec6cc54ada6a7b4e7df888546efb580903da42cd99138dd
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 2133 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: recipe json-c-0.15-r0: task do_package: Succeeded
NOTE: Running task 2134 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_packagedata)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 799 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.15-r0: task do_packagedata: Started
NOTE: Running setscene task 800 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2139 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_package_write_rpm)
NOTE: recipe json-c-0.15-r0: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2140 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe json-c-0.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 1e18228b8ee309f68af63c67d03f1749bb3f69fe65279cea47e056c09bcfd14e
NOTE: Running task 2141 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2142 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_configure: Succeeded
NOTE: Running task 2143 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_compile)
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 2144 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: recipe gtk-doc-1.33.1-r0: task do_compile: Started
NOTE: Running task 2145 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: recipe gtk-doc-1.33.1-r0: task do_compile: Succeeded
NOTE: Running task 2146 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_install: Started
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_install: Succeeded
NOTE: Running task 2151 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_populate_sysroot)
NOTE: Running task 2152 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_package)
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_populate_sysroot: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2153 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-src went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dbg went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe popt-1.18-r0: task do_compile: Started
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libsmartcols went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libmount went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libfdisk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libblkid went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swaponoff went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ptest went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-staticdev went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dev went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-doc went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-bash-completion went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dmesg went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-getopt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-kill went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-more went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mount went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mountpoint went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-su went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-umount went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-agetty went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkid went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blockdev went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe gtk-doc-1.33.1-r0: task do_populate_sysroot: Succeeded
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-cfdisk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ctrlaltdel went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fdisk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsck went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fstrim went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hwclock went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-losetup went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkswap went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-nologin went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-pivot-root went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-sulogin went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe npth-1.6-r0: task do_configure: Succeeded
NOTE: Running task 2154 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_compile)
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swapoff went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swapon went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-switch-root went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-cal went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chmem went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-choom went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chrt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-col went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-colcrt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-colrm went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-column went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-eject went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fallocate went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fincore went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-findmnt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-flock went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hardlink went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hexdump went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ionice went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe npth-1.6-r0: task do_compile: Started
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcmk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcrm went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-irqtop went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-isosize went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-last went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-logger went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-look went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsblk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lscpu went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsipc went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsirq went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lslocks went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lslogins went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsmem went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsns went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mcookie went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mesg went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-namei went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-nsenter went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-prlimit went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rename went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-renice went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rev went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-script went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-scriptlive went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-scriptreplay went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setarch went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setpriv went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setsid went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setterm went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-taskset went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ul went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-unshare went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-utmpdump went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidgen went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidparse went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wall went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wdctl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-whereis went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-write went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-addpart went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkdiscard went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkzone went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chcpu went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-delpart went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fdformat went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-findfs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsck.cramfs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsfreeze went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ldattach went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkfs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkfs.cramfs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-partx went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-raw went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-readprofile went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-resizepart went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rfkill went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rtcwake went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-runuser went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-sfdisk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swaplabel went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidd went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wipefs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-zramctl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ca went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-cs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-da went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-de went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-es went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-et went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-eu went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-fi went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-fr went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-gl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-hr went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-hu went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-id went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-it went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ja went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-nl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pt-br went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ru went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sv went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-tr went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-uk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-vi went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-zh-cn went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-zh-tw went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe npth-1.6-r0: task do_compile: Succeeded
NOTE: Running task 2155 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_install)
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 806 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2156 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe npth-1.6-r0: task do_install: Started
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2234 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 2237 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2245 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe npth-1.6-r0: task do_install: Succeeded
NOTE: Running task 2299 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package)
NOTE: Running task 2300 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_populate_sysroot)
NOTE: recipe python3-six-1.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe npth-1.6-r0: task do_package: Started
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2301 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2302 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe gtk-doc-1.33.1-r0: task do_package: Succeeded
NOTE: Running task 2303 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_packagedata)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2304 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package_write_rpm)
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_packagedata: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2305 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_package_write_rpm)
NOTE: recipe gtk-doc-1.33.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-six-1.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2306 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_configure)
NOTE: recipe libyaml-0.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_configure: Started
NOTE: recipe python3-six-1.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2307 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_compile)
NOTE: recipe python3-six-1.15.0-r0: task do_compile: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe nettle-3.6-r0: task do_compile: Succeeded
NOTE: Running task 2308 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile_ptest_base)
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2309 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe python3-six-1.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2310 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_install)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2311 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_configure)
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe python3-six-1.15.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Started
NOTE: recipe npth-1.6-r0: task do_package: Succeeded
NOTE: Running task 2312 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2313 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe npth-1.6-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe python3-six-1.15.0-r0: task do_install: Succeeded
NOTE: Running task 2314 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_populate_sysroot)
NOTE: Running task 2315 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_package)
NOTE: recipe python3-six-1.15.0-r0: task do_package: Started
NOTE: recipe python3-six-1.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2316 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Succeeded
NOTE: Running task 2317 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_compile)
NOTE: recipe npth-1.6-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Started
NOTE: recipe python3-six-1.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2318 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2319 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe npth-1.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2320 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe python3-six-1.15.0-r0: task do_package: Succeeded
NOTE: Running task 2321 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_packagedata)
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2322 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_configure)
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2323 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2324 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2325 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe python3-iniparse-0.4-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_configure: Succeeded
NOTE: Running task 2326 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_compile)
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2327 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_package_write_rpm)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2328 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe python3-iniparse-0.4-r0: task do_compile: Started
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_compile: Succeeded
NOTE: Running task 2329 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2330 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2331 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe python3-iniparse-0.4-r0: task do_install: Succeeded
NOTE: Running task 2332 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_package)
NOTE: Running task 2333 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_populate_sysroot)
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_package: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Succeeded
NOTE: Running task 2334 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_install)
NOTE: recipe libgpg-error-1.39-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Succeeded
NOTE: Running task 2335 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_compile)
NOTE: recipe libgpg-error-1.39-r0: task do_install: Succeeded
NOTE: Running task 2336 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_populate_sysroot)
NOTE: Running task 2337 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Started
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_package: Succeeded
NOTE: Running task 2338 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.4-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2339 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2340 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2341 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2342 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2343 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniparse-0.4-r0: task do_package_write_rpm: Started
NOTE: Running task 2344 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcomps-0.1.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libassuan-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libksba-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2345 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe libassuan-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2346 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_configure)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2347 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_configure)
NOTE: Running task 2348 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_configure)
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 2349 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libassuan-2.5.4-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Started
NOTE: recipe libksba-1.4.0-r0: task do_configure: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Succeeded
NOTE: Running task 2350 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_packagedata)
NOTE: recipe libcomps-0.1.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2351 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_configure)
NOTE: Running task 2352 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Started
NOTE: recipe libcomps-0.1.15-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2353 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_configure: Succeeded
NOTE: Running task 2354 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_compile)
NOTE: recipe libcomps-0.1.15-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_compile: Succeeded
NOTE: Running task 2355 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_install)
NOTE: recipe libcomps-0.1.15-r0: task do_install: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_install: Succeeded
NOTE: Running task 2356 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_package)
NOTE: Running task 2357 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_populate_sysroot)
NOTE: recipe libcomps-0.1.15-r0: task do_package: Started
NOTE: recipe libcomps-0.1.15-r0: task do_populate_sysroot: Started
NOTE: recipe libcomps-0.1.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_package: Succeeded
NOTE: Running task 2358 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_packagedata)
NOTE: recipe libcomps-0.1.15-r0: task do_packagedata: Started
NOTE: recipe libcomps-0.1.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2359 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_package_write_rpm)
NOTE: recipe libcomps-0.1.15-r0: task do_package_write_rpm: Started
NOTE: recipe libcomps-0.1.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2360 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install)
NOTE: recipe nettle-3.6-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_install: Succeeded
NOTE: Running task 2361 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2362 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_populate_sysroot)
NOTE: Running task 2363 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package)
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_package: Started
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2364 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_compile)
NOTE: recipe libksba-1.4.0-r0: task do_compile: Started
NOTE: recipe libassuan-2.5.4-r0: task do_configure: Succeeded
NOTE: Running task 2365 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_compile)
NOTE: recipe libassuan-2.5.4-r0: task do_compile: Started
NOTE: recipe libksba-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2366 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_install)
NOTE: recipe libassuan-2.5.4-r0: task do_compile: Succeeded
NOTE: Running task 2367 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_install)
NOTE: recipe libksba-1.4.0-r0: task do_install: Started
NOTE: recipe libassuan-2.5.4-r0: task do_install: Started
NOTE: recipe libksba-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2368 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_package)
NOTE: Running task 2369 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_populate_sysroot)
NOTE: recipe libassuan-2.5.4-r0: task do_install: Succeeded
NOTE: Running task 2370 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_populate_sysroot)
NOTE: Running task 2371 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_package)
NOTE: recipe libksba-1.4.0-r0: task do_package: Started
NOTE: recipe libksba-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe libassuan-2.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libassuan-2.5.4-r0: task do_package: Started
NOTE: recipe libksba-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libassuan-2.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2372 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2373 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gpgme-1.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pinentry-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pinentry-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2374 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_configure)
NOTE: recipe pinentry-1.1.0-r0: task do_configure: Started
NOTE: recipe gpgme-1.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2375 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_configure)
NOTE: recipe gpgme-1.15.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 2376 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_compile)
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Started
NOTE: recipe libksba-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2377 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_packagedata)
NOTE: recipe libassuan-2.5.4-r0: task do_package: Succeeded
NOTE: Running task 2378 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_packagedata)
NOTE: recipe libksba-1.4.0-r0: task do_packagedata: Started
NOTE: recipe libassuan-2.5.4-r0: task do_packagedata: Started
NOTE: recipe libksba-1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2379 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_package_write_rpm)
NOTE: recipe libassuan-2.5.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2380 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_package_write_rpm)
NOTE: recipe libksba-1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe libassuan-2.5.4-r0: task do_package_write_rpm: Started
NOTE: recipe nettle-3.6-r0: task do_package: Succeeded
NOTE: Running task 2381 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_packagedata)
NOTE: recipe nettle-3.6-r0: task do_packagedata: Started
NOTE: recipe libassuan-2.5.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe nettle-3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2382 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package_write_rpm)
NOTE: recipe libksba-1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2383 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_compile)
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Started
NOTE: recipe pinentry-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2384 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_compile)
NOTE: recipe pinentry-1.1.0-r0: task do_compile: Started
NOTE: recipe pinentry-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2385 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_install)
NOTE: recipe pinentry-1.1.0-r0: task do_install: Started
NOTE: recipe pinentry-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2386 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_package)
NOTE: recipe pinentry-1.1.0-r0: task do_package: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2387 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_install)
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 2388 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_populate_sysroot)
NOTE: Running task 2389 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package)
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2390 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pinentry-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2391 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_packagedata)
NOTE: recipe pinentry-1.1.0-r0: task do_packagedata: Started
NOTE: recipe pinentry-1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2392 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_package_write_rpm)
NOTE: recipe pinentry-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe pinentry-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 2393 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_compile: Succeeded
NOTE: Running task 2394 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_install)
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2395 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_install: Succeeded
NOTE: Running task 2396 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot)
NOTE: Running task 2397 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2398 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_configure)
NOTE: recipe rpm-1_4.16.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2399 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmodulemd-2.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2400 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_configure)
NOTE: recipe libmodulemd-2.9.4-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package: Succeeded
NOTE: Running task 2401 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata: Started
NOTE: recipe gpgme-1.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2402 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2403 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm)
NOTE: recipe gpgme-1.15.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_configure: Succeeded
NOTE: Running task 2404 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_compile)
NOTE: recipe libmodulemd-2.9.4-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmodulemd-2.9.4-r0: task do_compile: Succeeded
NOTE: Running task 2405 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_install)
NOTE: recipe libmodulemd-2.9.4-r0: task do_install: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_install: Succeeded
NOTE: Running task 2406 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_sysroot)
NOTE: Running task 2407 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package)
NOTE: recipe libmodulemd-2.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_package: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmodulemd-2.9.4-r0: task do_package: Succeeded
NOTE: Running task 2408 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata)
NOTE: recipe libmodulemd-2.9.4-r0: task do_packagedata: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2409 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package_write_rpm)
NOTE: recipe libmodulemd-2.9.4-r0: task do_package_write_rpm: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2410 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_compile)
NOTE: recipe rpm-1_4.16.0-r0: task do_compile: Started
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2411 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_install)
NOTE: recipe libunistring-0.9.10-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2412 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2413 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package)
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2414 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2415 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_configure)
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2416 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2417 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2418 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_install)
NOTE: recipe rpm-1_4.16.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_install: Succeeded
NOTE: Running task 2419 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_populate_sysroot)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2420 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_package)
NOTE: recipe rpm-1_4.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2421 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe gpgme-1.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2422 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_install)
NOTE: recipe libsolv-0.7.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-1.15.0-r0: task do_install: Started
NOTE: recipe libsolv-0.7.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2423 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_configure)
NOTE: recipe libsolv-0.7.16-r0: task do_configure: Started
NOTE: recipe gpgme-1.15.0-r0: task do_install: Succeeded
NOTE: Running task 2424 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_populate_sysroot)
NOTE: Running task 2425 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_package)
NOTE: recipe gpgme-1.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe gpgme-1.15.0-r0: task do_package: Started
NOTE: recipe gpgme-1.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_configure: Succeeded
NOTE: Running task 2426 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_compile)
NOTE: recipe libsolv-0.7.16-r0: task do_compile: Started
NOTE: recipe gpgme-1.15.0-r0: task do_package: Succeeded
NOTE: Running task 2427 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_packagedata)
NOTE: recipe gpgme-1.15.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_package: Succeeded
NOTE: Running task 2428 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_packagedata)
NOTE: recipe gpgme-1.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2429 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.0-r0: task do_packagedata: Started
NOTE: recipe gpgme-1.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2430 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.16-r0: task do_compile: Succeeded
NOTE: Running task 2431 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_install)
NOTE: recipe libsolv-0.7.16-r0: task do_install: Started
NOTE: recipe libsolv-0.7.16-r0: task do_install: Succeeded
NOTE: Running task 2432 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_populate_sysroot)
NOTE: Running task 2433 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_package)
NOTE: recipe libsolv-0.7.16-r0: task do_populate_sysroot: Started
NOTE: recipe libsolv-0.7.16-r0: task do_package: Started
NOTE: recipe libsolv-0.7.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_package: Succeeded
NOTE: Running task 2434 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_packagedata)
NOTE: recipe libsolv-0.7.16-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.16-r0: task do_packagedata: Succeeded
NOTE: Running task 2435 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_package_write_rpm)
NOTE: recipe libsolv-0.7.16-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2436 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_compile)
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2437 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_install)
NOTE: recipe libidn2-2.3.0-r0: task do_install: Started
NOTE: recipe libidn2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2438 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot)
NOTE: Running task 2439 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package)
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2440 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2441 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_configure)
NOTE: recipe gnutls-3.6.15-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 2442 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata)
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2443 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_configure: Succeeded
NOTE: Running task 2444 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_compile)
NOTE: recipe gnutls-3.6.15-r0: task do_compile: Started
NOTE: recipe gnutls-3.6.15-r0: task do_compile: Succeeded
NOTE: Running task 2445 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_install)
NOTE: recipe gnutls-3.6.15-r0: task do_install: Started
NOTE: recipe gnutls-3.6.15-r0: task do_install: Succeeded
NOTE: Running task 2446 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_populate_sysroot)
NOTE: Running task 2447 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_package)
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package: Started
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2448 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2449 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.73.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnupg-2.2.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.73.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2450 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_configure)
NOTE: recipe gnupg-2.2.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2451 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_configure)
NOTE: recipe curl-7.73.0-r0: task do_configure: Started
NOTE: recipe gnupg-2.2.23-r0: task do_configure: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package: Succeeded
NOTE: Running task 2452 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_packagedata)
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2453 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_package_write_rpm)
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_configure: Succeeded
NOTE: Running task 2454 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_compile)
NOTE: recipe gnupg-2.2.23-r0: task do_compile: Started
NOTE: recipe gnupg-2.2.23-r0: task do_compile: Succeeded
NOTE: Running task 2455 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_install)
NOTE: recipe gnupg-2.2.23-r0: task do_install: Started
NOTE: recipe gnupg-2.2.23-r0: task do_install: Succeeded
NOTE: Running task 2456 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_package)
NOTE: recipe gnupg-2.2.23-r0: task do_package: Started
NOTE: recipe curl-7.73.0-r0: task do_configure: Succeeded
NOTE: Running task 2457 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_compile)
NOTE: recipe curl-7.73.0-r0: task do_compile: Started
NOTE: recipe gnupg-2.2.23-r0: task do_package: Succeeded
NOTE: Running task 2458 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_packagedata)
NOTE: recipe gnupg-2.2.23-r0: task do_packagedata: Started
NOTE: recipe gnupg-2.2.23-r0: task do_packagedata: Succeeded
NOTE: Running task 2459 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_package_write_rpm)
NOTE: recipe curl-7.73.0-r0: task do_compile: Succeeded
NOTE: Running task 2460 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_install)
NOTE: recipe gnupg-2.2.23-r0: task do_package_write_rpm: Started
NOTE: recipe curl-7.73.0-r0: task do_install: Started
NOTE: recipe curl-7.73.0-r0: task do_install: Succeeded
NOTE: Running task 2461 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_populate_sysroot)
NOTE: Running task 2462 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_package)
NOTE: recipe curl-7.73.0-r0: task do_package: Started
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2463 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe librepo-1.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librepo-1.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2464 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_configure)
NOTE: recipe librepo-1.12.1-r0: task do_configure: Started
NOTE: recipe curl-7.73.0-r0: task do_package: Succeeded
NOTE: Running task 2465 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_packagedata)
NOTE: recipe curl-7.73.0-r0: task do_packagedata: Started
NOTE: recipe librepo-1.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2466 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_compile)
NOTE: recipe librepo-1.12.1-r0: task do_compile: Started
NOTE: recipe curl-7.73.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2467 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_package_write_rpm)
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm: Started
NOTE: recipe librepo-1.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2468 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_install)
NOTE: recipe librepo-1.12.1-r0: task do_install: Started
NOTE: recipe librepo-1.12.1-r0: task do_install: Succeeded
NOTE: Running task 2469 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_populate_sysroot)
NOTE: Running task 2470 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_package)
NOTE: recipe librepo-1.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe librepo-1.12.1-r0: task do_package: Started
NOTE: recipe librepo-1.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2471 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdnf-0.55.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2472 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_configure)
NOTE: recipe libdnf-0.55.0-r0: task do_configure: Started
NOTE: recipe librepo-1.12.1-r0: task do_package: Succeeded
NOTE: Running task 2473 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_packagedata)
NOTE: recipe librepo-1.12.1-r0: task do_packagedata: Started
NOTE: recipe librepo-1.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2474 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_package_write_rpm)
NOTE: recipe librepo-1.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe librepo-1.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_configure: Succeeded
NOTE: Running task 2475 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_compile)
NOTE: recipe libdnf-0.55.0-r0: task do_compile: Started
NOTE: recipe libdnf-0.55.0-r0: task do_compile: Succeeded
NOTE: Running task 2476 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_install)
NOTE: recipe libdnf-0.55.0-r0: task do_install: Started
NOTE: recipe libdnf-0.55.0-r0: task do_install: Succeeded
NOTE: Running task 2477 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_package)
NOTE: Running task 2478 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_populate_sysroot)
NOTE: recipe libdnf-0.55.0-r0: task do_package: Started
NOTE: recipe libdnf-0.55.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdnf-0.55.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2479 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe dnf-4.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dnf-4.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2480 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_configure)
NOTE: recipe dnf-4.5.2-r0: task do_configure: Started
NOTE: recipe dnf-4.5.2-r0: task do_configure: Succeeded
NOTE: Running task 2481 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_compile)
NOTE: recipe dnf-4.5.2-r0: task do_compile: Started
NOTE: recipe dnf-4.5.2-r0: task do_compile: Succeeded
NOTE: Running task 2482 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_install)
NOTE: recipe dnf-4.5.2-r0: task do_install: Started
NOTE: recipe dnf-4.5.2-r0: task do_install: Succeeded
NOTE: Running task 2483 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_populate_sysroot)
NOTE: recipe dnf-4.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libdnf-0.55.0-r0: task do_package: Succeeded
NOTE: recipe dnf-4.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2484 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_packagedata)
NOTE: recipe libdnf-0.55.0-r0: task do_packagedata: Started
NOTE: recipe libdnf-0.55.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2485 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_package)
NOTE: Running task 2486 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_package_write_rpm)
NOTE: recipe dnf-4.5.2-r0: task do_package: Started
NOTE: recipe libdnf-0.55.0-r0: task do_package_write_rpm: Started
NOTE: recipe dnf-4.5.2-r0: task do_package: Succeeded
NOTE: Running task 2487 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_packagedata)
NOTE: recipe dnf-4.5.2-r0: task do_packagedata: Started
NOTE: recipe dnf-4.5.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2488 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_package_write_rpm)
NOTE: Running task 2489 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_package_qa)
NOTE: recipe dnf-4.5.2-r0: task do_package_write_rpm: Started
NOTE: recipe dnf-4.5.2-r0: task do_package_qa: Started
NOTE: recipe dnf-4.5.2-r0: task do_package_qa: Succeeded
NOTE: recipe dnf-4.5.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2490 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2490 tasks of which 2125 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 147 ERROR messages shown, returning a non-zero exit code.

--===============4000030297056990263==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-dnf-upgrade-4.4.0-4.5.2.patch"

From 0ae0541f8aa92814a9b8507cf61b405a28c076a6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 19 Dec 2020 23:43:21 +0000
Subject: [PATCH] dnf: upgrade 4.4.0 -> 4.5.2

---
 meta/recipes-devtools/dnf/{dnf_4.4.0.bb => dnf_4.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.4.0.bb => dnf_4.5.2.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.4.0.bb b/meta/recipes-devtools/dnf/dnf_4.5.2.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.4.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.5.2.bb
index dff6fe6c25..e1b0e1a132 100644
--- a/meta/recipes-devtools/dnf/dnf_4.4.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.5.2.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0001-dnf-write-the-log-lock-to-root.patch \
            "
 
-SRCREV = "b9b7623892f551da201bffd03187d703242b00e9"
+SRCREV = "36a3ffaee4db76a7efe7d40f4e42ce679b6a6920"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.20.1


--===============4000030297056990263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (0 cached, 807 parsed). 1416 targets, 66 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.2+snapshot-fed3ceade259a7a54a62648e51c3520658f0951b"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fed3ceade259a7a54a62648e51c3520658f0951b"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 235 Found 85 Missed 150 Current 570 (36% match, 81% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 572 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 573 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 574 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 575 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 580 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 581 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 582 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 583 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 584 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 592 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 619 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 630 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 632 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 647 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 648 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 649 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 660 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 661 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 662 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 663 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 664 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 665 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 666 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 667 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 668 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: Running setscene task 669 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 670 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 676 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 749 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1002 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_fetch)
NOTE: Running task 1082 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_fetch)
NOTE: Running task 1083 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_fetch)
NOTE: Running task 1109 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_fetch)
NOTE: Running task 1150 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_fetch)
NOTE: Running task 1151 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_fetch)
NOTE: Running task 1156 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1157 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running task 1158 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_fetch)
NOTE: Running task 1187 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_fetch)
NOTE: Running task 1190 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_fetch)
NOTE: Running task 1192 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_fetch)
NOTE: Running task 1193 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_fetch)
NOTE: Running task 1196 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_fetch)
NOTE: Running task 1201 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 1224 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: Running task 1237 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_fetch)
NOTE: Running task 1238 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_fetch)
NOTE: Running task 1261 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_fetch)
NOTE: Running task 1264 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: Running task 1265 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_fetch)
NOTE: Running task 1295 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_write_config)
NOTE: Running task 1299 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_fetch)
NOTE: Running task 1300 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_fetch)
NOTE: Running task 1313 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_fetch)
NOTE: recipe nettle-3.6-r0: task do_fetch: Started
NOTE: recipe nettle-3.6-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Started
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1314 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_unpack)
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Succeeded
NOTE: Running setscene task 751 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Started
NOTE: recipe libassuan-2.5.4-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Started
NOTE: Running task 1315 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_fetch: Started
NOTE: recipe gnutls-3.6.15-r0: task do_fetch: Started
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe libassuan-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 1316 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_unpack)
NOTE: Running task 1317 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_unpack)
NOTE: Running task 1318 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_unpack)
NOTE: Running task 1319 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe librepo-1.12.1-r0: task do_fetch: Started
NOTE: Running task 1320 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Started
NOTE: recipe gnutls-3.6.15-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.15-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_fetch: Started
NOTE: recipe curl-7.73.0-r0: task do_fetch: Started
NOTE: Running setscene task 752 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running task 1321 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_unpack)
NOTE: recipe libsolv-0.7.16-r0: task do_fetch: Started
NOTE: Running task 1322 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_unpack)
NOTE: Running task 1323 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1324 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_unpack)
NOTE: Running task 1325 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-c-0.15-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Succeeded
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: Running task 1337 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_unpack)
NOTE: recipe curl-7.73.0-r0: task do_fetch: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe python3-six-1.15.0-r0: task do_fetch: Started
NOTE: recipe gpgme-1.15.0-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: Running task 1338 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_fetch: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_fetch: Started
NOTE: Running task 1339 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_unpack)
NOTE: recipe libdnf-0.55.0-r0: task do_fetch: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_fetch: Started
NOTE: Running task 1340 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_unpack)
NOTE: Running task 1341 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_unpack)
NOTE: recipe libmodulemd-2.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 1342 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_unpack)
NOTE: Running task 1343 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 1344 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1345 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: Running task 1346 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_unpack)
NOTE: Running task 1347 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_unpack)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Started
NOTE: Running task 1348 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_unpack)
NOTE: recipe python3-iniparse-0.4-r0: task do_fetch: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1349 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: Running task 1350 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk-doc-1.33.1-r0: task do_fetch: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_fetch: Started
NOTE: Running task 1351 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_unpack)
NOTE: Running task 1352 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdnf-0.55.0-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 753 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running task 1353 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_unpack)
NOTE: recipe libcomps-0.1.15-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Succeeded
NOTE: recipe nettle-3.6-r0: task do_unpack: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1354 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_unpack)
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Started
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Started
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libassuan-2.5.4-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Started
NOTE: recipe gnutls-3.6.15-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_unpack: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 1361 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_fetch)
NOTE: recipe rpm-1_4.16.0-r0: task do_unpack: Started
NOTE: Running task 1362 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_fetch)
NOTE: recipe nettle-3.6-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_unpack: Started
NOTE: recipe librepo-1.12.1-r0: task do_unpack: Started
NOTE: Running setscene task 754 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 755 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: Running task 1363 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: Running task 1364 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: Running task 1367 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_unpack)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Started
NOTE: recipe json-c-0.15-r0: task do_unpack: Started
NOTE: recipe libsolv-0.7.16-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: Running task 1387 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: Running task 1388 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.9.4-r0: task do_unpack: Started
NOTE: Running task 1389 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_unpack: Started
NOTE: Running task 1390 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: recipe json-c-0.15-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_unpack: Started
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: Running task 1391 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_patch)
NOTE: recipe gtk-doc-1.33.1-r0: task do_unpack: Started
NOTE: recipe libdnf-0.55.0-r0: task do_unpack: Started
NOTE: Running task 1397 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_fetch)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.6-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe json-c-0.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_write_config: Started
NOTE: recipe python3-six-1.15.0-r0: task do_unpack: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_fetch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: Running task 1398 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_patch)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libassuan-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe json-c-0.15-r0: task do_patch: Started
NOTE: Running task 1400 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_patch)
NOTE: recipe npth-1.6-r0: task do_fetch: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_write_config: Succeeded
NOTE: Running task 1452 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_fetch)
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1476 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_fetch)
NOTE: recipe python3-iniparse-0.4-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1485 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_patch)
NOTE: recipe dnf-4.5.2-r0: task do_fetch: Started
NOTE: Running task 1486 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1501 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_unpack)
NOTE: Running task 1503 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe python3-six-1.15.0-r0: task do_patch: Started
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 1544 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_patch)
NOTE: recipe libassuan-2.5.4-r0: task do_patch: Started
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_fetch: Started
NOTE: recipe pinentry-1.1.0-r0: task do_fetch: Started
NOTE: recipe npth-1.6-r0: task do_fetch: Succeeded
NOTE: Running task 1635 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_unpack)
NOTE: recipe python3-six-1.15.0-r0: task do_patch: Succeeded
NOTE: Running task 1636 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniparse-0.4-r0: task do_patch: Started
NOTE: recipe gnupg-2.2.23-r0: task do_fetch: Succeeded
NOTE: Running task 1637 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1638 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_unpack)
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: recipe libmodulemd-2.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 1654 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pinentry-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_unpack: Succeeded
NOTE: recipe dnf-4.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Started
NOTE: recipe libksba-1.4.0-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Started
NOTE: recipe npth-1.6-r0: task do_unpack: Started
NOTE: Running task 1655 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_patch)
NOTE: Running task 1656 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: Running task 1657 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_unpack)
NOTE: Running task 1658 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_unpack)
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Succeeded
NOTE: Running task 1702 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_patch)
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 1835 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1836 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1855 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 757 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 758 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Started
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnupg-2.2.23-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe librepo-1.12.1-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_patch: Started
NOTE: recipe dnf-4.5.2-r0: task do_unpack: Started
NOTE: recipe pinentry-1.1.0-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_unpack: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_unpack: Succeeded
NOTE: Running task 1921 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_patch)
NOTE: Running task 1922 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_patch)
NOTE: recipe libassuan-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.6-r0: task do_patch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: Running task 1923 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1924 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1925 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcomps-0.1.15-r0: task do_patch: Started
NOTE: recipe libsolv-0.7.16-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Succeeded
NOTE: Running task 1954 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libassuan-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe npth-1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1955 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_patch)
NOTE: recipe libksba-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_patch: Succeeded
NOTE: Running task 1956 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_patch)
NOTE: Running task 1957 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk-doc-1.33.1-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Succeeded
NOTE: Running task 1958 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_patch)
NOTE: recipe libdnf-0.55.0-r0: task do_unpack: Succeeded
NOTE: Running task 1959 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_patch)
NOTE: Running task 1960 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pinentry-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1961 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 761 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: Running task 1962 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_generate_toolchain_file)
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Succeeded
NOTE: Running task 1963 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_deploy_source_date_epoch)
NOTE: Running task 1967 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_patch)
NOTE: Running task 1969 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk-doc-1.33.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmodulemd-2.9.4-r0: task do_patch: Succeeded
NOTE: Running task 1970 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1971 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe npth-1.6-r0: task do_patch: Started
NOTE: recipe json-c-0.15-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1972 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: recipe json-c-0.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1973 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_patch)
NOTE: Running task 1974 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_generate_toolchain_file)
NOTE: Running task 1975 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libassuan-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_patch: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librepo-1.12.1-r0: task do_patch: Succeeded
NOTE: Running task 1976 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_patch)
NOTE: recipe gtk-doc-1.33.1-r0: task do_patch: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1980 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_generate_toolchain_file)
NOTE: Running task 1981 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe dnf-4.5.2-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Started
NOTE: recipe libdnf-0.55.0-r0: task do_patch: Started
NOTE: recipe libsolv-0.7.16-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1982 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.16-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1983 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1985 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_patch)
NOTE: recipe libcomps-0.1.15-r0: task do_patch: Succeeded
NOTE: Running task 1990 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_generate_toolchain_file)
NOTE: recipe gpgme-1.15.0-r0: task do_unpack: Succeeded
NOTE: recipe pinentry-1.1.0-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1991 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 1992 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_patch)
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe json-c-0.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe npth-1.6-r0: task do_patch: Succeeded
NOTE: Running task 1993 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe json-c-0.15-r0: task do_generate_toolchain_file: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1994 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_configure)
NOTE: recipe python3-iniparse-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe dnf-4.5.2-r0: task do_patch: Started
NOTE: recipe libksba-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.15-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1995 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcomps-0.1.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librepo-1.12.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_generate_toolchain_file: Started
NOTE: recipe nettle-3.6-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Succeeded
NOTE: Running task 1996 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1997 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gpgme-1.15.0-r0: task do_patch: Started
NOTE: recipe libsolv-0.7.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmodulemd-2.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1998 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_configure)
NOTE: recipe pinentry-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Started
NOTE: Running task 1999 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2000 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_configure)
NOTE: recipe libksba-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_patch: Succeeded
NOTE: Running task 2001 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe librepo-1.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Started
NOTE: Running task 2002 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_configure)
NOTE: recipe pinentry-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-c-0.15-r0: task do_configure: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libksba-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_patch: Succeeded
NOTE: Running task 2003 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_generate_toolchain_file)
NOTE: Running task 2004 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_deploy_source_date_epoch)
NOTE: recipe npth-1.6-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pinentry-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_unpack: Succeeded
NOTE: Running task 2005 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_patch)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2006 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_configure)
NOTE: recipe libdnf-0.55.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.55.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe dnf-4.5.2-r0: task do_patch: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2007 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_generate_toolchain_file)
NOTE: Running task 2008 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2009 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_populate_lic)
NOTE: recipe gnutls-3.6.15-r0: task do_patch: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 2010 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_unpack: Succeeded
NOTE: Running task 2015 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_patch)
NOTE: recipe dnf-4.5.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe dnf-4.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.6.15-r0: task do_patch: Succeeded
NOTE: Running task 2016 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_deploy_source_date_epoch)
NOTE: recipe dnf-4.5.2-r0: task do_populate_lic: Started
NOTE: recipe dnf-4.5.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gpgme-1.15.0-r0: task do_patch: Succeeded
NOTE: Running task 2017 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.73.0-r0: task do_patch: Started
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.5.2-r0: task do_populate_lic: Succeeded
NOTE: recipe dnf-4.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_populate_lic unihash changed to 8aec06e53131c1eeaa060d7dd31d9117c1200a8351ba162474370c49556df793
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnupg-2.2.23-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_patch: Succeeded
NOTE: Running task 2018 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_patch)
NOTE: Running task 2019 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2020 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gpgme-1.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_patch: Started
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_patch: Succeeded
NOTE: Running task 2021 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_deploy_source_date_epoch)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnupg-2.2.23-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 767 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 768 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 771 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.15-r0: task do_configure: Succeeded
NOTE: Running task 2031 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_compile)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.15-r0: task do_compile: Started
NOTE: recipe json-c-0.15-r0: task do_compile: Succeeded
NOTE: Running task 2032 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_install)
NOTE: recipe json-c-0.15-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_configure: Succeeded
NOTE: Running task 2033 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure_ptest_base)
NOTE: recipe json-c-0.15-r0: task do_install: Succeeded
NOTE: Running task 2034 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_populate_sysroot)
NOTE: Running task 2035 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_package)
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2036 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile)
NOTE: recipe json-c-0.15-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.15-r0: task do_package: Started
NOTE: recipe nettle-3.6-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 2046 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.15-r0: task do_package: Succeeded
NOTE: Running task 2047 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_packagedata)
NOTE: recipe json-c-0.15-r0: task do_packagedata: Started
NOTE: recipe json-c-0.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2048 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_package_write_rpm)
NOTE: recipe json-c-0.15-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 783 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 784 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 786 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running task 2084 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 788 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 789 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 790 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2107 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_configure: Succeeded
NOTE: Running task 2108 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_compile)
NOTE: recipe gtk-doc-1.33.1-r0: task do_compile: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_compile: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 2109 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_install)
NOTE: Running task 2110 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: Running task 2111 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_install: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_install: Succeeded
NOTE: Running task 2112 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_populate_sysroot)
NOTE: Running task 2113 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_package)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2114 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2115 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2116 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe gtk-doc-1.33.1-r0: task do_populate_sysroot: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe npth-1.6-r0: task do_configure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 66ffbf0739ea4a70f7fc262363902d5eed0c8052d475b1a42659dcacb986d5de
NOTE: Running task 2132 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_compile)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe npth-1.6-r0: task do_compile: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe npth-1.6-r0: task do_compile: Succeeded
NOTE: Running task 2145 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2146 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe npth-1.6-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe npth-1.6-r0: task do_install: Succeeded
NOTE: Running task 2147 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package)
NOTE: Running task 2148 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_populate_sysroot)
NOTE: recipe npth-1.6-r0: task do_package: Started
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 2149 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2150 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2151 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_package: Succeeded
NOTE: Running task 2152 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_packagedata)
NOTE: recipe gtk-doc-1.33.1-r0: task do_packagedata: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2153 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2154 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gtk-doc-1.33.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2155 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_package_write_rpm: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c23f7cf00e40a11df88ab6ad9600ca1a11c71db53b6ce62b3aebf6c2f935e59e
NOTE: Running task 2156 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2157 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2158 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 800 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 801 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe npth-1.6-r0: task do_package: Succeeded
NOTE: Running task 2163 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_packagedata)
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Succeeded
NOTE: Running task 2164 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_compile)
NOTE: recipe npth-1.6-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Started
NOTE: recipe npth-1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2165 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package_write_rpm)
NOTE: recipe npth-1.6-r0: task do_package_write_rpm: Started
NOTE: recipe nettle-3.6-r0: task do_compile: Succeeded
NOTE: Running task 2166 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2167 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe npth-1.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2168 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2169 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2170 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2171 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2172 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Succeeded
NOTE: Running task 2173 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2174 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: recipe libgpg-error-1.39-r0: task do_install: Started
NOTE: Running task 2175 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_install: Succeeded
NOTE: Running task 2176 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_populate_sysroot)
NOTE: Running task 2177 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package)
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Started
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2178 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2179 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2180 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libassuan-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libksba-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libassuan-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2181 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_configure)
NOTE: Running task 2182 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_configure)
NOTE: recipe libassuan-2.5.4-r0: task do_configure: Started
NOTE: recipe libksba-1.4.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2183 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 2184 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2185 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package_write_rpm)
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2186 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2187 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Succeeded
NOTE: Running task 2188 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_packagedata)
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2189 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package_write_rpm)
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-src went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dbg went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libsmartcols went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libmount went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libfdisk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libblkid went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swaponoff went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ptest went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-staticdev went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dev went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-doc went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-bash-completion went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dmesg went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-getopt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-kill went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-more went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Succeeded
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mount went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mountpoint went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-su went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-umount went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-agetty went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkid went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blockdev went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-cfdisk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ctrlaltdel went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fdisk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsck went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fstrim went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hwclock went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-losetup went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkswap went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-nologin went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-pivot-root went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-sulogin went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swapoff went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swapon went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-switch-root went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-cal went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chmem went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-choom went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chrt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-col went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-colcrt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-colrm went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-column went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-eject went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fallocate went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fincore went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-findmnt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-flock went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hardlink went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hexdump went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ionice went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcmk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcrm went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-irqtop went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-isosize went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-last went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-logger went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-look went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsblk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lscpu went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsipc went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsirq went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lslocks went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lslogins went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsmem went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsns went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mcookie went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mesg went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-namei went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-nsenter went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-prlimit went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rename went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-renice went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rev went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-script went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-scriptlive went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-scriptreplay went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setarch went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setpriv went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setsid went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setterm went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-taskset went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ul went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-unshare went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-utmpdump went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidgen went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidparse went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wall went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wdctl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-whereis went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-write went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-addpart went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkdiscard went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkzone went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chcpu went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-delpart went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fdformat went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-findfs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsck.cramfs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsfreeze went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ldattach went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkfs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkfs.cramfs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-partx went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-raw went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-readprofile went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-resizepart went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rfkill went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rtcwake went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-runuser went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-sfdisk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swaplabel went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidd went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wipefs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-zramctl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ca went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-cs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-da went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-de went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-es went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-et went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-eu went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-fi went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-fr went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-gl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-hr went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-hu went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-id went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-it went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ja went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-nl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pt-br went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ru went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sv went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-tr went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-uk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-vi went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-zh-cn went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-zh-tw went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 806 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2271 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2274 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2279 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-six-1.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcomps-0.1.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2336 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install)
NOTE: recipe nettle-3.6-r0: task do_install: Started
NOTE: recipe python3-six-1.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2337 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_configure)
NOTE: Running task 2338 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_configure)
NOTE: recipe nettle-3.6-r0: task do_install: Succeeded
NOTE: Running task 2339 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install_ptest_base)
NOTE: recipe python3-six-1.15.0-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.15-r0: task do_configure: Started
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-six-1.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2340 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_compile)
NOTE: recipe python3-six-1.15.0-r0: task do_compile: Started
NOTE: recipe python3-six-1.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2341 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_install)
NOTE: recipe python3-six-1.15.0-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2342 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_populate_sysroot)
NOTE: Running task 2343 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package)
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_package: Started
NOTE: recipe libcomps-0.1.15-r0: task do_configure: Succeeded
NOTE: Running task 2344 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_compile)
NOTE: recipe libcomps-0.1.15-r0: task do_compile: Started
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_install: Succeeded
NOTE: Running task 2345 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_populate_sysroot)
NOTE: Running task 2346 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_package)
NOTE: recipe python3-six-1.15.0-r0: task do_package: Started
NOTE: recipe libksba-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2347 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_compile)
NOTE: recipe libcomps-0.1.15-r0: task do_compile: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2348 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_install)
NOTE: recipe libksba-1.4.0-r0: task do_compile: Started
NOTE: recipe libcomps-0.1.15-r0: task do_install: Started
NOTE: recipe libcomps-0.1.15-r0: task do_install: Succeeded
NOTE: Running task 2349 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_package)
NOTE: Running task 2350 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_populate_sysroot)
NOTE: recipe libassuan-2.5.4-r0: task do_configure: Succeeded
NOTE: Running task 2351 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_compile)
NOTE: recipe python3-six-1.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2352 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcomps-0.1.15-r0: task do_populate_sysroot: Started
NOTE: recipe libcomps-0.1.15-r0: task do_package: Started
NOTE: recipe libassuan-2.5.4-r0: task do_compile: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2353 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_configure)
NOTE: recipe libcomps-0.1.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_package: Succeeded
NOTE: Running task 2354 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Started
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2355 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_configure)
NOTE: recipe libassuan-2.5.4-r0: task do_compile: Succeeded
NOTE: Running task 2356 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_install)
NOTE: recipe python3-iniparse-0.4-r0: task do_configure: Started
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2357 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_package_write_rpm)
NOTE: recipe libassuan-2.5.4-r0: task do_install: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_configure: Succeeded
NOTE: Running task 2358 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_compile)
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe libksba-1.4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_compile: Started
NOTE: Running task 2359 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_install)
NOTE: recipe python3-iniparse-0.4-r0: task do_compile: Succeeded
NOTE: Running task 2360 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_install)
NOTE: recipe libksba-1.4.0-r0: task do_install: Started
NOTE: recipe libassuan-2.5.4-r0: task do_install: Succeeded
NOTE: Running task 2361 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_populate_sysroot)
NOTE: Running task 2362 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_package)
NOTE: recipe python3-iniparse-0.4-r0: task do_install: Started
NOTE: recipe libassuan-2.5.4-r0: task do_package: Started
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libassuan-2.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libcomps-0.1.15-r0: task do_package: Succeeded
NOTE: Running task 2363 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_packagedata)
NOTE: recipe libksba-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2364 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_package)
NOTE: Running task 2365 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_populate_sysroot)
NOTE: recipe libcomps-0.1.15-r0: task do_packagedata: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_install: Succeeded
NOTE: Running task 2366 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_package)
NOTE: Running task 2367 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_populate_sysroot)
NOTE: recipe libksba-1.4.0-r0: task do_package: Started
NOTE: recipe libksba-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_package: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libcomps-0.1.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2368 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_package_write_rpm)
NOTE: recipe libcomps-0.1.15-r0: task do_package_write_rpm: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 2369 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_compile)
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Started
NOTE: recipe libcomps-0.1.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_package: Succeeded
NOTE: Running task 2370 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Succeeded
NOTE: Running task 2371 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_compile)
NOTE: recipe python3-iniparse-0.4-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_compile: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2372 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_package_write_rpm)
NOTE: recipe libksba-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_package_write_rpm: Started
NOTE: recipe nettle-3.6-r0: task do_package: Succeeded
NOTE: Running task 2373 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_packagedata)
NOTE: recipe nettle-3.6-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2374 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_compile)
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Started
NOTE: recipe libksba-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2375 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libassuan-2.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2376 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2377 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libksba-1.4.0-r0: task do_packagedata: Started
NOTE: recipe gpgme-1.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pinentry-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2378 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package_write_rpm)
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe libassuan-2.5.4-r0: task do_package: Succeeded
NOTE: Running task 2379 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_packagedata)
NOTE: recipe pinentry-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2380 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_configure)
NOTE: recipe libassuan-2.5.4-r0: task do_packagedata: Started
NOTE: recipe pinentry-1.1.0-r0: task do_configure: Started
NOTE: recipe libksba-1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2381 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_package_write_rpm)
NOTE: recipe libksba-1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe gpgme-1.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2382 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_configure)
NOTE: recipe gpgme-1.15.0-r0: task do_configure: Started
NOTE: recipe libksba-1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libassuan-2.5.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2383 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_package_write_rpm)
NOTE: recipe libassuan-2.5.4-r0: task do_package_write_rpm: Started
NOTE: recipe libassuan-2.5.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2384 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_install)
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_populate_sysroot)
NOTE: Running task 2386 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package)
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2387 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2388 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_configure)
NOTE: recipe pinentry-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2389 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_compile)
NOTE: recipe rpm-1_4.16.0-r0: task do_configure: Started
NOTE: recipe pinentry-1.1.0-r0: task do_compile: Started
NOTE: recipe pinentry-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2390 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_install)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 2391 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_packagedata)
NOTE: recipe pinentry-1.1.0-r0: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Started
NOTE: recipe pinentry-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2392 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_package)
NOTE: recipe pinentry-1.1.0-r0: task do_package: Started
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2393 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pinentry-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2394 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_packagedata)
NOTE: recipe pinentry-1.1.0-r0: task do_packagedata: Started
NOTE: recipe pinentry-1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2395 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_package_write_rpm)
NOTE: recipe pinentry-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe pinentry-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2396 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_compile)
NOTE: recipe gpgme-1.15.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_compile: Succeeded
NOTE: Running task 2397 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_install)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_install: Succeeded
NOTE: Running task 2398 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot)
NOTE: Running task 2399 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2400 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2401 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_configure)
NOTE: recipe libmodulemd-2.9.4-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package: Succeeded
NOTE: Running task 2402 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2403 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_configure: Succeeded
NOTE: Running task 2404 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_compile)
NOTE: recipe libmodulemd-2.9.4-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2405 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_compile)
NOTE: recipe rpm-1_4.16.0-r0: task do_compile: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_compile: Succeeded
NOTE: Running task 2406 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_install)
NOTE: recipe libmodulemd-2.9.4-r0: task do_install: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_install: Succeeded
NOTE: Running task 2407 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_sysroot)
NOTE: Running task 2408 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package)
NOTE: recipe libmodulemd-2.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_package: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmodulemd-2.9.4-r0: task do_package: Succeeded
NOTE: Running task 2409 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata)
NOTE: recipe libmodulemd-2.9.4-r0: task do_packagedata: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2410 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package_write_rpm)
NOTE: recipe libmodulemd-2.9.4-r0: task do_package_write_rpm: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2411 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_install)
NOTE: recipe libunistring-0.9.10-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2412 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2413 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package)
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2414 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2415 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_configure)
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2416 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_install)
NOTE: recipe rpm-1_4.16.0-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2417 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2418 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_install: Succeeded
NOTE: Running task 2419 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_populate_sysroot)
NOTE: Running task 2420 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_package)
NOTE: recipe rpm-1_4.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2421 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsolv-0.7.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2422 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_configure)
NOTE: recipe libsolv-0.7.16-r0: task do_configure: Started
NOTE: recipe libsolv-0.7.16-r0: task do_configure: Succeeded
NOTE: Running task 2423 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_compile)
NOTE: recipe libsolv-0.7.16-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_package: Succeeded
NOTE: Running task 2424 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.0-r0: task do_packagedata: Started
NOTE: recipe gpgme-1.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2425 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_install)
NOTE: recipe rpm-1_4.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2426 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_package_write_rpm)
NOTE: recipe gpgme-1.15.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe gpgme-1.15.0-r0: task do_install: Succeeded
NOTE: Running task 2427 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_populate_sysroot)
NOTE: Running task 2428 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_package)
NOTE: recipe gpgme-1.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe gpgme-1.15.0-r0: task do_package: Started
NOTE: recipe libsolv-0.7.16-r0: task do_compile: Succeeded
NOTE: Running task 2429 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_install)
NOTE: recipe libsolv-0.7.16-r0: task do_install: Started
NOTE: recipe gpgme-1.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_install: Succeeded
NOTE: Running task 2430 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_populate_sysroot)
NOTE: Running task 2431 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_package)
NOTE: recipe libsolv-0.7.16-r0: task do_populate_sysroot: Started
NOTE: recipe libsolv-0.7.16-r0: task do_package: Started
NOTE: recipe libsolv-0.7.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_package: Succeeded
NOTE: Running task 2432 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_packagedata)
NOTE: recipe gpgme-1.15.0-r0: task do_packagedata: Started
NOTE: recipe gpgme-1.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2433 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_package_write_rpm)
NOTE: recipe gpgme-1.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.16-r0: task do_package: Succeeded
NOTE: Running task 2434 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_packagedata)
NOTE: recipe libsolv-0.7.16-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.16-r0: task do_packagedata: Succeeded
NOTE: Running task 2435 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_package_write_rpm)
NOTE: recipe libsolv-0.7.16-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2436 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_compile)
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2437 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_install)
NOTE: recipe libidn2-2.3.0-r0: task do_install: Started
NOTE: recipe libidn2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2438 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot)
NOTE: Running task 2439 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package)
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2440 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2441 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_configure)
NOTE: recipe libidn2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 2442 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata)
NOTE: recipe gnutls-3.6.15-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2443 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_configure: Succeeded
NOTE: Running task 2444 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_compile)
NOTE: recipe gnutls-3.6.15-r0: task do_compile: Started
NOTE: recipe gnutls-3.6.15-r0: task do_compile: Succeeded
NOTE: Running task 2445 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_install)
NOTE: recipe gnutls-3.6.15-r0: task do_install: Started
NOTE: recipe gnutls-3.6.15-r0: task do_install: Succeeded
NOTE: Running task 2446 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_populate_sysroot)
NOTE: Running task 2447 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_package)
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package: Started
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2448 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2449 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.73.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnupg-2.2.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.73.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2450 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_configure)
NOTE: recipe gnupg-2.2.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2451 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_configure)
NOTE: recipe curl-7.73.0-r0: task do_configure: Started
NOTE: recipe gnupg-2.2.23-r0: task do_configure: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package: Succeeded
NOTE: Running task 2452 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_packagedata)
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2453 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_package_write_rpm)
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_configure: Succeeded
NOTE: Running task 2454 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_compile)
NOTE: recipe gnupg-2.2.23-r0: task do_compile: Started
NOTE: recipe gnupg-2.2.23-r0: task do_compile: Succeeded
NOTE: Running task 2455 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_install)
NOTE: recipe gnupg-2.2.23-r0: task do_install: Started
NOTE: recipe curl-7.73.0-r0: task do_configure: Succeeded
NOTE: Running task 2456 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_compile)
NOTE: recipe curl-7.73.0-r0: task do_compile: Started
NOTE: recipe gnupg-2.2.23-r0: task do_install: Succeeded
NOTE: Running task 2457 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_package)
NOTE: recipe gnupg-2.2.23-r0: task do_package: Started
NOTE: recipe curl-7.73.0-r0: task do_compile: Succeeded
NOTE: Running task 2458 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_install)
NOTE: recipe curl-7.73.0-r0: task do_install: Started
NOTE: recipe curl-7.73.0-r0: task do_install: Succeeded
NOTE: Running task 2459 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_populate_sysroot)
NOTE: recipe gnupg-2.2.23-r0: task do_package: Succeeded
NOTE: Running task 2460 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_package)
NOTE: Running task 2461 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_packagedata)
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot: Started
NOTE: recipe gnupg-2.2.23-r0: task do_packagedata: Started
NOTE: recipe curl-7.73.0-r0: task do_package: Started
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2462 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe librepo-1.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnupg-2.2.23-r0: task do_packagedata: Succeeded
NOTE: Running task 2463 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_package_write_rpm)
NOTE: recipe gnupg-2.2.23-r0: task do_package_write_rpm: Started
NOTE: recipe librepo-1.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2464 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_configure)
NOTE: recipe librepo-1.12.1-r0: task do_configure: Started
NOTE: recipe librepo-1.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2465 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_compile)
NOTE: recipe librepo-1.12.1-r0: task do_compile: Started
NOTE: recipe librepo-1.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2466 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_install)
NOTE: recipe curl-7.73.0-r0: task do_package: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_install: Started
NOTE: Running task 2467 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_packagedata)
NOTE: recipe curl-7.73.0-r0: task do_packagedata: Started
NOTE: recipe librepo-1.12.1-r0: task do_install: Succeeded
NOTE: Running task 2468 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_populate_sysroot)
NOTE: recipe librepo-1.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.73.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2469 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_package)
NOTE: Running task 2470 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_package_write_rpm)
NOTE: recipe librepo-1.12.1-r0: task do_package: Started
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm: Started
NOTE: recipe librepo-1.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2471 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdnf-0.55.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librepo-1.12.1-r0: task do_package: Succeeded
NOTE: Running task 2472 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_packagedata)
NOTE: recipe librepo-1.12.1-r0: task do_packagedata: Started
NOTE: recipe libdnf-0.55.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2473 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_configure)
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_configure: Started
NOTE: recipe librepo-1.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2474 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_package_write_rpm)
NOTE: recipe librepo-1.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe librepo-1.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_configure: Succeeded
NOTE: Running task 2475 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_compile)
NOTE: recipe libdnf-0.55.0-r0: task do_compile: Started
NOTE: recipe libdnf-0.55.0-r0: task do_compile: Succeeded
NOTE: Running task 2476 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_install)
NOTE: recipe libdnf-0.55.0-r0: task do_install: Started
NOTE: recipe libdnf-0.55.0-r0: task do_install: Succeeded
NOTE: Running task 2477 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_package)
NOTE: Running task 2478 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_populate_sysroot)
NOTE: recipe libdnf-0.55.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdnf-0.55.0-r0: task do_package: Started
NOTE: recipe libdnf-0.55.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2479 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe dnf-4.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dnf-4.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2480 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_configure)
NOTE: recipe dnf-4.5.2-r0: task do_configure: Started
NOTE: recipe dnf-4.5.2-r0: task do_configure: Succeeded
NOTE: Running task 2481 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_compile)
NOTE: recipe dnf-4.5.2-r0: task do_compile: Started
NOTE: recipe dnf-4.5.2-r0: task do_compile: Succeeded
NOTE: Running task 2482 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_install)
NOTE: recipe dnf-4.5.2-r0: task do_install: Started
NOTE: recipe dnf-4.5.2-r0: task do_install: Succeeded
NOTE: Running task 2483 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_populate_sysroot)
NOTE: recipe dnf-4.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe dnf-4.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_package: Succeeded
NOTE: Running task 2484 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_packagedata)
NOTE: recipe libdnf-0.55.0-r0: task do_packagedata: Started
NOTE: recipe libdnf-0.55.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2485 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_package)
NOTE: Running task 2486 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_package_write_rpm)
NOTE: recipe dnf-4.5.2-r0: task do_package: Started
NOTE: recipe libdnf-0.55.0-r0: task do_package_write_rpm: Started
NOTE: recipe dnf-4.5.2-r0: task do_package: Succeeded
NOTE: Running task 2487 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_packagedata)
NOTE: recipe dnf-4.5.2-r0: task do_packagedata: Started
NOTE: recipe dnf-4.5.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2488 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_package_write_rpm)
NOTE: Running task 2489 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_package_qa)
NOTE: recipe dnf-4.5.2-r0: task do_package_write_rpm: Started
NOTE: recipe dnf-4.5.2-r0: task do_package_qa: Started
NOTE: recipe dnf-4.5.2-r0: task do_package_qa: Succeeded
NOTE: recipe dnf-4.5.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2490 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2490 tasks of which 2125 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 147 ERROR messages shown, returning a non-zero exit code.

--===============4000030297056990263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dnf/dnf-bash-completion: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-dbg: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-dbg: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-dev: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-dev: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-doc: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-doc: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-da: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-de: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-el: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-es: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-he: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-id: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-it: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-or: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-th: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-vi: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-vi: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-src: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-src: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf-staticdev: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf/dnf: PKGV changed from 4.4.0 [default] to 4.5.2 [default]
packages/core2-32-poky-linux/dnf/dnf: PKGSIZE changed from 928125 to 938050 (+1%)
packages/core2-32-poky-linux/dnf: PV changed from "4.4.0" to "4.5.2"
packages/core2-32-poky-linux/dnf: PKGV changed from 4.4.0 [default] to 4.5.2 [default]

--===============4000030297056990263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (0 cached, 807 parsed). 1416 targets, 57 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.2+snapshot-fed3ceade259a7a54a62648e51c3520658f0951b"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fed3ceade259a7a54a62648e51c3520658f0951b"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 236 Found 86 Missed 150 Current 569 (36% match, 81% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 571 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 572 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 573 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 574 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 579 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 580 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 581 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 582 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 583 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 591 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 618 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 629 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 631 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 646 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 647 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 648 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 659 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 660 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 661 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 662 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 663 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 665 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 667 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: Running setscene task 668 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 669 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 675 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 748 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_8d8d9afb39-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_8d8d9afb39-r0: task do_deploy_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 750 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1002 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_fetch)
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 751 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 752 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: Running task 1082 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_fetch)
NOTE: Running task 1083 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_fetch)
NOTE: Running task 1109 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_fetch)
NOTE: Running task 1150 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_fetch)
NOTE: Running task 1151 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_fetch)
NOTE: Running task 1156 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1157 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running task 1158 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_fetch)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1187 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_fetch)
NOTE: Running task 1190 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1192 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_fetch)
NOTE: Running task 1193 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_fetch)
NOTE: Running task 1196 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_fetch)
NOTE: Running task 1201 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 1224 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.6-r0: task do_fetch: Started
NOTE: Running task 1237 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_fetch)
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: Running task 1238 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_fetch)
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1261 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_fetch)
NOTE: Running task 1264 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_fetch)
NOTE: Running task 1265 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: recipe nettle-3.6-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Started
NOTE: Running task 1292 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_unpack)
NOTE: Running task 1293 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Started
NOTE: Running task 1297 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_write_config)
NOTE: Running task 1301 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_fetch)
NOTE: Running task 1302 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_fetch)
NOTE: Running task 1315 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_fetch)
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Succeeded
NOTE: recipe libassuan-2.5.4-r0: task do_fetch: Started
NOTE: Running task 1333 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_fetch)
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Started
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: Running task 1334 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_unpack)
NOTE: Running task 1335 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_unpack)
NOTE: Running task 1336 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: Running task 1337 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libassuan-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Started
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Started
NOTE: Running task 1338 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1339 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1340 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: Running task 1341 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: Running setscene task 753 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_fetch: Started
NOTE: Running task 1342 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_unpack)
NOTE: recipe gpgme-1.15.0-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.15-r0: task do_fetch: Started
NOTE: Running task 1343 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_unpack)
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.15-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_fetch: Started
NOTE: Running setscene task 754 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe libsolv-0.7.16-r0: task do_fetch: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_fetch: Started
NOTE: Running task 1344 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_unpack)
NOTE: recipe python3-six-1.15.0-r0: task do_fetch: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_fetch: Started
NOTE: Running task 1345 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_unpack)
NOTE: Running task 1346 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_unpack)
NOTE: Running task 1347 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 1348 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 755 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: Running task 1349 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_unpack)
NOTE: recipe libsolv-0.7.16-r0: task do_fetch: Succeeded
NOTE: Running task 1350 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_unpack)
NOTE: Running task 1351 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gpgme-1.15.0-r0: task do_fetch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmodulemd-2.9.4-r0: task do_fetch: Started
NOTE: recipe nettle-3.6-r0: task do_unpack: Started
NOTE: Running task 1352 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_unpack)
NOTE: Running task 1353 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_unpack)
NOTE: Running task 1354 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_unpack)
NOTE: Running task 1355 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_unpack)
NOTE: Running task 1356 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_fetch)
NOTE: recipe libksba-1.4.0-r0: task do_fetch: Started
NOTE: Running task 1357 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: recipe librepo-1.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 1358 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1368 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_unpack)
NOTE: recipe libksba-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Started
NOTE: recipe libcomps-0.1.15-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_fetch: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Started
NOTE: Running setscene task 756 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe libcomps-0.1.15-r0: task do_fetch: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libassuan-2.5.4-r0: task do_unpack: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Started
NOTE: Running task 1377 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.6.15-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: Running task 1378 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_unpack)
NOTE: Running task 1379 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_unpack)
NOTE: Running task 1384 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.73.0-r0: task do_unpack: Started
NOTE: recipe libdnf-0.55.0-r0: task do_fetch: Succeeded
NOTE: Running task 1385 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: Running task 1386 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-c-0.15-r0: task do_unpack: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: Running task 1387 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_unpack)
NOTE: recipe python3-six-1.15.0-r0: task do_unpack: Started
NOTE: Running task 1393 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_fetch)
NOTE: recipe json-c-0.15-r0: task do_unpack: Succeeded
NOTE: Running task 1394 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_patch)
NOTE: Running task 1403 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_unpack)
NOTE: recipe python3-six-1.15.0-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.6-r0: task do_unpack: Succeeded
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1404 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: Running task 1405 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_patch)
NOTE: Running task 1406 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 1407 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsolv-0.7.16-r0: task do_unpack: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_unpack: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: recipe npth-1.6-r0: task do_fetch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-1.15.0-r0: task do_unpack: Started
NOTE: Running task 1408 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe librepo-1.12.1-r0: task do_unpack: Started
NOTE: recipe libcomps-0.1.15-r0: task do_unpack: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_unpack: Started
NOTE: recipe npth-1.6-r0: task do_fetch: Succeeded
NOTE: Running task 1409 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_unpack)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_unpack: Started
NOTE: Running task 1410 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: recipe libmodulemd-2.9.4-r0: task do_write_config: Started
NOTE: recipe json-c-0.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_unpack: Started
NOTE: recipe json-c-0.15-r0: task do_patch: Started
NOTE: recipe dnf-4.5.2-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1420 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_patch)
NOTE: recipe python3-six-1.15.0-r0: task do_patch: Started
NOTE: Running task 1425 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_patch)
NOTE: recipe python3-iniparse-0.4-r0: task do_unpack: Succeeded
NOTE: recipe libmodulemd-2.9.4-r0: task do_write_config: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_unpack: Started
NOTE: Running task 1426 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_patch)
NOTE: recipe nettle-3.6-r0: task do_patch: Started
NOTE: recipe dnf-4.5.2-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: Running task 1449 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_unpack)
NOTE: Running task 1450 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_patch)
NOTE: recipe libsolv-0.7.16-r0: task do_unpack: Succeeded
NOTE: Running task 1462 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_patch)
NOTE: Running task 1472 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_fetch)
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: Running task 1481 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-c-0.15-r0: task do_patch: Succeeded
NOTE: Running task 1491 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_generate_toolchain_file)
NOTE: recipe npth-1.6-r0: task do_unpack: Started
NOTE: Running task 1492 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.15.0-r0: task do_patch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: Running task 1493 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk-doc-1.33.1-r0: task do_unpack: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_unpack: Succeeded
NOTE: recipe libmodulemd-2.9.4-r0: task do_unpack: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_unpack: Succeeded
NOTE: Running task 1494 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: Running task 1495 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_patch)
NOTE: Running task 1496 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_patch)
NOTE: Running task 1497 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_patch)
NOTE: recipe python3-iniparse-0.4-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Started
NOTE: recipe dnf-4.5.2-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Started
NOTE: recipe libksba-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe npth-1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1498 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_patch)
NOTE: recipe libassuan-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 1499 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_patch)
NOTE: recipe gnupg-2.2.23-r0: task do_fetch: Started
NOTE: Running task 1500 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_patch)
NOTE: recipe libsolv-0.7.16-r0: task do_patch: Started
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.15-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-six-1.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-c-0.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_patch: Started
NOTE: recipe gnupg-2.2.23-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1505 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe librepo-1.12.1-r0: task do_patch: Started
NOTE: recipe libcomps-0.1.15-r0: task do_patch: Started
NOTE: Running task 1508 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_fetch)
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_patch: Started
NOTE: recipe json-c-0.15-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_patch: Succeeded
NOTE: recipe npth-1.6-r0: task do_patch: Started
NOTE: Running task 1568 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_patch)
NOTE: recipe libksba-1.4.0-r0: task do_patch: Started
NOTE: Running task 1569 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1594 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_unpack)
NOTE: recipe libassuan-2.5.4-r0: task do_patch: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1614 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Succeeded
NOTE: Running task 1653 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pinentry-1.1.0-r0: task do_fetch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1724 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1734 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe pinentry-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1758 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_unpack)
NOTE: recipe python3-iniparse-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.16-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1783 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_generate_toolchain_file)
NOTE: recipe libdnf-0.55.0-r0: task do_patch: Started
NOTE: Running task 1784 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1805 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_patch)
NOTE: recipe rpm-1_4.16.0-r0: task do_patch: Started
NOTE: recipe libksba-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_unpack: Succeeded
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: Running task 1849 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gnupg-2.2.23-r0: task do_unpack: Started
NOTE: Running task 1857 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_patch)
NOTE: Running task 1858 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: Running task 1859 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libassuan-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe dnf-4.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1905 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe librepo-1.12.1-r0: task do_patch: Succeeded
NOTE: Running task 1906 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_patch)
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Succeeded
NOTE: recipe libmodulemd-2.9.4-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 760 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: Running task 1914 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1915 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_generate_toolchain_file)
NOTE: Running task 1916 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1917 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1918 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_configure)
NOTE: recipe pinentry-1.1.0-r0: task do_unpack: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.6-r0: task do_patch: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_patch: Succeeded
NOTE: Running task 1963 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1964 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_generate_toolchain_file)
NOTE: Running task 1965 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_deploy_source_date_epoch)
NOTE: recipe libsolv-0.7.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libksba-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.6.15-r0: task do_unpack: Succeeded
NOTE: Running task 1985 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_patch)
NOTE: recipe gtk-doc-1.33.1-r0: task do_patch: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_patch: Started
NOTE: Running task 1986 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_deploy_source_date_epoch)
NOTE: recipe npth-1.6-r0: task do_patch: Succeeded
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.5.2-r0: task do_patch: Started
NOTE: Running task 1987 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libassuan-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librepo-1.12.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe librepo-1.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.15-r0: task do_configure: Started
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pinentry-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1988 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_patch)
NOTE: recipe libcomps-0.1.15-r0: task do_generate_toolchain_file: Started
NOTE: recipe librepo-1.12.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1989 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 1990 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: Running task 1991 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_patch)
NOTE: recipe libcomps-0.1.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcomps-0.1.15-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libksba-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1996 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_deploy_source_date_epoch)
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1997 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_8d8d9afb39-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2002 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe pinentry-1.1.0-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libassuan-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_unpack: Succeeded
NOTE: Running task 2003 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2004 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_configure)
NOTE: recipe librepo-1.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe gnutls-3.6.15-r0: task do_patch: Succeeded
NOTE: Running task 2005 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2006 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure)
NOTE: recipe libdnf-0.55.0-r0: task do_patch: Succeeded
NOTE: Running task 2007 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_generate_toolchain_file)
NOTE: recipe libcomps-0.1.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2008 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2009 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_configure)
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Started
NOTE: Running task 2010 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_configure)
NOTE: recipe curl-7.73.0-r0: task do_patch: Started
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.55.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.55.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe nettle-3.6-r0: task do_configure: Started
NOTE: recipe pinentry-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2011 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2012 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_configure)
NOTE: recipe libdnf-0.55.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe npth-1.6-r0: task do_configure: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_configure: Started
NOTE: recipe dnf-4.5.2-r0: task do_patch: Succeeded
NOTE: Running task 2013 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_generate_toolchain_file)
NOTE: recipe curl-7.73.0-r0: task do_patch: Succeeded
NOTE: Running task 2014 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2015 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_populate_lic)
NOTE: Running task 2016 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Started
NOTE: recipe pinentry-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gpgme-1.15.0-r0: task do_patch: Succeeded
NOTE: recipe dnf-4.5.2-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2017 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe dnf-4.5.2-r0: task do_populate_lic: Started
NOTE: recipe dnf-4.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.5.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe pinentry-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 2018 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe dnf-4.5.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_populate_lic unihash changed to 8aec06e53131c1eeaa060d7dd31d9117c1200a8351ba162474370c49556df793
NOTE: recipe gpgme-1.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2019 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gpgme-1.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_unpack: Succeeded
NOTE: Running task 2020 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_patch)
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_patch: Succeeded
NOTE: Running task 2025 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_deploy_source_date_epoch)
NOTE: recipe gnupg-2.2.23-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnupg-2.2.23-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_8d8d9afb39-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 766 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_8d8d9afb39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_8d8d9afb39-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_8d8d9afb39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 770 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.15-r0: task do_configure: Succeeded
NOTE: Running task 2031 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_compile)
NOTE: recipe json-c-0.15-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.15-r0: task do_compile: Succeeded
NOTE: Running task 2032 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_install)
NOTE: recipe json-c-0.15-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_configure: Succeeded
NOTE: Running task 2033 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure_ptest_base)
NOTE: recipe json-c-0.15-r0: task do_install: Succeeded
NOTE: Running task 2034 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_populate_sysroot)
NOTE: Running task 2035 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_package)
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2036 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile)
NOTE: recipe json-c-0.15-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.15-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 2037 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe nettle-3.6-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: recipe json-c-0.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 772 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.15-r0: task do_package: Succeeded
NOTE: Running task 2043 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_packagedata)
NOTE: recipe json-c-0.15-r0: task do_packagedata: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_8d8d9afb39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2071 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_package_write_rpm)
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.15-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2076 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 2077 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: Running task 2078 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: recipe gtk-doc-1.33.1-r0: task do_configure: Succeeded
NOTE: Running task 2079 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_compile: Started
NOTE: recipe json-c-0.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_compile: Succeeded
NOTE: Running task 2080 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_install: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_install: Succeeded
NOTE: Running task 2081 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_populate_sysroot)
NOTE: Running task 2082 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_package)
NOTE: recipe gtk-doc-1.33.1-r0: task do_populate_sysroot: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_package: Started
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 783 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2083 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 786 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running task 2092 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe npth-1.6-r0: task do_configure: Succeeded
NOTE: Running task 2098 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_compile)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe npth-1.6-r0: task do_compile: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2099 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2100 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 788 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 789 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 790 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 2118 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe npth-1.6-r0: task do_compile: Succeeded
NOTE: Running task 2119 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_install)
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe npth-1.6-r0: task do_install: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2135 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe npth-1.6-r0: task do_install: Succeeded
NOTE: Running task 2136 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package)
NOTE: Running task 2137 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_populate_sysroot)
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2138 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package_write_rpm)
NOTE: recipe npth-1.6-r0: task do_package: Started
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_package: Succeeded
NOTE: Running task 2139 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2152 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2153 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2154 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_package_write_rpm)
NOTE: recipe libyaml-0.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2155 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to bafeab211f96dcc2837ea65d9a9c6a333eccd590b0b8e09cccb3f79a13753554
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2156 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe npth-1.6-r0: task do_package: Succeeded
NOTE: Running task 2157 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe npth-1.6-r0: task do_packagedata: Started
NOTE: recipe npth-1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2158 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3ebd7986c834cbc527b39a873a77f5cc1ffb99642290f5adb5f91062e33f1954
NOTE: Running task 2159 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2160 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2161 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe npth-1.6-r0: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_compile: Succeeded
NOTE: Running task 2162 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2163 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe npth-1.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2164 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2165 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 800 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 801 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2170 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Succeeded
NOTE: Running task 2171 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_compile)
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2172 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2173 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2174 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2175 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2176 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Succeeded
NOTE: Running task 2177 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_install)
NOTE: recipe libgpg-error-1.39-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 2178 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_install: Succeeded
NOTE: Running task 2179 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_populate_sysroot)
NOTE: Running task 2180 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2185 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2186 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_prepare_recipe_sysroot)
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-src went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2187 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_prepare_recipe_sysroot)
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dbg went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: Running task 2188 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_prepare_recipe_sysroot)
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libsmartcols went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm: Started
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libmount went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libfdisk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libblkid went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swaponoff went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ptest went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-staticdev went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dev went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-doc went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Started
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe libassuan-2.5.4-r0: task do_prepare_recipe_sysroot: Started
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-bash-completion went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe libksba-1.4.0-r0: task do_prepare_recipe_sysroot: Started
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dmesg went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-getopt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-kill went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-more went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mount went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mountpoint went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-su went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-umount went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-agetty went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkid went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blockdev went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-cfdisk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ctrlaltdel went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fdisk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsck went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fstrim went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hwclock went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe libassuan-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2189 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_configure)
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-losetup went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe libksba-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkswap went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: Running task 2190 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_configure)
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-nologin went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-pivot-root went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-sulogin went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swapoff went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swapon went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-switch-root went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-cal went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chmem went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-choom went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chrt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-col went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-colcrt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: Running task 2191 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_configure)
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-colrm went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-column went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-eject went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fallocate went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe libassuan-2.5.4-r0: task do_configure: Started
NOTE: recipe libksba-1.4.0-r0: task do_configure: Started
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fincore went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-findmnt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-flock went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hardlink went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hexdump went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ionice went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcmk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcrm went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-irqtop went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-isosize went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-last went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Started
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-logger went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-look went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsblk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lscpu went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsipc went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsirq went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lslocks went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lslogins went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsmem went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsns went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mcookie went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mesg went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-namei went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-nsenter went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-prlimit went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rename went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-renice went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rev went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-script went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-scriptlive went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm: Succeeded
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-scriptreplay went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setarch went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setpriv went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setsid went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setterm went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-taskset went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ul went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-unshare went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-utmpdump went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidgen went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidparse went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wall went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wdctl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-whereis went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-write went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-addpart went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkdiscard went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkzone went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chcpu went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-delpart went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fdformat went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-findfs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsck.cramfs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsfreeze went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ldattach went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkfs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkfs.cramfs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-partx went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-raw went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-readprofile went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-resizepart went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rfkill went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rtcwake went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-runuser went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-sfdisk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swaplabel went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidd went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wipefs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-zramctl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ca went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-cs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-da went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-de went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-es went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-et went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-eu went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-fi went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-fr went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-gl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-hr went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-hu went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-id went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-it went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ja went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-nl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pt-br went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ru went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sv went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-tr went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-uk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-vi went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-zh-cn went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-zh-tw went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 806 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2269 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2272 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2277 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-six-1.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcomps-0.1.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Succeeded
NOTE: Running task 2334 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_packagedata)
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2335 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2336 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install)
NOTE: recipe nettle-3.6-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_install: Succeeded
NOTE: Running task 2337 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2338 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_populate_sysroot)
NOTE: Running task 2339 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package)
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_package: Started
NOTE: recipe libksba-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2340 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_compile)
NOTE: recipe libksba-1.4.0-r0: task do_compile: Started
NOTE: recipe libcomps-0.1.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2341 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_configure)
NOTE: recipe python3-six-1.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2342 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_configure)
NOTE: recipe libassuan-2.5.4-r0: task do_configure: Succeeded
NOTE: Running task 2343 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_compile)
NOTE: recipe libcomps-0.1.15-r0: task do_configure: Started
NOTE: recipe python3-six-1.15.0-r0: task do_configure: Started
NOTE: recipe libassuan-2.5.4-r0: task do_compile: Started
NOTE: recipe python3-six-1.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2344 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_compile)
NOTE: recipe python3-six-1.15.0-r0: task do_compile: Started
NOTE: recipe libcomps-0.1.15-r0: task do_configure: Succeeded
NOTE: Running task 2345 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_compile)
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2346 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_compile)
NOTE: recipe python3-six-1.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2347 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_install)
NOTE: recipe libcomps-0.1.15-r0: task do_compile: Started
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Started
NOTE: recipe python3-six-1.15.0-r0: task do_install: Started
NOTE: recipe libksba-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2348 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_install)
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_compile: Succeeded
NOTE: Running task 2349 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_install)
NOTE: recipe libassuan-2.5.4-r0: task do_compile: Succeeded
NOTE: Running task 2350 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_install)
NOTE: recipe python3-six-1.15.0-r0: task do_install: Succeeded
NOTE: Running task 2351 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_populate_sysroot)
NOTE: recipe libksba-1.4.0-r0: task do_install: Started
NOTE: Running task 2352 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_package)
NOTE: recipe libcomps-0.1.15-r0: task do_install: Started
NOTE: recipe libassuan-2.5.4-r0: task do_install: Started
NOTE: recipe python3-six-1.15.0-r0: task do_package: Started
NOTE: recipe python3-six-1.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe libksba-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2353 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_package)
NOTE: Running task 2354 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_populate_sysroot)
NOTE: recipe libassuan-2.5.4-r0: task do_install: Succeeded
NOTE: Running task 2355 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_populate_sysroot)
NOTE: Running task 2356 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_package)
NOTE: recipe libksba-1.4.0-r0: task do_package: Started
NOTE: recipe libcomps-0.1.15-r0: task do_install: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2357 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_package)
NOTE: Running task 2358 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_populate_sysroot)
NOTE: recipe libassuan-2.5.4-r0: task do_package: Started
NOTE: recipe libassuan-2.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libcomps-0.1.15-r0: task do_populate_sysroot: Started
NOTE: recipe libcomps-0.1.15-r0: task do_package: Started
NOTE: recipe python3-six-1.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2359 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniparse-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcomps-0.1.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2360 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_configure)
NOTE: recipe python3-iniparse-0.4-r0: task do_configure: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_configure: Succeeded
NOTE: Running task 2361 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_compile)
NOTE: recipe python3-iniparse-0.4-r0: task do_compile: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_compile: Succeeded
NOTE: Running task 2362 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_install)
NOTE: recipe python3-iniparse-0.4-r0: task do_install: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_install: Succeeded
NOTE: Running task 2363 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_populate_sysroot)
NOTE: recipe python3-iniparse-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 2364 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_compile)
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libassuan-2.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2365 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2366 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pinentry-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-1.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libassuan-2.5.4-r0: task do_package: Succeeded
NOTE: Running task 2367 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_packagedata)
NOTE: recipe libksba-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2368 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_packagedata)
NOTE: recipe libassuan-2.5.4-r0: task do_packagedata: Started
NOTE: recipe pinentry-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2369 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_configure)
NOTE: recipe libksba-1.4.0-r0: task do_packagedata: Started
NOTE: recipe pinentry-1.1.0-r0: task do_configure: Started
NOTE: recipe libassuan-2.5.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2370 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_package_write_rpm)
NOTE: recipe libksba-1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2371 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_package_write_rpm)
NOTE: recipe libassuan-2.5.4-r0: task do_package_write_rpm: Started
NOTE: recipe gpgme-1.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2372 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_configure)
NOTE: recipe gpgme-1.15.0-r0: task do_configure: Started
NOTE: recipe libassuan-2.5.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe nettle-3.6-r0: task do_package: Succeeded
NOTE: Running task 2373 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_packagedata)
NOTE: recipe nettle-3.6-r0: task do_packagedata: Started
NOTE: recipe nettle-3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2374 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package_write_rpm)
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2375 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_configure)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Started
NOTE: recipe pinentry-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2376 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_compile)
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2377 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_install)
NOTE: recipe pinentry-1.1.0-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Succeeded
NOTE: Running task 2378 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_compile)
NOTE: recipe python3-six-1.15.0-r0: task do_package: Succeeded
NOTE: Running task 2379 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_packagedata)
NOTE: recipe libcomps-0.1.15-r0: task do_package: Succeeded
NOTE: Running task 2380 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_packagedata)
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_compile: Started
NOTE: recipe libcomps-0.1.15-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 2381 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_populate_sysroot)
NOTE: Running task 2382 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2383 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_package)
NOTE: Running task 2384 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_package_write_rpm)
NOTE: recipe libcomps-0.1.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2385 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_package_write_rpm)
NOTE: recipe python3-iniparse-0.4-r0: task do_package: Started
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe pinentry-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2386 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_install)
NOTE: recipe libcomps-0.1.15-r0: task do_package_write_rpm: Started
NOTE: recipe pinentry-1.1.0-r0: task do_install: Started
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pinentry-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2387 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_package)
NOTE: recipe pinentry-1.1.0-r0: task do_package: Started
NOTE: recipe libcomps-0.1.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_package: Succeeded
NOTE: Running task 2388 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.4-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2389 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2390 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_package_write_rpm)
NOTE: recipe python3-iniparse-0.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 2391 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2392 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_configure)
NOTE: recipe pinentry-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2393 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2394 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package_write_rpm)
NOTE: recipe pinentry-1.1.0-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe pinentry-1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2395 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_package_write_rpm)
NOTE: recipe pinentry-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe pinentry-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2396 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_compile)
NOTE: recipe gpgme-1.15.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_compile: Succeeded
NOTE: Running task 2397 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_install)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_install: Succeeded
NOTE: Running task 2398 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot)
NOTE: Running task 2399 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2400 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2401 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_install)
NOTE: recipe libunistring-0.9.10-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2402 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2403 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package)
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2404 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_configure)
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2405 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.9.4-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2406 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_configure)
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package: Succeeded
NOTE: Running task 2407 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_configure: Succeeded
NOTE: Running task 2408 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_compile)
NOTE: recipe libmodulemd-2.9.4-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2409 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2410 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2411 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2412 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_compile)
NOTE: recipe rpm-1_4.16.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmodulemd-2.9.4-r0: task do_compile: Succeeded
NOTE: Running task 2413 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_install)
NOTE: recipe libmodulemd-2.9.4-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmodulemd-2.9.4-r0: task do_install: Succeeded
NOTE: Running task 2414 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_sysroot)
NOTE: Running task 2415 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package)
NOTE: recipe libmodulemd-2.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_package: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmodulemd-2.9.4-r0: task do_package: Succeeded
NOTE: Running task 2416 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata)
NOTE: recipe libmodulemd-2.9.4-r0: task do_packagedata: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2417 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package_write_rpm)
NOTE: recipe libmodulemd-2.9.4-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2418 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_install)
NOTE: recipe rpm-1_4.16.0-r0: task do_install: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_install: Succeeded
NOTE: Running task 2419 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_populate_sysroot)
NOTE: Running task 2420 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_package)
NOTE: recipe rpm-1_4.16.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2421 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsolv-0.7.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsolv-0.7.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2422 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_configure)
NOTE: recipe libsolv-0.7.16-r0: task do_configure: Started
NOTE: recipe libsolv-0.7.16-r0: task do_configure: Succeeded
NOTE: Running task 2423 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_compile)
NOTE: recipe libsolv-0.7.16-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_package: Succeeded
NOTE: Running task 2424 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2425 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.16-r0: task do_compile: Succeeded
NOTE: Running task 2426 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_install)
NOTE: recipe libsolv-0.7.16-r0: task do_install: Started
NOTE: recipe libsolv-0.7.16-r0: task do_install: Succeeded
NOTE: Running task 2427 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_populate_sysroot)
NOTE: Running task 2428 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_package)
NOTE: recipe libsolv-0.7.16-r0: task do_populate_sysroot: Started
NOTE: recipe libsolv-0.7.16-r0: task do_package: Started
NOTE: recipe libsolv-0.7.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_package: Succeeded
NOTE: Running task 2429 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_packagedata)
NOTE: recipe libsolv-0.7.16-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.16-r0: task do_packagedata: Succeeded
NOTE: Running task 2430 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_package_write_rpm)
NOTE: recipe libsolv-0.7.16-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2431 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_install)
NOTE: recipe gpgme-1.15.0-r0: task do_install: Started
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2432 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_compile)
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Started
NOTE: recipe gpgme-1.15.0-r0: task do_install: Succeeded
NOTE: Running task 2433 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_populate_sysroot)
NOTE: Running task 2434 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_package)
NOTE: recipe gpgme-1.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe gpgme-1.15.0-r0: task do_package: Started
NOTE: recipe gpgme-1.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2435 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_install)
NOTE: recipe libidn2-2.3.0-r0: task do_install: Started
NOTE: recipe libidn2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2436 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot)
NOTE: Running task 2437 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package)
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Started
NOTE: recipe gpgme-1.15.0-r0: task do_package: Succeeded
NOTE: Running task 2438 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_packagedata)
NOTE: recipe gpgme-1.15.0-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2439 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-1.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2440 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_package_write_rpm)
NOTE: recipe gpgme-1.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe gnutls-3.6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2441 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_configure)
NOTE: recipe gnutls-3.6.15-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 2442 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata)
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2443 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_configure: Succeeded
NOTE: Running task 2444 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_compile)
NOTE: recipe gnutls-3.6.15-r0: task do_compile: Started
NOTE: recipe gnutls-3.6.15-r0: task do_compile: Succeeded
NOTE: Running task 2445 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_install)
NOTE: recipe gnutls-3.6.15-r0: task do_install: Started
NOTE: recipe gnutls-3.6.15-r0: task do_install: Succeeded
NOTE: Running task 2446 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_populate_sysroot)
NOTE: Running task 2447 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_package)
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package: Started
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2448 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2449 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.73.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnupg-2.2.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.73.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2450 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_configure)
NOTE: recipe gnupg-2.2.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2451 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_configure)
NOTE: recipe curl-7.73.0-r0: task do_configure: Started
NOTE: recipe gnupg-2.2.23-r0: task do_configure: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package: Succeeded
NOTE: Running task 2452 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_packagedata)
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2453 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_package_write_rpm)
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_configure: Succeeded
NOTE: Running task 2454 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_compile)
NOTE: recipe gnupg-2.2.23-r0: task do_compile: Started
NOTE: recipe curl-7.73.0-r0: task do_configure: Succeeded
NOTE: Running task 2455 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_compile)
NOTE: recipe curl-7.73.0-r0: task do_compile: Started
NOTE: recipe gnupg-2.2.23-r0: task do_compile: Succeeded
NOTE: Running task 2456 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_install)
NOTE: recipe gnupg-2.2.23-r0: task do_install: Started
NOTE: recipe gnupg-2.2.23-r0: task do_install: Succeeded
NOTE: Running task 2457 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_package)
NOTE: recipe gnupg-2.2.23-r0: task do_package: Started
NOTE: recipe curl-7.73.0-r0: task do_compile: Succeeded
NOTE: Running task 2458 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_install)
NOTE: recipe curl-7.73.0-r0: task do_install: Started
NOTE: recipe curl-7.73.0-r0: task do_install: Succeeded
NOTE: Running task 2459 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_populate_sysroot)
NOTE: Running task 2460 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_package)
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.73.0-r0: task do_package: Started
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2461 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe librepo-1.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librepo-1.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2462 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_configure)
NOTE: recipe librepo-1.12.1-r0: task do_configure: Started
NOTE: recipe librepo-1.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2463 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_compile)
NOTE: recipe gnupg-2.2.23-r0: task do_package: Succeeded
NOTE: Running task 2464 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_packagedata)
NOTE: recipe librepo-1.12.1-r0: task do_compile: Started
NOTE: recipe gnupg-2.2.23-r0: task do_packagedata: Started
NOTE: recipe curl-7.73.0-r0: task do_package: Succeeded
NOTE: Running task 2465 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_packagedata)
NOTE: recipe curl-7.73.0-r0: task do_packagedata: Started
NOTE: recipe gnupg-2.2.23-r0: task do_packagedata: Succeeded
NOTE: Running task 2466 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_package_write_rpm)
NOTE: recipe librepo-1.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2467 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_install)
NOTE: recipe gnupg-2.2.23-r0: task do_package_write_rpm: Started
NOTE: recipe librepo-1.12.1-r0: task do_install: Started
NOTE: recipe curl-7.73.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2468 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_package_write_rpm)
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm: Started
NOTE: recipe librepo-1.12.1-r0: task do_install: Succeeded
NOTE: Running task 2469 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_populate_sysroot)
NOTE: Running task 2470 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_package)
NOTE: recipe librepo-1.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe librepo-1.12.1-r0: task do_package: Started
NOTE: recipe librepo-1.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2471 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdnf-0.55.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librepo-1.12.1-r0: task do_package: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2472 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_packagedata)
NOTE: Running task 2473 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_configure)
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_packagedata: Started
NOTE: recipe libdnf-0.55.0-r0: task do_configure: Started
NOTE: recipe librepo-1.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2474 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_package_write_rpm)
NOTE: recipe librepo-1.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe librepo-1.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_configure: Succeeded
NOTE: Running task 2475 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_compile)
NOTE: recipe libdnf-0.55.0-r0: task do_compile: Started
NOTE: recipe gnupg-2.2.23-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_compile: Succeeded
NOTE: Running task 2476 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_install)
NOTE: recipe libdnf-0.55.0-r0: task do_install: Started
NOTE: recipe libdnf-0.55.0-r0: task do_install: Succeeded
NOTE: Running task 2477 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_package)
NOTE: Running task 2478 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_populate_sysroot)
NOTE: recipe libdnf-0.55.0-r0: task do_package: Started
NOTE: recipe libdnf-0.55.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdnf-0.55.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2479 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe dnf-4.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dnf-4.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2480 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_configure)
NOTE: recipe dnf-4.5.2-r0: task do_configure: Started
NOTE: recipe dnf-4.5.2-r0: task do_configure: Succeeded
NOTE: Running task 2481 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_compile)
NOTE: recipe dnf-4.5.2-r0: task do_compile: Started
NOTE: recipe dnf-4.5.2-r0: task do_compile: Succeeded
NOTE: Running task 2482 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_install)
NOTE: recipe dnf-4.5.2-r0: task do_install: Started
NOTE: recipe dnf-4.5.2-r0: task do_install: Succeeded
NOTE: Running task 2483 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_populate_sysroot)
NOTE: recipe dnf-4.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libdnf-0.55.0-r0: task do_package: Succeeded
NOTE: Running task 2484 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_packagedata)
NOTE: recipe libdnf-0.55.0-r0: task do_packagedata: Started
NOTE: recipe dnf-4.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2485 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_package)
NOTE: Running task 2486 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_package_write_rpm)
NOTE: recipe dnf-4.5.2-r0: task do_package: Started
NOTE: recipe libdnf-0.55.0-r0: task do_package_write_rpm: Started
NOTE: recipe dnf-4.5.2-r0: task do_package: Succeeded
NOTE: Running task 2487 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_packagedata)
NOTE: recipe dnf-4.5.2-r0: task do_packagedata: Started
NOTE: recipe dnf-4.5.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2488 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_package_write_rpm)
NOTE: Running task 2489 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_package_qa)
NOTE: recipe dnf-4.5.2-r0: task do_package_write_rpm: Started
NOTE: recipe dnf-4.5.2-r0: task do_package_qa: Started
NOTE: recipe dnf-4.5.2-r0: task do_package_qa: Succeeded
NOTE: recipe dnf-4.5.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2490 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2490 tasks of which 2125 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 147 ERROR messages shown, returning a non-zero exit code.

--===============4000030297056990263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1418 entries from dependency cache.
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
DISTRO_VERSION       = "3.2+snapshot-fed3ceade259a7a54a62648e51c3520658f0951b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fed3ceade259a7a54a62648e51c3520658f0951b"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 236 Found 86 Missed 150 Current 569 (36% match, 81% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 571 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 572 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 573 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 574 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 579 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 580 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 581 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 582 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 583 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 591 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 618 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 629 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 631 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 646 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 647 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 648 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 659 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 660 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 661 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 662 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 663 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 665 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 667 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: Running setscene task 668 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 669 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 675 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 748 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 750 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running task 1002 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_fetch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1082 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_fetch)
NOTE: Running task 1083 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_fetch)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 751 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1109 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_fetch)
NOTE: Running task 1150 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_fetch)
NOTE: Running task 1151 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_fetch)
NOTE: Running task 1156 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running task 1157 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1158 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_fetch)
NOTE: Running task 1187 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_fetch)
NOTE: Running task 1190 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_fetch)
NOTE: Running task 1192 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_fetch)
NOTE: Running task 1193 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_fetch)
NOTE: Running task 1196 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_fetch)
NOTE: Running task 1201 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 1224 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: recipe nettle-3.6-r0: task do_fetch: Started
NOTE: Running task 1237 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_fetch)
NOTE: Running task 1238 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_fetch)
NOTE: Running task 1261 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_fetch)
NOTE: Running task 1264 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: Running task 1265 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_fetch)
NOTE: Running task 1295 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_write_config)
NOTE: recipe nettle-3.6-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Started
NOTE: Running task 1299 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_fetch)
NOTE: Running task 1300 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_fetch)
NOTE: Running task 1313 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_unpack)
NOTE: Running task 1314 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Started
NOTE: Running task 1315 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_fetch)
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1317 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_unpack)
NOTE: Running task 1318 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_unpack)
NOTE: Running task 1319 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Started
NOTE: Running task 1320 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: recipe gnutls-3.6.15-r0: task do_fetch: Started
NOTE: recipe libassuan-2.5.4-r0: task do_fetch: Started
NOTE: recipe librepo-1.12.1-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Started
NOTE: Running task 1330 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_unpack)
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libassuan-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 1336 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_fetch: Succeeded
NOTE: Running task 1339 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_fetch)
NOTE: Running task 1340 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_unpack)
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_fetch: Started
NOTE: recipe curl-7.73.0-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_fetch: Started
NOTE: Running task 1341 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1342 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_unpack)
NOTE: Running task 1343 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: recipe librepo-1.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 1344 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsolv-0.7.16-r0: task do_fetch: Started
NOTE: Running task 1345 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_unpack)
NOTE: Running task 1346 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 1347 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_fetch: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_fetch: Started
NOTE: Running task 1348 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_unpack)
NOTE: Running task 1349 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: recipe gpgme-1.15.0-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.15-r0: task do_fetch: Started
NOTE: Running task 1350 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_unpack)
NOTE: recipe libmodulemd-2.9.4-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Started
NOTE: recipe libcomps-0.1.15-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1351 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_unpack)
NOTE: recipe libsolv-0.7.16-r0: task do_fetch: Succeeded
NOTE: Running task 1352 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_unpack)
NOTE: Running task 1353 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_unpack)
NOTE: recipe json-c-0.15-r0: task do_fetch: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.6-r0: task do_unpack: Started
NOTE: Running task 1354 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_unpack)
NOTE: recipe libmodulemd-2.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 1355 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_unpack)
NOTE: recipe libcomps-0.1.15-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Started
NOTE: Running task 1356 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_fetch: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Started
NOTE: Running task 1357 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_unpack)
NOTE: Running task 1358 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_fetch: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1359 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_unpack)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libassuan-2.5.4-r0: task do_unpack: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1360 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libksba-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe librepo-1.12.1-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Started
NOTE: Running task 1361 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_unpack)
NOTE: Running task 1362 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_fetch)
NOTE: Running task 1365 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_unpack)
NOTE: recipe gnutls-3.6.15-r0: task do_unpack: Started
NOTE: Running task 1385 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: Running task 1386 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1387 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1393 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_fetch)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: recipe curl-7.73.0-r0: task do_unpack: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 752 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1402 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_unpack)
NOTE: recipe rpm-1_4.16.0-r0: task do_unpack: Started
NOTE: recipe gpgme-1.15.0-r0: task do_unpack: Started
NOTE: recipe libsolv-0.7.16-r0: task do_unpack: Started
NOTE: recipe python3-six-1.15.0-r0: task do_unpack: Started
NOTE: recipe json-c-0.15-r0: task do_unpack: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_unpack: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcomps-0.1.15-r0: task do_unpack: Started
NOTE: recipe nettle-3.6-r0: task do_unpack: Succeeded
NOTE: Running task 1403 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_patch)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1448 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_fetch)
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_unpack: Started
NOTE: recipe libdnf-0.55.0-r0: task do_unpack: Started
NOTE: recipe npth-1.6-r0: task do_fetch: Started
NOTE: recipe json-c-0.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 753 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe libmodulemd-2.9.4-r0: task do_write_config: Started
NOTE: recipe dnf-4.5.2-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1449 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe npth-1.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 754 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: Running task 1450 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_unpack)
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe json-c-0.15-r0: task do_unpack: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_unpack: Started
NOTE: Running task 1451 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: Running task 1452 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_patch)
NOTE: Running task 1453 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_patch)
NOTE: recipe dnf-4.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 1454 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_unpack)
NOTE: recipe libmodulemd-2.9.4-r0: task do_write_config: Succeeded
NOTE: Running task 1463 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.6-r0: task do_patch: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_unpack: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_fetch: Started
NOTE: Running task 1464 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_patch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: Running task 1476 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe gnupg-2.2.23-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe libassuan-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: Running task 1492 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_fetch)
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: recipe npth-1.6-r0: task do_unpack: Started
NOTE: Running task 1499 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_patch)
NOTE: recipe json-c-0.15-r0: task do_patch: Started
NOTE: recipe python3-six-1.15.0-r0: task do_patch: Started
NOTE: Running task 1523 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_unpack)
NOTE: recipe dnf-4.5.2-r0: task do_unpack: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe libassuan-2.5.4-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_unpack: Started
NOTE: Running setscene task 756 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pinentry-1.1.0-r0: task do_fetch: Started
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 1791 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe librepo-1.12.1-r0: task do_unpack: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1792 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_patch)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 758 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe pinentry-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1940 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_unpack)
NOTE: recipe librepo-1.12.1-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Succeeded
NOTE: Running task 1941 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_patch)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Started
NOTE: recipe pinentry-1.1.0-r0: task do_unpack: Started
NOTE: recipe python3-six-1.15.0-r0: task do_patch: Succeeded
NOTE: Running task 1942 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe npth-1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1943 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_patch)
NOTE: recipe libcomps-0.1.15-r0: task do_unpack: Succeeded
NOTE: Running task 1944 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_patch)
NOTE: recipe libksba-1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1945 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_patch)
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_patch: Succeeded
NOTE: recipe libassuan-2.5.4-r0: task do_patch: Succeeded
NOTE: Running task 1946 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_patch)
NOTE: recipe libsolv-0.7.16-r0: task do_unpack: Succeeded
NOTE: Running task 1947 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1948 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Succeeded
NOTE: recipe libmodulemd-2.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 1949 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_patch)
NOTE: recipe gtk-doc-1.33.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1950 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_patch)
NOTE: Running task 1951 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: Running task 1952 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_patch)
NOTE: recipe npth-1.6-r0: task do_patch: Started
NOTE: recipe pinentry-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1953 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_patch)
NOTE: recipe libcomps-0.1.15-r0: task do_patch: Started
NOTE: recipe librepo-1.12.1-r0: task do_patch: Succeeded
NOTE: Running task 1954 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_generate_toolchain_file)
NOTE: recipe libdnf-0.55.0-r0: task do_unpack: Succeeded
NOTE: Running task 1955 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libksba-1.4.0-r0: task do_patch: Started
NOTE: Running task 1956 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_patch)
NOTE: recipe python3-iniparse-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libassuan-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Started
NOTE: recipe libsolv-0.7.16-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_patch: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 1957 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_patch)
NOTE: recipe rpm-1_4.16.0-r0: task do_unpack: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pinentry-1.1.0-r0: task do_patch: Started
NOTE: Running task 1958 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Succeeded
NOTE: Running task 1963 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_patch)
NOTE: recipe dnf-4.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1964 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_patch)
NOTE: recipe python3-six-1.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe librepo-1.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.55.0-r0: task do_patch: Started
NOTE: recipe librepo-1.12.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Started
NOTE: recipe libassuan-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_patch: Started
NOTE: Running task 1965 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iniparse-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Started
NOTE: recipe dnf-4.5.2-r0: task do_patch: Started
NOTE: recipe libcomps-0.1.15-r0: task do_patch: Succeeded
NOTE: Running task 1966 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_generate_toolchain_file)
NOTE: Running task 1967 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1968 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcomps-0.1.15-r0: task do_generate_toolchain_file: Started
NOTE: recipe libcomps-0.1.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.16-r0: task do_patch: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1969 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_generate_toolchain_file)
NOTE: Running task 1973 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Succeeded
NOTE: Running task 1975 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libcomps-0.1.15-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gpgme-1.15.0-r0: task do_unpack: Succeeded
NOTE: recipe pinentry-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1976 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_patch)
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1977 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libmodulemd-2.9.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 763 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: Running task 1978 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libsolv-0.7.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 766 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pinentry-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gpgme-1.15.0-r0: task do_patch: Started
NOTE: recipe libksba-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_patch: Succeeded
NOTE: Running task 1987 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_generate_toolchain_file)
NOTE: Running task 1988 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_deploy_source_date_epoch)
NOTE: recipe json-c-0.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-c-0.15-r0: task do_patch: Succeeded
NOTE: Running task 1989 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_generate_toolchain_file)
NOTE: recipe libsolv-0.7.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1990 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Started
NOTE: recipe pinentry-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dnf-4.5.2-r0: task do_patch: Succeeded
NOTE: Running task 1991 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_generate_toolchain_file)
NOTE: recipe libmodulemd-2.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1992 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1993 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_populate_lic)
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1994 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1995 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe json-c-0.15-r0: task do_generate_toolchain_file: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-c-0.15-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1996 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libdnf-0.55.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe json-c-0.15-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: Running task 1997 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: recipe npth-1.6-r0: task do_patch: Succeeded
NOTE: Running task 1998 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: Running task 1999 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2000 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.73.0-r0: task do_unpack: Succeeded
NOTE: Running task 2001 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_patch)
NOTE: recipe dnf-4.5.2-r0: task do_populate_lic: Started
NOTE: recipe dnf-4.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.5.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Succeeded
NOTE: Running task 2002 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_deploy_source_date_epoch)
NOTE: Running task 2003 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.5.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe json-c-0.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.6-r0: task do_patch: Succeeded
NOTE: Running task 2004 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_configure)
NOTE: Running task 2005 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.73.0-r0: task do_patch: Started
NOTE: recipe dnf-4.5.2-r0: task do_populate_lic: Succeeded
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_populate_lic unihash changed to 8aec06e53131c1eeaa060d7dd31d9117c1200a8351ba162474370c49556df793
NOTE: recipe gtk-doc-1.33.1-r0: task do_patch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.6.15-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2006 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2007 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: Running task 2008 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-c-0.15-r0: task do_configure: Started
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.6.15-r0: task do_patch: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_unpack: Succeeded
NOTE: Running task 2009 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 2010 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_patch)
NOTE: recipe gtk-doc-1.33.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_patch: Succeeded
NOTE: Running task 2011 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_configure)
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2012 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2013 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: Running task 2014 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_configure)
NOTE: recipe rpm-1_4.16.0-r0: task do_patch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: Running task 2015 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2016 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_configure)
NOTE: Running task 2017 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe gpgme-1.15.0-r0: task do_patch: Succeeded
NOTE: Running task 2018 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gnupg-2.2.23-r0: task do_patch: Started
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2019 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure)
NOTE: recipe npth-1.6-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2020 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_configure)
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe gpgme-1.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.6-r0: task do_configure: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_configure: Started
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 768 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 769 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gnupg-2.2.23-r0: task do_patch: Succeeded
NOTE: Running task 2026 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnupg-2.2.23-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnupg-2.2.23-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.15-r0: task do_configure: Succeeded
NOTE: Running task 2031 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_compile)
NOTE: recipe json-c-0.15-r0: task do_compile: Started
NOTE: recipe json-c-0.15-r0: task do_compile: Succeeded
NOTE: Running task 2032 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_install)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 772 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.15-r0: task do_install: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.6-r0: task do_configure: Succeeded
NOTE: Running task 2038 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure_ptest_base)
NOTE: recipe json-c-0.15-r0: task do_install: Succeeded
NOTE: Running task 2039 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_populate_sysroot)
NOTE: Running task 2040 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_package)
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Started
NOTE: recipe json-c-0.15-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.15-r0: task do_package: Started
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2041 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile)
NOTE: recipe nettle-3.6-r0: task do_compile: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running setscene task 775 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 2046 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: recipe json-c-0.15-r0: task do_package: Succeeded
NOTE: Running task 2047 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_packagedata)
NOTE: recipe json-c-0.15-r0: task do_packagedata: Started
NOTE: recipe json-c-0.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2048 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_package_write_rpm)
NOTE: recipe json-c-0.15-r0: task do_package_write_rpm: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_configure: Succeeded
NOTE: Running task 2049 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_compile)
NOTE: recipe gtk-doc-1.33.1-r0: task do_compile: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_compile: Succeeded
NOTE: Running task 2050 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_install)
NOTE: recipe gtk-doc-1.33.1-r0: task do_install: Started
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_install: Succeeded
NOTE: Running task 2051 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_populate_sysroot)
NOTE: Running task 2052 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_package)
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2053 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe gtk-doc-1.33.1-r0: task do_populate_sysroot: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe json-c-0.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 2054 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: recipe gtk-doc-1.33.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2055 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 784 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 785 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 787 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 788 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running task 2064 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2070 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 789 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 790 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 792 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2088 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: Running task 2089 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe npth-1.6-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2105 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe npth-1.6-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to a0fc48f856059ca7065fbf60cb17fa4a7fe9d06056f047e8ab270a0d74051002
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2118 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe npth-1.6-r0: task do_compile: Succeeded
NOTE: Running task 2119 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_package: Succeeded
NOTE: Running task 2120 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_packagedata)
NOTE: recipe npth-1.6-r0: task do_install: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_packagedata: Started
NOTE: recipe npth-1.6-r0: task do_install: Succeeded
NOTE: Running task 2121 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package)
NOTE: Running task 2122 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_populate_sysroot)
NOTE: recipe npth-1.6-r0: task do_package: Started
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2123 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2124 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 2125 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe gtk-doc-1.33.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2126 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_package_write_rpm: Started
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2127 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package_write_rpm)
NOTE: recipe libyaml-0.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2128 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe gtk-doc-1.33.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2129 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libyaml-0.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 11a36dd3e6523ca99b8465d468c380af9aea480f36275496f5948f18128795a3
NOTE: Running task 2130 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2131 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2159 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe npth-1.6-r0: task do_package: Succeeded
NOTE: Running task 2160 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_packagedata)
NOTE: recipe npth-1.6-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2161 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2162 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe npth-1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2163 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Succeeded
NOTE: Running task 2164 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: recipe nettle-3.6-r0: task do_compile: Succeeded
NOTE: Running task 2165 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: Running task 2166 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile_ptest_base)
NOTE: recipe npth-1.6-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 800 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 801 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe npth-1.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2171 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2172 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2173 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2174 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Succeeded
NOTE: Running task 2175 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2176 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe libgpg-error-1.39-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 2177 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2178 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.39-r0: task do_install: Succeeded
NOTE: Running task 2179 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_populate_sysroot)
NOTE: Running task 2180 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2181 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package_write_rpm)
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-src went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dbg went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libsmartcols went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libmount went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libfdisk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libblkid went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swaponoff went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ptest went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-staticdev went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dev went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-doc went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-bash-completion went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dmesg went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-getopt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-kill went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2182 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2183 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2184 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_prepare_recipe_sysroot)
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-more went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mount went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mountpoint went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-su went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-umount went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-agetty went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkid went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blockdev went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-cfdisk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ctrlaltdel went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fdisk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsck went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fstrim went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hwclock went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-losetup went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkswap went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-nologin went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-pivot-root went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-sulogin went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Started
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swapoff went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swapon went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-switch-root went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-cal went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe libassuan-2.5.4-r0: task do_prepare_recipe_sysroot: Started
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chmem went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-choom went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chrt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-col went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe libksba-1.4.0-r0: task do_prepare_recipe_sysroot: Started
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-colcrt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-colrm went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-column went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-eject went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fallocate went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fincore went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-findmnt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-flock went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hardlink went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hexdump went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ionice went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcmk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcrm went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-irqtop went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-isosize went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-last went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-logger went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-look went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsblk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lscpu went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsipc went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsirq went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lslocks went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm: Succeeded
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lslogins went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe libassuan-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsmem went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: Running task 2185 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_configure)
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsns went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mcookie went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mesg went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe libksba-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2186 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_configure)
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-namei went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-nsenter went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-prlimit went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rename went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-renice went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rev went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-script went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-scriptlive went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-scriptreplay went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setarch went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setpriv went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setsid went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setterm went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-taskset went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ul went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-unshare went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: Running setscene task 804 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_populate_sysroot_setscene)
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-utmpdump went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidgen went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidparse went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe libassuan-2.5.4-r0: task do_configure: Started
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wall went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wdctl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-whereis went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe libksba-1.4.0-r0: task do_configure: Started
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-write went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-addpart went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkdiscard went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkzone went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chcpu went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-delpart went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fdformat went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-findfs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsck.cramfs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsfreeze went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ldattach went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkfs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkfs.cramfs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-partx went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-raw went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-readprofile went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-resizepart went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rfkill went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rtcwake went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-runuser went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-sfdisk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Started
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swaplabel went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidd went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wipefs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-zramctl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ca went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-cs went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-da went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-de went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-es went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-et went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-eu went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-fi went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-fr went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-gl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-hr went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-hu went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-id went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-it went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ja went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-nl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pt went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pt-br went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ru went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sl went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sv went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-tr went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-uk went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-vi went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-zh-cn went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
ERROR: util-linux-2.36-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-zh-tw went backwards which would break package feeds (from 0:2.36.1-r0 to 0:2.36-r0) [version-going-backwards]
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2191 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Succeeded
NOTE: Running task 2192 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_packagedata)
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2270 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2273 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2278 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-six-1.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcomps-0.1.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2335 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2336 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_configure)
NOTE: Running task 2337 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_configure)
NOTE: recipe python3-six-1.15.0-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.15-r0: task do_configure: Started
NOTE: recipe python3-six-1.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2338 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_compile)
NOTE: recipe python3-six-1.15.0-r0: task do_compile: Started
NOTE: recipe python3-six-1.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2339 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_install)
NOTE: recipe python3-six-1.15.0-r0: task do_install: Started
NOTE: recipe libcomps-0.1.15-r0: task do_configure: Succeeded
NOTE: Running task 2340 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_compile)
NOTE: recipe libcomps-0.1.15-r0: task do_compile: Started
NOTE: recipe python3-six-1.15.0-r0: task do_install: Succeeded
NOTE: Running task 2341 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_populate_sysroot)
NOTE: Running task 2342 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_package)
NOTE: recipe python3-six-1.15.0-r0: task do_package: Started
NOTE: recipe python3-six-1.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe libcomps-0.1.15-r0: task do_compile: Succeeded
NOTE: Running task 2343 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_install)
NOTE: recipe libcomps-0.1.15-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2344 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install)
NOTE: recipe nettle-3.6-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2345 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_configure)
NOTE: recipe python3-six-1.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2346 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.15-r0: task do_install: Succeeded
NOTE: Running task 2347 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_package)
NOTE: Running task 2348 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_populate_sysroot)
NOTE: recipe python3-iniparse-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_install: Succeeded
NOTE: Running task 2349 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install_ptest_base)
NOTE: recipe libcomps-0.1.15-r0: task do_package: Started
NOTE: recipe libcomps-0.1.15-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2350 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_populate_sysroot)
NOTE: Running task 2351 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package)
NOTE: recipe libcomps-0.1.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_package: Started
NOTE: recipe python3-six-1.15.0-r0: task do_package: Succeeded
NOTE: Running task 2352 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_packagedata)
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata: Started
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2353 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_configure)
NOTE: recipe python3-iniparse-0.4-r0: task do_configure: Started
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2354 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_package_write_rpm)
NOTE: recipe python3-iniparse-0.4-r0: task do_configure: Succeeded
NOTE: Running task 2355 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_compile)
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_compile: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_compile: Succeeded
NOTE: Running task 2356 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_install)
NOTE: recipe python3-iniparse-0.4-r0: task do_install: Started
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_install: Succeeded
NOTE: Running task 2357 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_package)
NOTE: Running task 2358 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_populate_sysroot)
NOTE: recipe libcomps-0.1.15-r0: task do_package: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_package: Started
NOTE: Running task 2359 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libcomps-0.1.15-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Succeeded
NOTE: Running task 2360 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_compile)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_compile: Started
NOTE: recipe libcomps-0.1.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2361 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_package_write_rpm)
NOTE: recipe libcomps-0.1.15-r0: task do_package_write_rpm: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2362 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_compile)
NOTE: recipe python3-iniparse-0.4-r0: task do_package: Succeeded
NOTE: Running task 2363 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_packagedata)
NOTE: recipe libksba-1.4.0-r0: task do_compile: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_packagedata: Started
NOTE: recipe libcomps-0.1.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2364 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_package_write_rpm)
NOTE: recipe python3-iniparse-0.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2365 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_install)
NOTE: recipe libksba-1.4.0-r0: task do_install: Started
NOTE: recipe libksba-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2366 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_package)
NOTE: Running task 2367 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_populate_sysroot)
NOTE: recipe libksba-1.4.0-r0: task do_package: Started
NOTE: recipe libksba-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe libassuan-2.5.4-r0: task do_configure: Succeeded
NOTE: Running task 2368 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_compile)
NOTE: recipe libassuan-2.5.4-r0: task do_compile: Started
NOTE: recipe libksba-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.6-r0: task do_package: Succeeded
NOTE: Running task 2369 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_packagedata)
NOTE: recipe libassuan-2.5.4-r0: task do_compile: Succeeded
NOTE: Running task 2370 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_install)
NOTE: recipe nettle-3.6-r0: task do_packagedata: Started
NOTE: recipe libassuan-2.5.4-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2371 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package_write_rpm)
NOTE: recipe libassuan-2.5.4-r0: task do_install: Succeeded
NOTE: Running task 2372 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_populate_sysroot)
NOTE: Running task 2373 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_package)
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe libassuan-2.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libassuan-2.5.4-r0: task do_package: Started
NOTE: recipe libassuan-2.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2374 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libksba-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2375 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2376 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_packagedata)
NOTE: recipe pinentry-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-1.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libksba-1.4.0-r0: task do_packagedata: Started
NOTE: recipe pinentry-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2377 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_configure)
NOTE: recipe libksba-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe pinentry-1.1.0-r0: task do_configure: Started
NOTE: Running task 2378 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_package_write_rpm)
NOTE: recipe libksba-1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 2379 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_compile)
NOTE: recipe gpgme-1.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2380 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Started
NOTE: recipe gpgme-1.15.0-r0: task do_configure: Started
NOTE: recipe libksba-1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2381 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_compile)
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Started
NOTE: recipe libassuan-2.5.4-r0: task do_package: Succeeded
NOTE: Running task 2382 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_packagedata)
NOTE: recipe libassuan-2.5.4-r0: task do_packagedata: Started
NOTE: recipe libassuan-2.5.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2383 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_package_write_rpm)
NOTE: recipe libassuan-2.5.4-r0: task do_package_write_rpm: Started
NOTE: recipe libassuan-2.5.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pinentry-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2384 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_compile)
NOTE: recipe pinentry-1.1.0-r0: task do_compile: Started
NOTE: recipe pinentry-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2385 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_install)
NOTE: recipe pinentry-1.1.0-r0: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2386 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_install)
NOTE: recipe pinentry-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2387 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_package)
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Started
NOTE: recipe pinentry-1.1.0-r0: task do_package: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 2388 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_populate_sysroot)
NOTE: Running task 2389 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package)
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2390 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pinentry-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2391 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_packagedata)
NOTE: recipe pinentry-1.1.0-r0: task do_packagedata: Started
NOTE: recipe pinentry-1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2392 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_package_write_rpm)
NOTE: recipe pinentry-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe pinentry-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2393 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 2394 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2395 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2396 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_compile)
NOTE: recipe gpgme-1.15.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_compile: Succeeded
NOTE: Running task 2397 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_install)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_install: Succeeded
NOTE: Running task 2398 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot)
NOTE: Running task 2399 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2400 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2401 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_configure)
NOTE: recipe libmodulemd-2.9.4-r0: task do_configure: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_configure: Succeeded
NOTE: Running task 2402 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_compile)
NOTE: recipe libmodulemd-2.9.4-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package: Succeeded
NOTE: Running task 2403 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2404 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_compile: Succeeded
NOTE: Running task 2405 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_install)
NOTE: recipe libmodulemd-2.9.4-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2406 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_compile)
NOTE: recipe rpm-1_4.16.0-r0: task do_compile: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_install: Succeeded
NOTE: Running task 2407 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_sysroot)
NOTE: Running task 2408 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package)
NOTE: recipe libmodulemd-2.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2409 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_install)
NOTE: recipe libunistring-0.9.10-r0: task do_install: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2410 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2411 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package)
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_package: Succeeded
NOTE: Running task 2412 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata)
NOTE: recipe libmodulemd-2.9.4-r0: task do_packagedata: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2413 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package_write_rpm)
NOTE: recipe libmodulemd-2.9.4-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2414 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2415 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_configure)
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2416 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2417 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2418 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_install)
NOTE: recipe rpm-1_4.16.0-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_install: Succeeded
NOTE: Running task 2419 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_populate_sysroot)
NOTE: Running task 2420 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_package)
NOTE: recipe rpm-1_4.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2421 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsolv-0.7.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-1.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2422 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_install)
NOTE: recipe gpgme-1.15.0-r0: task do_install: Started
NOTE: recipe libsolv-0.7.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2423 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_configure)
NOTE: recipe libsolv-0.7.16-r0: task do_configure: Started
NOTE: recipe gpgme-1.15.0-r0: task do_install: Succeeded
NOTE: Running task 2424 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_populate_sysroot)
NOTE: Running task 2425 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_package)
NOTE: recipe gpgme-1.15.0-r0: task do_package: Started
NOTE: recipe gpgme-1.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsolv-0.7.16-r0: task do_configure: Succeeded
NOTE: Running task 2426 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_compile)
NOTE: recipe gpgme-1.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_package: Succeeded
NOTE: Running task 2427 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.0-r0: task do_packagedata: Started
NOTE: recipe gpgme-1.15.0-r0: task do_package: Succeeded
NOTE: Running task 2428 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_packagedata)
NOTE: recipe gpgme-1.15.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2429 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_package_write_rpm)
NOTE: recipe gpgme-1.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2430 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe gpgme-1.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.16-r0: task do_compile: Succeeded
NOTE: Running task 2431 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_install)
NOTE: recipe libsolv-0.7.16-r0: task do_install: Started
NOTE: recipe libsolv-0.7.16-r0: task do_install: Succeeded
NOTE: Running task 2432 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_populate_sysroot)
NOTE: Running task 2433 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_package)
NOTE: recipe libsolv-0.7.16-r0: task do_populate_sysroot: Started
NOTE: recipe libsolv-0.7.16-r0: task do_package: Started
NOTE: recipe libsolv-0.7.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_package: Succeeded
NOTE: Running task 2434 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_packagedata)
NOTE: recipe libsolv-0.7.16-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.16-r0: task do_packagedata: Succeeded
NOTE: Running task 2435 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_package_write_rpm)
NOTE: recipe libsolv-0.7.16-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2436 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_compile)
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2437 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_install)
NOTE: recipe libidn2-2.3.0-r0: task do_install: Started
NOTE: recipe libidn2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2438 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot)
NOTE: Running task 2439 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package)
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2440 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2441 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_configure)
NOTE: recipe gnutls-3.6.15-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 2442 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata)
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2443 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_configure: Succeeded
NOTE: Running task 2444 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_compile)
NOTE: recipe gnutls-3.6.15-r0: task do_compile: Started
NOTE: recipe gnutls-3.6.15-r0: task do_compile: Succeeded
NOTE: Running task 2445 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_install)
NOTE: recipe gnutls-3.6.15-r0: task do_install: Started
NOTE: recipe gnutls-3.6.15-r0: task do_install: Succeeded
NOTE: Running task 2446 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_populate_sysroot)
NOTE: Running task 2447 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_package)
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package: Started
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2448 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2449 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.73.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnupg-2.2.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.73.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2450 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_configure)
NOTE: recipe gnupg-2.2.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2451 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_configure)
NOTE: recipe curl-7.73.0-r0: task do_configure: Started
NOTE: recipe gnupg-2.2.23-r0: task do_configure: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package: Succeeded
NOTE: Running task 2452 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_packagedata)
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2453 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_package_write_rpm)
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_configure: Succeeded
NOTE: Running task 2454 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_compile)
NOTE: recipe gnupg-2.2.23-r0: task do_compile: Started
NOTE: recipe gnupg-2.2.23-r0: task do_compile: Succeeded
NOTE: Running task 2455 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_install)
NOTE: recipe gnupg-2.2.23-r0: task do_install: Started
NOTE: recipe gnupg-2.2.23-r0: task do_install: Succeeded
NOTE: Running task 2456 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_package)
NOTE: recipe gnupg-2.2.23-r0: task do_package: Started
NOTE: recipe gnupg-2.2.23-r0: task do_package: Succeeded
NOTE: Running task 2457 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_packagedata)
NOTE: recipe gnupg-2.2.23-r0: task do_packagedata: Started
NOTE: recipe gnupg-2.2.23-r0: task do_packagedata: Succeeded
NOTE: Running task 2458 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_package_write_rpm)
NOTE: recipe gnupg-2.2.23-r0: task do_package_write_rpm: Started
NOTE: recipe curl-7.73.0-r0: task do_configure: Succeeded
NOTE: Running task 2459 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_compile)
NOTE: recipe curl-7.73.0-r0: task do_compile: Started
NOTE: recipe curl-7.73.0-r0: task do_compile: Succeeded
NOTE: Running task 2460 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_install)
NOTE: recipe curl-7.73.0-r0: task do_install: Started
NOTE: recipe curl-7.73.0-r0: task do_install: Succeeded
NOTE: Running task 2461 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_populate_sysroot)
NOTE: Running task 2462 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_package)
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.73.0-r0: task do_package: Started
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2463 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe librepo-1.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librepo-1.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2464 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_configure)
NOTE: recipe librepo-1.12.1-r0: task do_configure: Started
NOTE: recipe librepo-1.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2465 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_compile)
NOTE: recipe librepo-1.12.1-r0: task do_compile: Started
NOTE: recipe librepo-1.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2466 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_install)
NOTE: recipe gnupg-2.2.23-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_install: Started
NOTE: recipe curl-7.73.0-r0: task do_package: Succeeded
NOTE: Running task 2467 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_packagedata)
NOTE: recipe curl-7.73.0-r0: task do_packagedata: Started
NOTE: recipe librepo-1.12.1-r0: task do_install: Succeeded
NOTE: Running task 2468 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_populate_sysroot)
NOTE: recipe librepo-1.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.73.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2469 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_package)
NOTE: Running task 2470 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_package_write_rpm)
NOTE: recipe librepo-1.12.1-r0: task do_package: Started
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm: Started
NOTE: recipe librepo-1.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2471 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdnf-0.55.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdnf-0.55.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2472 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_configure)
NOTE: recipe libdnf-0.55.0-r0: task do_configure: Started
NOTE: recipe librepo-1.12.1-r0: task do_package: Succeeded
NOTE: Running task 2473 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_packagedata)
NOTE: recipe librepo-1.12.1-r0: task do_packagedata: Started
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2474 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_package_write_rpm)
NOTE: recipe librepo-1.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe libdnf-0.55.0-r0: task do_configure: Succeeded
NOTE: Running task 2475 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_compile)
NOTE: recipe librepo-1.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_compile: Started
NOTE: recipe libdnf-0.55.0-r0: task do_compile: Succeeded
NOTE: Running task 2476 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_install)
NOTE: recipe libdnf-0.55.0-r0: task do_install: Started
NOTE: recipe libdnf-0.55.0-r0: task do_install: Succeeded
NOTE: Running task 2477 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_package)
NOTE: Running task 2478 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_populate_sysroot)
NOTE: recipe libdnf-0.55.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdnf-0.55.0-r0: task do_package: Started
NOTE: recipe libdnf-0.55.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2479 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe dnf-4.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dnf-4.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2480 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_configure)
NOTE: recipe dnf-4.5.2-r0: task do_configure: Started
NOTE: recipe dnf-4.5.2-r0: task do_configure: Succeeded
NOTE: Running task 2481 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_compile)
NOTE: recipe dnf-4.5.2-r0: task do_compile: Started
NOTE: recipe dnf-4.5.2-r0: task do_compile: Succeeded
NOTE: Running task 2482 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_install)
NOTE: recipe dnf-4.5.2-r0: task do_install: Started
NOTE: recipe dnf-4.5.2-r0: task do_install: Succeeded
NOTE: Running task 2483 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_populate_sysroot)
NOTE: recipe dnf-4.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe dnf-4.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_package: Succeeded
NOTE: Running task 2484 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_packagedata)
NOTE: recipe libdnf-0.55.0-r0: task do_packagedata: Started
NOTE: recipe libdnf-0.55.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2485 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_package)
NOTE: Running task 2486 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_package_write_rpm)
NOTE: recipe dnf-4.5.2-r0: task do_package: Started
NOTE: recipe libdnf-0.55.0-r0: task do_package_write_rpm: Started
NOTE: recipe dnf-4.5.2-r0: task do_package: Succeeded
NOTE: Running task 2487 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_packagedata)
NOTE: recipe dnf-4.5.2-r0: task do_packagedata: Started
NOTE: recipe dnf-4.5.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2488 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_package_write_rpm)
NOTE: Running task 2489 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_package_qa)
NOTE: recipe dnf-4.5.2-r0: task do_package_write_rpm: Started
NOTE: recipe dnf-4.5.2-r0: task do_package_qa: Started
NOTE: recipe dnf-4.5.2-r0: task do_package_qa: Succeeded
NOTE: recipe dnf-4.5.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2490 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.5.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2490 tasks of which 2125 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 147 ERROR messages shown, returning a non-zero exit code.

--===============4000030297056990263==--
