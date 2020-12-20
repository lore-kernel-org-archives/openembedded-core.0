Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.23884.1608473714106937002
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 9CD8E38C13AA
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:13 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysvinit: upgrading to 2.98 SUCCEEDED
Message-ID: <MADEUP.16527252319BA571.18165@lists.openembedded.org>
X-Groupsio-MsgNum: 145927
Content-Type: multipart/mixed; boundary="===============2408641253108033999=="

--===============2408641253108033999==
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

--===============2408641253108033999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 806 .bb files complete (0 cached, 806 parsed). 1413 targets, 41 skipped, 0 masked, 0 errors.
Removing 93 recipes from the core2-32 sysroot...done.
Removing 100 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-203325fe75f4b3396a57bb38fe94bb72190a57f8"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:203325fe75f4b3396a57bb38fe94bb72190a57f8"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 477 Found 461 Missed 16 Current 197 (96% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 198 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 199 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 200 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 203 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 204 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
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
NOTE: Running setscene task 254 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
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
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 256 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_package_write_rpm_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 258 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 259 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 260 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 263 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 264 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 265 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 266 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 268 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 269 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 271 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 272 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 273 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 277 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 280 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 281 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 282 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 284 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 285 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 286 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 290 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 293 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 297 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 298 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 299 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: Running setscene task 300 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 301 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 302 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 304 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 305 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 306 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 307 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 308 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 309 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 310 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 311 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 312 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 314 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 315 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 316 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 317 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 318 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 319 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 320 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 321 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 326 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 327 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 328 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 329 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 330 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 331 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 334 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 335 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 343 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-src went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-dbg went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: Running setscene task 347 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-staticdev went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-dev went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: Running setscene task 352 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-doc went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: Running setscene task 355 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-consolefonts went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: Running setscene task 356 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-keymaps went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: Running setscene task 357 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-unimaps went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-consoletrans went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Succeeded
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-cs went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-da went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-de went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-el went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-eo went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Succeeded
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-es went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: Running setscene task 376 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-fr went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-gr went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-id went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-it went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-nl went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pl went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pt went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pt-br went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-ro went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-ru went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-sv went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-tr went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-uk went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: Running setscene task 383 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 384 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-vi went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-zh-cn went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 723 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_fetch)
NOTE: Running task 736 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_fetch)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_fetch: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_fetch: Started
NOTE: Running setscene task 405 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_fetch: Succeeded
NOTE: Running task 929 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_unpack)
NOTE: Running task 932 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_prepare_recipe_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 409 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 413 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_fetch: Succeeded
NOTE: Running task 954 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_unpack)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_unpack: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_unpack: Succeeded
NOTE: Running task 978 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_patch)
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_unpack: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 430 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sysvinit-2.98-r0: task do_unpack: Succeeded
NOTE: Running task 996 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_patch)
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_patch: Succeeded
NOTE: Running setscene task 439 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_packagedata_setscene)
NOTE: Running task 1012 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_deploy_source_date_epoch)
NOTE: recipe sysvinit-2.98-r0: task do_patch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1027 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_configure)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_configure: Started
NOTE: recipe sysvinit-2.98-r0: task do_patch: Succeeded
NOTE: Running task 1028 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_deploy_source_date_epoch)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_configure: Succeeded
NOTE: Running task 1029 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_lic)
NOTE: Running task 1030 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_compile)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_compile: Started
NOTE: recipe sysvinit-2.98-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_lic: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_compile: Succeeded
NOTE: Running task 1031 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_install)
NOTE: recipe sysvinit-2.98-r0: task do_populate_lic: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_lic unihash changed to f1ea31c32af8ceeef5b51ac1f131490006a639180d4e4b6b0d0688e4b705a3aa
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Succeeded
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
NOTE: Running setscene task 460 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 476 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1064 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 496 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 498 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1088 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1092 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 515 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 519 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1106 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 527 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 538 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: Running task 1118 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1139 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 548 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1169 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package: Succeeded
NOTE: Running task 1170 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_packagedata: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1180 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_packagedata: Succeeded
NOTE: Running task 1181 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_package_write_rpm)
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running setscene task 576 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_packagedata_setscene)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package_write_rpm: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 592 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package_write_rpm: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1238 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ac9535620c869a5ab0014bf3b6f9b8138e6f7b60a06f668c27308a6b7faf6f5c
NOTE: Running task 1247 of 2140 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 638 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 650 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 654 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 656 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 668 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 669 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 671 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 672 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 673 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 674 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_deploy_source_date_epoch_setscene)
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
NOTE: recipe sysvinit-2.98-r0: task do_populate_sysroot: Started
NOTE: recipe sysvinit-2.98-r0: task do_package: Started
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
NOTE: Tasks Summary: Attempted 2140 tasks of which 2104 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 31 ERROR messages shown, returning a non-zero exit code.

