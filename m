Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.24428.1608473714362442627
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 3A7D338C14BA
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:14 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lighttpd: upgrading to 1.4.57 SUCCEEDED
Message-ID: <MADEUP.165272527386EA44.27420@lists.openembedded.org>
X-Groupsio-MsgNum: 145952
Content-Type: multipart/mixed; boundary="===============1948509647063589746=="

--===============1948509647063589746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lighttpd* to *1.4.57* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lighttpd-upgrade-1.4.56-1.4.57.patch
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

--===============1948509647063589746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (0 cached, 807 parsed). 1416 targets, 41 skipped, 0 masked, 0 errors.
Removing 91 recipes from the core2-32 sysroot...done.
Removing 95 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-11ad6b62384a320cd8d5ca578225776c925a1e28"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:11ad6b62384a320cd8d5ca578225776c925a1e28"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 479 Found 467 Missed 12 Current 191 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 192 of 670 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 193 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 194 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 195 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 197 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 199 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 200 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 203 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 244 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_package_write_rpm_setscene)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 246 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: Running setscene task 247 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 248 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 249 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 259 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 260 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 261 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 262 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 264 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 267 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 268 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 269 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 271 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 274 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 275 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 276 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 277 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 278 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 281 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 282 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 285 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 287 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 288 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: Running setscene task 291 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 293 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_packagedata_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 298 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 303 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 304 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 307 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 309 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 310 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 312 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 313 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 314 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 315 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 316 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 317 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_package_write_rpm_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 318 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 319 of 670 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 320 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 321 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 322 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 323 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 324 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 325 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 328 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package_write_rpm_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 329 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 335 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 343 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 344 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 350 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 352 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 357 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 361 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 380 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 719 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_fetch)
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 391 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 397 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_fetch: Started
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 958 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_unpack)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 411 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_unpack: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 426 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_unpack: Succeeded
NOTE: Running task 992 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_patch)
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_patch: Started
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_patch: Succeeded
NOTE: Running task 1022 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_deploy_source_date_epoch)
NOTE: Running task 1023 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_populate_lic)
NOTE: recipe lighttpd-1.4.57-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_populate_lic: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_populate_lic unihash changed to 01502185511e633b17c73dac7a7e0d62aecddbc7331e5db528b30dfa3a53cc07
NOTE: recipe lighttpd-1.4.57-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 445 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 452 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 459 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 461 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 468 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 475 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 479 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1055 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: Running setscene task 492 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 496 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 1069 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1070 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1097 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 514 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 520 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 522 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1108 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 533 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: Running setscene task 535 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1118 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running setscene task 540 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 548 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1147 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 565 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 567 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 574 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 586 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-src went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dbg went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-staticdev went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dev went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-doc went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-locale went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1210 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 605 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 625 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 637 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 640 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1243 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ac9535620c869a5ab0014bf3b6f9b8138e6f7b60a06f668c27308a6b7faf6f5c
NOTE: Running task 1252 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 646 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 650 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 652 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 653 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 656 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 657 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 664 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 668 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 671 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1892 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_prepare_recipe_sysroot)
NOTE: recipe lighttpd-1.4.57-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2121 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_configure)
NOTE: recipe lighttpd-1.4.57-r0: task do_configure: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_configure: Succeeded
NOTE: Running task 2122 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_compile)
NOTE: recipe lighttpd-1.4.57-r0: task do_compile: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_compile: Succeeded
NOTE: Running task 2123 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_install)
NOTE: recipe lighttpd-1.4.57-r0: task do_install: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_install: Succeeded
NOTE: Running task 2124 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_package)
NOTE: Running task 2125 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_populate_sysroot)
NOTE: recipe lighttpd-1.4.57-r0: task do_populate_sysroot: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_package: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_package: Succeeded
NOTE: Running task 2126 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_packagedata)
NOTE: recipe lighttpd-1.4.57-r0: task do_packagedata: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_packagedata: Succeeded
NOTE: Running task 2127 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_package_write_rpm)
NOTE: Running task 2128 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_package_qa)
NOTE: recipe lighttpd-1.4.57-r0: task do_package_write_rpm: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_package_qa: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_package_qa: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2129 of 2129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_build)
NOTE: Tasks Summary: Attempted 2129 tasks of which 2104 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============1948509647063589746==
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
DISTRO_VERSION       = "3.2+snapshot-11ad6b62384a320cd8d5ca578225776c925a1e28"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:11ad6b62384a320cd8d5ca578225776c925a1e28"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 113 Found 102 Missed 11 Current 546 (90% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 603 of 659 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 604 of 659 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1056 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 659 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: Running task 1448 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_fetch)
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-src went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dbg went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-staticdev went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dev went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-doc went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-locale went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
NOTE: recipe lighttpd-1.4.57-r0: task do_fetch: Started
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
NOTE: recipe lighttpd-1.4.57-r0: task do_fetch: Succeeded
NOTE: Running task 1915 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_unpack)
NOTE: Running task 1916 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 659 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lighttpd-1.4.57-r0: task do_unpack: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe lighttpd-1.4.57-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_unpack: Succeeded
NOTE: Running task 2024 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_patch: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_patch: Succeeded
NOTE: Running task 2025 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_deploy_source_date_epoch)
NOTE: Running task 2026 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_populate_lic: Started
NOTE: Running task 2027 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2028 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2029 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_configure)
NOTE: recipe lighttpd-1.4.57-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_populate_lic unihash changed to 01502185511e633b17c73dac7a7e0d62aecddbc7331e5db528b30dfa3a53cc07
NOTE: recipe lighttpd-1.4.57-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 4afa4bf6d6af0f9b0ec6cc54ada6a7b4e7df888546efb580903da42cd99138dd
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2071 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 1e18228b8ee309f68af63c67d03f1749bb3f69fe65279cea47e056c09bcfd14e
NOTE: Setscene tasks completed
NOTE: Running task 2098 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_configure: Succeeded
NOTE: Running task 2101 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_compile)
NOTE: recipe lighttpd-1.4.57-r0: task do_compile: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_compile: Succeeded
NOTE: Running task 2102 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_install)
NOTE: recipe lighttpd-1.4.57-r0: task do_install: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_install: Succeeded
NOTE: Running task 2103 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_package)
NOTE: Running task 2104 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_populate_sysroot)
NOTE: recipe lighttpd-1.4.57-r0: task do_package: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_populate_sysroot: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_package: Succeeded
NOTE: Running task 2105 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_packagedata)
NOTE: recipe lighttpd-1.4.57-r0: task do_packagedata: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_packagedata: Succeeded
NOTE: Running task 2106 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_package_write_rpm)
NOTE: Running task 2107 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_package_qa)
NOTE: recipe lighttpd-1.4.57-r0: task do_package_write_rpm: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_package_qa: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_package_qa: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2108 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_build)
NOTE: Tasks Summary: Attempted 2108 tasks of which 2088 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============1948509647063589746==
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
DISTRO_VERSION       = "3.2+snapshot-11ad6b62384a320cd8d5ca578225776c925a1e28"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:11ad6b62384a320cd8d5ca578225776c925a1e28"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 113 Found 102 Missed 11 Current 546 (90% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 603 of 659 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 604 of 659 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1056 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 659 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: Running task 1448 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_fetch)
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-src went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dbg went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-staticdev went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dev went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-doc went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-locale went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
NOTE: recipe lighttpd-1.4.57-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_fetch: Succeeded
NOTE: Running setscene task 659 of 659 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1749 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_unpack)
NOTE: Running task 1750 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_unpack: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe lighttpd-1.4.57-r0: task do_unpack: Succeeded
NOTE: Running task 2024 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_patch)
NOTE: recipe lighttpd-1.4.57-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_patch: Succeeded
NOTE: Running task 2025 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_deploy_source_date_epoch)
NOTE: Running task 2026 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_populate_lic)
NOTE: recipe lighttpd-1.4.57-r0: task do_populate_lic: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_populate_lic unihash changed to 01502185511e633b17c73dac7a7e0d62aecddbc7331e5db528b30dfa3a53cc07
NOTE: recipe lighttpd-1.4.57-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2027 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2028 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2029 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe lighttpd-1.4.57-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 66ffbf0739ea4a70f7fc262363902d5eed0c8052d475b1a42659dcacb986d5de
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2071 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c23f7cf00e40a11df88ab6ad9600ca1a11c71db53b6ce62b3aebf6c2f935e59e
NOTE: Setscene tasks completed
NOTE: Running task 2098 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_configure: Succeeded
NOTE: Running task 2101 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_compile)
NOTE: recipe lighttpd-1.4.57-r0: task do_compile: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_compile: Succeeded
NOTE: Running task 2102 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_install)
NOTE: recipe lighttpd-1.4.57-r0: task do_install: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_install: Succeeded
NOTE: Running task 2103 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_package)
NOTE: Running task 2104 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_populate_sysroot)
NOTE: recipe lighttpd-1.4.57-r0: task do_package: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_populate_sysroot: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_package: Succeeded
NOTE: Running task 2105 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_packagedata)
NOTE: recipe lighttpd-1.4.57-r0: task do_packagedata: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_packagedata: Succeeded
NOTE: Running task 2106 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_package_write_rpm)
NOTE: Running task 2107 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_package_qa)
NOTE: recipe lighttpd-1.4.57-r0: task do_package_write_rpm: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_package_qa: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_package_qa: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2108 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_build)
NOTE: Tasks Summary: Attempted 2108 tasks of which 2088 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============1948509647063589746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/lighttpd: SRC_URI changed from "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.56.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch" to "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.57.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch"
packages/core2-32-poky-linux/lighttpd: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PKGSIZE changed from 2686684 to 2692404 (+0%)
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-dev: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-dev: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-doc: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-doc: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-locale: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-locale: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-access: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-access: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-accesslog: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-accesslog: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-alias: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-alias: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-auth: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-auth: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-authn-file: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-authn-file: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-cgi: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-cgi: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-deflate: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-deflate: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-dirlisting: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-dirlisting: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-evasive: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-evasive: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-evhost: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-evhost: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-expire: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-expire: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-extforward: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-extforward: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-fastcgi: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-fastcgi: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-flv-streaming: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-flv-streaming: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-indexfile: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-indexfile: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-openssl: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-openssl: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-proxy: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-proxy: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-redirect: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-redirect: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rewrite: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rewrite: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rrdtool: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rrdtool: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-scgi: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-scgi: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-secdownload: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-secdownload: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-setenv: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-setenv: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-simple-vhost: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-simple-vhost: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-sockproxy: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-sockproxy: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ssi: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ssi: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-staticfile: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-staticfile: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-status: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-status: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-uploadprogress: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-uploadprogress: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-userdir: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-userdir: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-usertrack: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-usertrack: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-vhostdb: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-vhostdb: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-webdav: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-webdav: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-wstunnel: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-wstunnel: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PKGSIZE changed from 2614568 to 2622550 (+0%)
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd-staticdev: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-staticdev: PV changed from "1.4.56" to "1.4.57"
packages/core2-32-poky-linux/lighttpd/lighttpd: PKGSIZE changed from 449680 to 453776 (+1%)
packages/core2-32-poky-linux/lighttpd/lighttpd: PKGV changed from 1.4.56 [default] to 1.4.57 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd: PV changed from "1.4.56" to "1.4.57"