--===============2408641253108033999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 806 .bb files complete (0 cached, 806 parsed). 1413 targets, 48 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.2+snapshot-203325fe75f4b3396a57bb38fe94bb72190a57f8"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:203325fe75f4b3396a57bb38fe94bb72190a57f8"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 22 Found 7 Missed 15 Current 641 (31% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 648 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 649 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1092 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 661 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_packagedata_setscene)
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1501 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_fetch)
NOTE: Running task 1551 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_fetch)
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-src went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-dbg went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-staticdev went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-dev went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-doc went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe sysvinit-2.98-r0: task do_fetch: Started
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-consolefonts went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_fetch: Started
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-keymaps went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-unimaps went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_fetch: Succeeded
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-consoletrans went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: Running task 1846 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_unpack)
NOTE: Running task 1847 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_prepare_recipe_sysroot)
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-cs went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe sysvinit-2.98-r0: task do_fetch: Succeeded
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-da went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: Running task 1871 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_unpack)
NOTE: Running task 1872 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_prepare_recipe_sysroot)
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-de went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-el went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-eo went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-es went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-fr went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-gr went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-id went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-it went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-nl went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pl went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pt went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pt-br went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-ro went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_unpack: Started
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-ru went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_prepare_recipe_sysroot: Started
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-sv went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-tr went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-uk went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_unpack: Succeeded
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-vi went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe sysvinit-2.98-r0: task do_unpack: Started
NOTE: Running task 2016 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_patch)
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-zh-cn went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_patch: Started
NOTE: recipe sysvinit-2.98-r0: task do_unpack: Succeeded
NOTE: Running task 2028 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_patch: Succeeded
NOTE: Running task 2029 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_deploy_source_date_epoch)
NOTE: recipe sysvinit-2.98-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_patch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2030 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2031 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2032 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_configure)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_configure: Succeeded
NOTE: Running task 2033 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_compile)
NOTE: recipe sysvinit-2.98-r0: task do_patch: Succeeded
NOTE: Running task 2034 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_deploy_source_date_epoch)
NOTE: Running task 2035 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_lic)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_compile: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_compile: Succeeded
NOTE: Running task 2036 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_install)
NOTE: recipe sysvinit-2.98-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 4afa4bf6d6af0f9b0ec6cc54ada6a7b4e7df888546efb580903da42cd99138dd
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_install: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_lic unihash changed to f1ea31c32af8ceeef5b51ac1f131490006a639180d4e4b6b0d0688e4b705a3aa
NOTE: recipe sysvinit-2.98-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2078 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_configure)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_install: Succeeded
NOTE: Running task 2079 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_package)
NOTE: recipe sysvinit-2.98-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2080 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe sysvinit-2.98-r0: task do_configure: Succeeded
NOTE: Running task 2081 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_compile)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe sysvinit-2.98-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 1e18228b8ee309f68af63c67d03f1749bb3f69fe65279cea47e056c09bcfd14e
NOTE: Setscene tasks completed
NOTE: Running task 2108 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_compile: Succeeded
NOTE: Running task 2111 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_install)
NOTE: recipe sysvinit-2.98-r0: task do_install: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package: Succeeded
NOTE: Running task 2112 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_packagedata)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_packagedata: Started
NOTE: recipe sysvinit-2.98-r0: task do_install: Succeeded
NOTE: Running task 2113 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_package)
NOTE: Running task 2114 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_sysroot)
NOTE: recipe sysvinit-2.98-r0: task do_package: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_sysroot: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_packagedata: Succeeded
NOTE: Running task 2115 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_package_write_rpm)
NOTE: recipe sysvinit-2.98-r0: task do_populate_sysroot: Succeeded
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
NOTE: Tasks Summary: Attempted 2119 tasks of which 2088 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 31 ERROR messages shown, returning a non-zero exit code.

--===============2408641253108033999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 806 .bb files complete (0 cached, 806 parsed). 1413 targets, 66 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.2+snapshot-203325fe75f4b3396a57bb38fe94bb72190a57f8"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:203325fe75f4b3396a57bb38fe94bb72190a57f8"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 22 Found 7 Missed 15 Current 641 (31% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 648 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 649 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 661 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_packagedata_setscene)
NOTE: Running task 1092 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Started
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-src went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-dbg went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-staticdev went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-dev went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-doc went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-consolefonts went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-keymaps went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-unimaps went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-consoletrans went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-cs went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-da went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-de went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-el went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-eo went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-es went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-fr went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-gr went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-id went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-it went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-nl went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pl went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pt went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pt-br went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-ro went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-ru went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-sv went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-tr went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-uk went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-vi went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-zh-cn went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1501 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_fetch)
NOTE: Running task 1551 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_fetch)
NOTE: recipe sysvinit-2.98-r0: task do_fetch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_fetch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_fetch: Succeeded
NOTE: Running task 1818 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_unpack)
NOTE: Running task 1819 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_prepare_recipe_sysroot)
NOTE: recipe sysvinit-2.98-r0: task do_fetch: Succeeded
NOTE: Running task 1848 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_unpack)
NOTE: Running task 1849 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_prepare_recipe_sysroot)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_unpack: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysvinit-2.98-r0: task do_unpack: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_unpack: Succeeded
NOTE: Running task 2027 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_patch)
NOTE: recipe sysvinit-2.98-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_patch: Started
NOTE: recipe sysvinit-2.98-r0: task do_unpack: Succeeded
NOTE: Running task 2028 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_patch)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_patch: Succeeded
NOTE: Running task 2029 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe sysvinit-2.98-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_patch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2030 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2031 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2032 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_configure: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_configure: Succeeded
NOTE: Running task 2033 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_compile)
NOTE: recipe sysvinit-2.98-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2034 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_deploy_source_date_epoch)
NOTE: Running task 2035 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_compile: Started
NOTE: recipe sysvinit-2.98-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_lic: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_compile: Succeeded
NOTE: Running task 2036 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_install)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_install: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_lic unihash changed to f1ea31c32af8ceeef5b51ac1f131490006a639180d4e4b6b0d0688e4b705a3aa
NOTE: recipe sysvinit-2.98-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2037 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 66ffbf0739ea4a70f7fc262363902d5eed0c8052d475b1a42659dcacb986d5de
NOTE: recipe sysvinit-2.98-r0: task do_configure: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_install: Succeeded
NOTE: Running task 2079 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_package)
NOTE: recipe sysvinit-2.98-r0: task do_configure: Succeeded
NOTE: Running task 2080 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_compile)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package: Started
NOTE: recipe sysvinit-2.98-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2081 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c23f7cf00e40a11df88ab6ad9600ca1a11c71db53b6ce62b3aebf6c2f935e59e
NOTE: Setscene tasks completed
NOTE: Running task 2108 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
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
NOTE: Tasks Summary: Attempted 2119 tasks of which 2088 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 31 ERROR messages shown, returning a non-zero exit code.

--===============2408641253108033999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sysvinit: PV changed from "2.97" to "2.98"
packages/core2-32-poky-linux/sysvinit: SRC_URI changed from "https://download.savannah.gnu.org/releases/sysvinit/sysvinit-2.97.tar.xz file://install.patch file://crypt-lib.patch file://pidof-add-m-option.patch file://realpath.patch file://0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch file://rcS-default file://rc file://rcS file://bootlogd.init file://01_bootlogd" to "https://download.savannah.gnu.org/releases/sysvinit/sysvinit-2.98.tar.xz file://install.patch file://crypt-lib.patch file://pidof-add-m-option.patch file://realpath.patch file://0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch file://rcS-default file://rc file://rcS file://bootlogd.init file://01_bootlogd"
packages/core2-32-poky-linux/sysvinit: PKGV changed from 2.97 [default] to 2.98 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-dbg: PV changed from "2.97" to "2.98"
packages/core2-32-poky-linux/sysvinit/sysvinit-dbg: PKGSIZE changed from 538148 to 538180 (+0%)
packages/core2-32-poky-linux/sysvinit/sysvinit-dbg: PKGV changed from 2.97 [default] to 2.98 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-dev: PV changed from "2.97" to "2.98"
packages/core2-32-poky-linux/sysvinit/sysvinit-dev: PKGV changed from 2.97 [default] to 2.98 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-doc: PV changed from "2.97" to "2.98"
packages/core2-32-poky-linux/sysvinit/sysvinit-doc: PKGV changed from 2.97 [default] to 2.98 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-locale: PV changed from "2.97" to "2.98"
packages/core2-32-poky-linux/sysvinit/sysvinit-locale: PKGV changed from 2.97 [default] to 2.98 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-pidof: PV changed from "2.97" to "2.98"
packages/core2-32-poky-linux/sysvinit/sysvinit-pidof: PKGV changed from 2.97 [default] to 2.98 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-src: PV changed from "2.97" to "2.98"
packages/core2-32-poky-linux/sysvinit/sysvinit-src: PKGSIZE changed from 268196 to 268249 (+0%)
packages/core2-32-poky-linux/sysvinit/sysvinit-src: PKGV changed from 2.97 [default] to 2.98 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-staticdev: PV changed from "2.97" to "2.98"
packages/core2-32-poky-linux/sysvinit/sysvinit-staticdev: PKGV changed from 2.97 [default] to 2.98 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-sulogin: PV changed from "2.97" to "2.98"
packages/core2-32-poky-linux/sysvinit/sysvinit-sulogin: PKGV changed from 2.97 [default] to 2.98 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit: PV changed from "2.97" to "2.98"
packages/core2-32-poky-linux/sysvinit/sysvinit: PKGV changed from 2.97 [default] to 2.98 [default]