--===============1948509647063589746==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.56-1.4.57.patch"

From 1b532af9433de7223adc769f8a4394857da7cf1e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 03:49:16 +0000
Subject: [PATCH] lighttpd: upgrade 1.4.56 -> 1.4.57

---
 .../lighttpd/{lighttpd_1.4.56.bb => lighttpd_1.4.57.bb}        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.56.bb => lighttpd_1.4.57.bb} (96%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.56.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb
similarity index 96%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.56.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb
index 97d3a2aabf..9a9cad68c8 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.56.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb
@@ -19,8 +19,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
         "
 
-SRC_URI[md5sum] = "9d94f68c8106bfcdfe7aafa0a13f45a8"
-SRC_URI[sha256sum] = "e4ce84cd79e8ae8ba193c7a7cc79c4afba9a076b443ef9f8d4bcd13a3354df77"
+SRC_URI[sha256sum] = "52ca961b89c12f7ecbb2e4e0c5a9e79b2863c64e33c42832a165e7f894d6217f"
 
 PACKAGECONFIG ??= "openssl pcre zlib \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-- 
2.20.1


--===============1948509647063589746==
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
DISTRO_VERSION       = "3.2+snapshot-11ad6b62384a320cd8d5ca578225776c925a1e28"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:11ad6b62384a320cd8d5ca578225776c925a1e28"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 113 Found 102 Missed 11 Current 546 (90% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 603 of 659 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 604 of 659 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1056 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 659 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: Running task 1448 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_fetch)
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-src went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dbg went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-staticdev went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dev went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-doc went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-locale went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
NOTE: recipe lighttpd-1.4.57-r0: task do_fetch: Started
ERROR: libtirpc-1.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc went backwards which would break package feeds (from 0:1.3.1-r0 to 0:1.2.6-r0) [version-going-backwards]
NOTE: recipe lighttpd-1.4.57-r0: task do_fetch: Succeeded
NOTE: Running task 1820 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_unpack)
NOTE: Running task 1821 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 659 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lighttpd-1.4.57-r0: task do_unpack: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe lighttpd-1.4.57-r0: task do_unpack: Succeeded
NOTE: Running task 2024 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_patch)
NOTE: recipe lighttpd-1.4.57-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_patch: Succeeded
NOTE: Running task 2025 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_deploy_source_date_epoch)
NOTE: Running task 2026 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_populate_lic)
NOTE: recipe lighttpd-1.4.57-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2027 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2028 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe lighttpd-1.4.57-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2029 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_configure)
NOTE: recipe lighttpd-1.4.57-r0: task do_populate_lic: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_populate_lic unihash changed to 01502185511e633b17c73dac7a7e0d62aecddbc7331e5db528b30dfa3a53cc07
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to bafeab211f96dcc2837ea65d9a9c6a333eccd590b0b8e09cccb3f79a13753554
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2071 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3ebd7986c834cbc527b39a873a77f5cc1ffb99642290f5adb5f91062e33f1954
NOTE: Setscene tasks completed
NOTE: Running task 2099 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_configure: Succeeded
NOTE: Running task 2101 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_compile)
NOTE: recipe lighttpd-1.4.57-r0: task do_compile: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_compile: Succeeded
NOTE: Running task 2102 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_install)
NOTE: recipe lighttpd-1.4.57-r0: task do_install: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_install: Succeeded
NOTE: Running task 2103 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_package)
NOTE: Running task 2104 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_populate_sysroot)
NOTE: recipe lighttpd-1.4.57-r0: task do_package: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_populate_sysroot: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_package: Succeeded
NOTE: Running task 2105 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_packagedata)
NOTE: recipe lighttpd-1.4.57-r0: task do_packagedata: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_packagedata: Succeeded
NOTE: Running task 2106 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_package_write_rpm)
NOTE: Running task 2107 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_package_qa)
NOTE: recipe lighttpd-1.4.57-r0: task do_package_write_rpm: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_package_qa: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_package_qa: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2108 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_build)
NOTE: Tasks Summary: Attempted 2108 tasks of which 2088 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============1948509647063589746==
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
DISTRO_VERSION       = "3.2+snapshot-11ad6b62384a320cd8d5ca578225776c925a1e28"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:11ad6b62384a320cd8d5ca578225776c925a1e28"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 113 Found 102 Missed 11 Current 546 (90% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 603 of 659 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 604 of 659 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 657 of 659 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: Running task 1056 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
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
NOTE: Running setscene task 659 of 659 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1448 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_fetch)
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe lighttpd-1.4.57-r0: task do_fetch: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_fetch: Succeeded
NOTE: Running task 1785 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_unpack)
NOTE: Running task 1786 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_prepare_recipe_sysroot)
NOTE: recipe lighttpd-1.4.57-r0: task do_unpack: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_unpack: Succeeded
NOTE: Running task 2024 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_patch)
NOTE: recipe lighttpd-1.4.57-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_patch: Succeeded
NOTE: Running task 2025 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_deploy_source_date_epoch)
NOTE: Running task 2026 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_populate_lic)
NOTE: recipe lighttpd-1.4.57-r0: task do_populate_lic: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2027 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2028 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe lighttpd-1.4.57-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_populate_lic unihash changed to 01502185511e633b17c73dac7a7e0d62aecddbc7331e5db528b30dfa3a53cc07
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2029 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_configure)
NOTE: recipe lighttpd-1.4.57-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to a0fc48f856059ca7065fbf60cb17fa4a7fe9d06056f047e8ab270a0d74051002
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2071 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 11a36dd3e6523ca99b8465d468c380af9aea480f36275496f5948f18128795a3
NOTE: Setscene tasks completed
NOTE: Running task 2098 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_configure: Succeeded
NOTE: Running task 2101 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_compile)
NOTE: recipe lighttpd-1.4.57-r0: task do_compile: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_compile: Succeeded
NOTE: Running task 2102 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_install)
NOTE: recipe lighttpd-1.4.57-r0: task do_install: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_install: Succeeded
NOTE: Running task 2103 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_package)
NOTE: Running task 2104 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_populate_sysroot)
NOTE: recipe lighttpd-1.4.57-r0: task do_package: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_populate_sysroot: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_package: Succeeded
NOTE: Running task 2105 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_packagedata)
NOTE: recipe lighttpd-1.4.57-r0: task do_packagedata: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_packagedata: Succeeded
NOTE: Running task 2106 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_package_write_rpm)
NOTE: Running task 2107 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_package_qa)
NOTE: recipe lighttpd-1.4.57-r0: task do_package_write_rpm: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_package_qa: Started
NOTE: recipe lighttpd-1.4.57-r0: task do_package_qa: Succeeded
NOTE: recipe lighttpd-1.4.57-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2108 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb:do_build)
NOTE: Tasks Summary: Attempted 2108 tasks of which 2088 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============1948509647063589746==--