--===============2408641253108033999==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-sysvinit-upgrade-2.97-2.98.patch"

From 9bef8d3acd5cd75fd165e972283a394852525d3f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 19 Dec 2020 21:46:28 +0000
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
2.20.1


--===============2408641253108033999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 806 .bb files complete (0 cached, 806 parsed). 1413 targets, 57 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.2+snapshot-203325fe75f4b3396a57bb38fe94bb72190a57f8"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:203325fe75f4b3396a57bb38fe94bb72190a57f8"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 22 Found 7 Missed 15 Current 641 (31% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 648 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 649 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1092 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 661 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_packagedata_setscene)
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1501 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_fetch)
NOTE: Running task 1551 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_fetch)
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-src went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-dbg went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-staticdev went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-dev went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-doc went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-consolefonts went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe sysvinit-2.98-r0: task do_fetch: Started
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-keymaps went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_fetch: Started
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-unimaps went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-consoletrans went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_fetch: Succeeded
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-cs went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: Running task 1878 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_unpack)
NOTE: Running task 1879 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_prepare_recipe_sysroot)
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-da went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe sysvinit-2.98-r0: task do_fetch: Succeeded
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-de went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: Running task 1917 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_unpack)
NOTE: Running task 1918 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_prepare_recipe_sysroot)
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-el went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-eo went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-es went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-fr went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-gr went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-id went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-it went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-nl went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pl went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pt went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pt-br went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_unpack: Started
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-ro went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-ru went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-sv went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_unpack: Succeeded
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-tr went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe sysvinit-2.98-r0: task do_unpack: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2016 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_patch)
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-uk went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe sysvinit-2.98-r0: task do_prepare_recipe_sysroot: Started
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-vi went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-zh-cn went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_patch: Succeeded
NOTE: Running task 2028 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_deploy_source_date_epoch)
NOTE: recipe sysvinit-2.98-r0: task do_unpack: Succeeded
NOTE: Running task 2029 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_patch)
NOTE: recipe sysvinit-2.98-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe sysvinit-2.98-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2030 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2031 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2032 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_configure: Succeeded
NOTE: Running task 2033 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_compile)
NOTE: recipe sysvinit-2.98-r0: task do_patch: Succeeded
NOTE: Running task 2034 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_deploy_source_date_epoch)
NOTE: Running task 2035 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_lic)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_compile: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_compile: Succeeded
NOTE: Running task 2036 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_install)
NOTE: recipe sysvinit-2.98-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to bafeab211f96dcc2837ea65d9a9c6a333eccd590b0b8e09cccb3f79a13753554
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_install: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_lic unihash changed to f1ea31c32af8ceeef5b51ac1f131490006a639180d4e4b6b0d0688e4b705a3aa
NOTE: recipe sysvinit-2.98-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2078 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_configure)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_install: Succeeded
NOTE: Running task 2079 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_configure: Started
NOTE: Running task 2080 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package: Started
NOTE: recipe sysvinit-2.98-r0: task do_configure: Succeeded
NOTE: Running task 2081 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe sysvinit-2.98-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3ebd7986c834cbc527b39a873a77f5cc1ffb99642290f5adb5f91062e33f1954
NOTE: Setscene tasks completed
NOTE: Running task 2108 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_compile: Succeeded
NOTE: Running task 2111 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_install)
NOTE: recipe sysvinit-2.98-r0: task do_install: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package: Succeeded
NOTE: Running task 2112 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_packagedata)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_packagedata: Started
NOTE: recipe sysvinit-2.98-r0: task do_install: Succeeded
NOTE: Running task 2113 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_package)
NOTE: Running task 2114 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_sysroot)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_packagedata: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_package: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_sysroot: Started
NOTE: Running task 2115 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_package_write_rpm)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package_write_rpm: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_sysroot: Succeeded
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
NOTE: Tasks Summary: Attempted 2119 tasks of which 2088 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 31 ERROR messages shown, returning a non-zero exit code.

--===============2408641253108033999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1414 entries from dependency cache.
Parsing recipes...done.
Parsing of 806 .bb files complete (805 cached, 1 parsed). 1413 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-203325fe75f4b3396a57bb38fe94bb72190a57f8"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:203325fe75f4b3396a57bb38fe94bb72190a57f8"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 22 Found 7 Missed 15 Current 641 (31% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 648 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 649 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 661 of 663 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_packagedata_setscene)
NOTE: Running task 1092 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Started
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-src went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-dbg went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-staticdev went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-dev went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-doc went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-consolefonts went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-keymaps went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-unimaps went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-consoletrans went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-cs went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-da went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-de went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-el went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-eo went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-es went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-fr went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-gr went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-id went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-it went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-nl went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pl went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pt went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-pt-br went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-ro went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-ru went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-sv went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-tr went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-uk went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-vi went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: kbd-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package kbd-locale-zh-cn went backwards which would break package feeds (from 0:2.4.0-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: Running task 1501 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_fetch)
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1551 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_fetch)
NOTE: recipe sysvinit-2.98-r0: task do_fetch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_fetch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_fetch: Succeeded
NOTE: Running task 1851 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_unpack)
NOTE: Running task 1852 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_prepare_recipe_sysroot)
NOTE: recipe sysvinit-2.98-r0: task do_fetch: Succeeded
NOTE: Running task 1864 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_unpack)
NOTE: Running task 1865 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_prepare_recipe_sysroot)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_unpack: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysvinit-2.98-r0: task do_unpack: Started
NOTE: recipe sysvinit-2.98-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_unpack: Succeeded
NOTE: Running task 2027 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_patch)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_patch: Started
NOTE: recipe sysvinit-2.98-r0: task do_unpack: Succeeded
NOTE: Running task 2028 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_patch)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_patch: Succeeded
NOTE: Running task 2029 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe sysvinit-2.98-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_patch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2030 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2031 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2032 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_configure: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2033 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_compile)
NOTE: recipe sysvinit-2.98-r0: task do_patch: Succeeded
NOTE: Running task 2034 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_deploy_source_date_epoch)
NOTE: Running task 2035 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_compile: Started
NOTE: recipe sysvinit-2.98-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_lic: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_compile: Succeeded
NOTE: Running task 2036 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_install)
NOTE: recipe sysvinit-2.98-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_lic unihash changed to f1ea31c32af8ceeef5b51ac1f131490006a639180d4e4b6b0d0688e4b705a3aa
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_install: Started
NOTE: recipe sysvinit-2.98-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2037 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to a0fc48f856059ca7065fbf60cb17fa4a7fe9d06056f047e8ab270a0d74051002
NOTE: recipe sysvinit-2.98-r0: task do_configure: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_install: Succeeded
NOTE: Running task 2079 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_package)
NOTE: recipe sysvinit-2.98-r0: task do_configure: Succeeded
NOTE: Running task 2080 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_compile)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package: Started
NOTE: recipe sysvinit-2.98-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2081 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 11a36dd3e6523ca99b8465d468c380af9aea480f36275496f5948f18128795a3
NOTE: Setscene tasks completed
NOTE: Running task 2108 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_compile: Succeeded
NOTE: Running task 2111 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_install)
NOTE: recipe sysvinit-2.98-r0: task do_install: Started
NOTE: recipe sysvinit-2.98-r0: task do_install: Succeeded
NOTE: Running task 2112 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_package)
NOTE: Running task 2113 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_2.98.bb:do_populate_sysroot)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package: Succeeded
NOTE: recipe sysvinit-2.98-r0: task do_package: Started
NOTE: recipe sysvinit-2.98-r0: task do_populate_sysroot: Started
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
NOTE: Tasks Summary: Attempted 2119 tasks of which 2088 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 31 ERROR messages shown, returning a non-zero exit code.

--===============2408641253108033999==--
