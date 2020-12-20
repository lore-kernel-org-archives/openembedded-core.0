Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.23887.1608473714903538262
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6B3E538C1404
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:15 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xserver-xorg: upgrading to 1.20.10 SUCCEEDED
Message-ID: <MADEUP.16527252C9B9D49C.5278@lists.openembedded.org>
X-Groupsio-MsgNum: 145967
Content-Type: multipart/mixed; boundary="===============1627104551542697762=="

--===============1627104551542697762==
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

--===============1627104551542697762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (0 cached, 807 parsed). 1416 targets, 41 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.2+snapshot-b854ccbd707addbee152a5bbbd75c2fc7d8ffff7"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b854ccbd707addbee152a5bbbd75c2fc7d8ffff7"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 614 Found 547 Missed 67 Current 214 (89% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 215 of 828 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 222 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 267 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 268 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 269 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 270 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 271 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 275 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 276 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 277 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 278 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 285 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 286 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 287 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 289 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_package_write_rpm_setscene)
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 293 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 297 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 304 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 305 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 306 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 307 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 308 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 315 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 316 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 317 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 318 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 319 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 323 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: Running setscene task 324 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 325 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 328 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 332 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 333 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 335 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe mesa-2_20.2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 336 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 337 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 338 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 339 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 340 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 344 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 345 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 372 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 384 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 395 of 828 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 400 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 401 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 402 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 406 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 407 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 408 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 409 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 410 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 415 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 417 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 418 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 419 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 423 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 424 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 425 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 426 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package_write_rpm_setscene)
NOTE: recipe mesa-2_20.2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 427 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 430 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 433 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 437 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 446 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 447 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 449 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 452 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 453 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 467 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 469 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 470 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 474 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 475 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 477 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 478 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 481 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 485 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 491 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_20.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 492 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_20.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 495 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 501 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 505 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 506 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 510 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 686 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 687 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_fetch)
NOTE: Running task 688 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: Running task 689 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_fetch)
NOTE: Running setscene task 518 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 724 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 762 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: Running task 770 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_write_config)
NOTE: recipe mesa-2_20.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 778 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_fetch)
NOTE: Running setscene task 520 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 522 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Started
NOTE: Running task 816 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_fetch)
NOTE: Running task 856 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_fetch)
NOTE: Running task 857 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_fetch)
NOTE: Running task 858 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_fetch)
NOTE: Running task 859 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_fetch)
NOTE: Running task 873 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_fetch)
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe libevdev-1.10.0-r0: task do_fetch: Started
NOTE: recipe libinput-1.16.4-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: Running setscene task 531 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libinput-1.16.4-r0: task do_write_config: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libinput-1.16.4-r0: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1079 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_unpack)
NOTE: Running task 1083 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata_setscene: Started
NOTE: Running task 1084 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 538 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 541 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 542 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 543 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 544 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 545 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 547 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1085 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_unpack)
NOTE: Running task 1086 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: recipe libinput-1.16.4-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_fetch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_fetch: Started
NOTE: recipe libinput-1.16.4-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_fetch: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1115 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: Running task 1119 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_unpack)
NOTE: Running task 1124 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_unpack)
NOTE: Running task 1131 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_unpack)
NOTE: Running task 1132 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_unpack)
NOTE: Running task 1133 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_unpack)
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libevdev-1.10.0-r0: task do_unpack: Started
NOTE: Running task 1134 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_unpack)
NOTE: Running task 1136 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_unpack)
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1145 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
NOTE: Running task 1146 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_20.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 565 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 570 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Started
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 572 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_packagedata_setscene)
NOTE: Running task 1153 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_unpack: Started
NOTE: Running setscene task 575 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 576 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Succeeded
NOTE: Running task 1161 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_unpack: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Started
NOTE: Running setscene task 578 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1166 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 580 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 581 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running task 1167 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_patch)
NOTE: Running setscene task 583 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 584 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 1169 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_patch)
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 585 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkbcomp-1.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1170 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_unpack: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1171 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_patch)
NOTE: Running task 1172 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: Running task 1173 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_patch)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: Running task 1174 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_patch)
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_patch: Started
NOTE: Running task 1175 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1176 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Started
NOTE: Running task 1189 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1190 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1199 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe xkbcomp-1.4.4-r0: task do_patch: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 591 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 593 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libinput-1.16.4-r0: task do_patch: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1204 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_deploy_source_date_epoch)
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1205 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1206 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1207 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1208 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1209 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 596 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1210 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libinput-1.16.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libevdev-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 601 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 603 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 606 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_unpack: Succeeded
NOTE: Running task 1236 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_patch)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 614 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 615 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 616 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Started
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 621 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 623 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 628 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 629 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 633 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_patch: Succeeded
NOTE: Running task 1255 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1256 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_lic)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 645 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1257 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_lic: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1266 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1267 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running setscene task 648 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 650 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 652 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 656 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 657 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 658 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 662 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 666 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_lic: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_lic unihash changed to b0ead48b77c6bdf68c926741b361e6bb8fc35fbf7a721333f95fe157aaa19034
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 668 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 669 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 670 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1295 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 674 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 681 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 685 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 686 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 692 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1314 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 695 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 697 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1325 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 701 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 702 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 707 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 709 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 710 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 711 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 717 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1345 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 719 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 721 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 723 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 726 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 728 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 729 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 730 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 731 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 746 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 749 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 750 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 751 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1380 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 753 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 755 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 756 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 757 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 760 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 761 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 762 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 764 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 767 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 768 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 769 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 773 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 779 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 783 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 784 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 785 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 786 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 787 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
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
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1453 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running setscene task 795 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 797 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 798 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ac9535620c869a5ab0014bf3b6f9b8138e6f7b60a06f668c27308a6b7faf6f5c
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1462 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: Running setscene task 802 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 803 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 804 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 806 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 810 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 811 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 812 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 813 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 814 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 822 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 823 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 825 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 826 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 828 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 829 of 828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1787 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1938 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1940 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1962 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2052 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2198 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2199 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2396 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: recipe libevdev-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2397 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_configure)
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2398 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2399 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 6c0422073d22e07b8d4a881cee113af4d2adac7abce1d859c2ffb593aace9791
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2451 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2469 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_configure)
NOTE: recipe libevdev-1.10.0-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Started
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Succeeded
NOTE: Running task 2470 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_compile)
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Succeeded
NOTE: Running task 2471 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_install)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Succeeded
NOTE: Running task 2472 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Succeeded
NOTE: Running task 2473 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Succeeded
NOTE: Running task 2474 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 2475 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2476 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_compile)
NOTE: Running task 2477 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2478 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 2479 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 2480 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Started
NOTE: Running task 2481 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Succeeded
NOTE: Running task 2482 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package)
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2483 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2484 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2485 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 2486 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2487 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2488 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 2489 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Succeeded
NOTE: Running task 2490 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_packagedata)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2491 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_compile)
NOTE: recipe libevdev-1.10.0-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2492 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2493 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2494 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2495 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 2496 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2497 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2498 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2499 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_configure)
NOTE: recipe libevdev-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2500 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_install)
NOTE: recipe xkbcomp-1.4.4-r0: task do_configure: Started
NOTE: recipe libevdev-1.10.0-r0: task do_install: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 2501 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 2502 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_package)
NOTE: recipe libevdev-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.10.0-r0: task do_package: Started
NOTE: recipe libevdev-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2503 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2504 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2505 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package_write_rpm)
NOTE: recipe libinput-1.16.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2506 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libinput-1.16.4-r0: task do_configure: Started
NOTE: recipe libevdev-1.10.0-r0: task do_package: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2507 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_packagedata)
NOTE: recipe libevdev-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2508 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_package_write_rpm)
NOTE: recipe libevdev-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe libinput-1.16.4-r0: task do_configure: Succeeded
NOTE: Running task 2509 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.16.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2510 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_compile)
NOTE: recipe libevdev-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2511 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2512 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe xkbcomp-1.4.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2513 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2514 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 2515 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2516 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_install)
NOTE: recipe xkbcomp-1.4.4-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_install: Succeeded
NOTE: Running task 2517 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_package)
NOTE: recipe xkbcomp-1.4.4-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2518 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2519 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_compile: Succeeded
NOTE: Running task 2520 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_compile_ptest_base)
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.16.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2521 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_install)
NOTE: recipe libinput-1.16.4-r0: task do_install: Started
NOTE: recipe libinput-1.16.4-r0: task do_install: Succeeded
NOTE: Running task 2522 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_install_ptest_base)
NOTE: recipe libinput-1.16.4-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2523 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_package)
NOTE: Running task 2524 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_populate_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_package: Started
NOTE: recipe libinput-1.16.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2525 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_configure)
NOTE: Running task 2526 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_configure)
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_package: Succeeded
NOTE: Running task 2527 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: Running task 2528 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_packagedata)
NOTE: recipe libinput-1.16.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2529 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2530 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_package_write_rpm)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_package_write_rpm: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_package: Succeeded
NOTE: Running task 2531 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_packagedata)
NOTE: recipe libinput-1.16.4-r0: task do_packagedata: Started
NOTE: recipe libinput-1.16.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2532 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_package_write_rpm)
NOTE: recipe libinput-1.16.4-r0: task do_package_write_rpm: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2533 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_compile)
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Started
NOTE: recipe libinput-1.16.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2534 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_install)
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2535 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2536 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_packagedata)
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2537 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package_write_rpm)
NOTE: Running task 2538 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package_write_rpm)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Succeeded
NOTE: Running task 2539 of 2561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Started
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
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_sysroot: Started
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
NOTE: Tasks Summary: Attempted 2561 tasks of which 2392 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============1627104551542697762==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-xserver-xorg-upgrade-1.20.9-1.20.10.patch"

From 3b061b76583737b49f67c6859bf34b9a1759cd78 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 09:49:51 +0000
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
2.20.1


--===============1627104551542697762==
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
DISTRO_VERSION       = "3.2+snapshot-b854ccbd707addbee152a5bbbd75c2fc7d8ffff7"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b854ccbd707addbee152a5bbbd75c2fc7d8ffff7"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 169 Found 103 Missed 66 Current 648 (60% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 733 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 776 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 788 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 815 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1096 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
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
NOTE: Running task 1307 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_fetch)
NOTE: Running task 1309 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1316 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: Running task 1318 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_fetch)
NOTE: Running task 1406 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: Running task 1480 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1515 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_write_config)
NOTE: Running task 1528 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe libevdev-1.10.0-r0: task do_fetch: Started
NOTE: recipe libinput-1.16.4-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: Running task 1615 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_fetch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 1704 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 1705 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: Running task 1722 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_unpack)
NOTE: Running task 1723 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: Running task 1724 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_unpack)
NOTE: Running task 1725 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1726 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_write_config: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1776 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: Running task 1796 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: Running task 1807 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1830 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_unpack)
NOTE: Running task 1836 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_fetch)
NOTE: Running task 1837 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_fetch)
NOTE: Running task 1838 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_fetch)
NOTE: Running task 1839 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_fetch)
NOTE: Running task 1866 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe libinput-1.16.4-r0: task do_write_config: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_fetch: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_fetch: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_unpack: Started
NOTE: Running task 2069 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_unpack)
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
NOTE: recipe libevdev-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.16.4-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2260 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_fetch: Started
NOTE: Running task 2295 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_fetch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_fetch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_fetch: Succeeded
NOTE: Running task 2338 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_unpack)
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 2339 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_unpack)
NOTE: Running task 2340 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_unpack)
NOTE: Running task 2341 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_unpack)
NOTE: Running task 2342 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.10.0-r0: task do_unpack: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2343 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_unpack)
NOTE: Running task 2344 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2345 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_patch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 2346 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2347 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_unpack: Started
NOTE: recipe libevdev-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_unpack: Succeeded
NOTE: Running task 2348 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_patch)
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2349 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_patch)
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_unpack: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_unpack: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Succeeded
NOTE: Running task 2350 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2351 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_patch)
NOTE: Running task 2352 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Started
NOTE: recipe libevdev-1.10.0-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_unpack: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 2353 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_patch)
NOTE: Running task 2354 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2355 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_unpack: Succeeded
NOTE: Running task 2356 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_patch: Started
NOTE: Running task 2357 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Started
NOTE: recipe libevdev-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2358 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2359 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2360 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_patch: Started
NOTE: Running task 2361 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libinput-1.16.4-r0: task do_patch: Succeeded
NOTE: Running task 2362 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_deploy_source_date_epoch)
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_patch: Started
NOTE: Running task 2363 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_patch: Succeeded
NOTE: Running task 2364 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2365 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_patch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2366 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: Running task 2367 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Started
NOTE: Running task 2368 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.16.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2369 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe xkbcomp-1.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libevdev-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2370 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: Running task 2371 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_configure)
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2372 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2373 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2374 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Succeeded
NOTE: Running task 2375 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_compile)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Succeeded
NOTE: Running task 2376 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_install)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_unpack: Succeeded
NOTE: Running task 2377 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 4afa4bf6d6af0f9b0ec6cc54ada6a7b4e7df888546efb580903da42cd99138dd
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Succeeded
NOTE: Running task 2419 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2420 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_patch: Succeeded
NOTE: Running task 2421 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2422 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_lic)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 1e18228b8ee309f68af63c67d03f1749bb3f69fe65279cea47e056c09bcfd14e
NOTE: Running task 2444 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_lic unihash changed to b0ead48b77c6bdf68c926741b361e6bb8fc35fbf7a721333f95fe157aaa19034
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Succeeded
NOTE: Running task 2452 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Succeeded
NOTE: Running task 2453 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 2454 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2455 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2456 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 2457 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2458 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 2459 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 2460 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Succeeded
NOTE: Running task 2461 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package)
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2462 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2463 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2464 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 2465 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2466 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2467 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 2468 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Succeeded
NOTE: Running task 2469 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_packagedata)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2470 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2471 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package_write_rpm)
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 2472 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2473 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2474 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2475 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2476 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2477 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2478 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_install)
NOTE: recipe xkbcomp-1.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.10.0-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2479 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_configure)
NOTE: recipe xkbcomp-1.4.4-r0: task do_configure: Started
NOTE: recipe libevdev-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 2480 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 2481 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_package)
NOTE: recipe libevdev-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.10.0-r0: task do_package: Started
NOTE: recipe libevdev-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2482 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2483 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2484 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libinput-1.16.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2485 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_configure)
NOTE: recipe libinput-1.16.4-r0: task do_configure: Started
NOTE: recipe libevdev-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 2486 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_packagedata)
NOTE: recipe libevdev-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2487 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_package_write_rpm)
NOTE: recipe libevdev-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe libevdev-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_configure: Succeeded
NOTE: Running task 2488 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.16.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2489 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_compile)
NOTE: recipe libinput-1.16.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2490 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2491 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2492 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe xkbcomp-1.4.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2493 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 2494 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe libinput-1.16.4-r0: task do_compile: Succeeded
NOTE: Running task 2495 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_compile_ptest_base)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2496 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2497 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2498 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_install)
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.16.4-r0: task do_install: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2499 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_configure)
NOTE: Running task 2500 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_configure)
NOTE: recipe xkbcomp-1.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2501 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_install)
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_install: Succeeded
NOTE: Running task 2502 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_package)
NOTE: recipe xkbcomp-1.4.4-r0: task do_package: Started
NOTE: recipe libinput-1.16.4-r0: task do_install: Succeeded
NOTE: Running task 2503 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_install_ptest_base)
NOTE: recipe libinput-1.16.4-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2504 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_package)
NOTE: Running task 2505 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_populate_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_package: Started
NOTE: recipe libinput-1.16.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2506 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libinput-1.16.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2507 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package_write_rpm)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_package: Succeeded
NOTE: Running task 2508 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.4-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2509 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.4-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_package: Succeeded
NOTE: Running task 2510 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_packagedata)
NOTE: recipe libinput-1.16.4-r0: task do_packagedata: Started
NOTE: recipe libinput-1.16.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2511 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_package_write_rpm)
NOTE: recipe libinput-1.16.4-r0: task do_package_write_rpm: Started
NOTE: recipe libinput-1.16.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2512 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_compile)
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2513 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_install)
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2514 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Succeeded
NOTE: Running task 2515 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_compile)
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2516 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_packagedata)
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2517 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package_write_rpm)
NOTE: Running task 2518 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package_write_rpm)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Succeeded
NOTE: Running task 2519 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_install)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Succeeded
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
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_sysroot: Started
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
NOTE: Tasks Summary: Attempted 2540 tasks of which 2377 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============1627104551542697762==
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
DISTRO_VERSION       = "3.2+snapshot-b854ccbd707addbee152a5bbbd75c2fc7d8ffff7"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b854ccbd707addbee152a5bbbd75c2fc7d8ffff7"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 169 Found 103 Missed 66 Current 648 (60% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 733 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 776 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 788 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 815 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: Running task 1096 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
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
NOTE: Running task 1307 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_fetch)
NOTE: Running task 1308 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1316 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: Running task 1318 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_fetch)
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1406 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1480 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: Setscene tasks completed
NOTE: recipe libevdev-1.10.0-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: recipe libinput-1.16.4-r0: task do_fetch: Started
NOTE: recipe libevdev-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1564 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_write_config)
NOTE: Running task 1565 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_unpack)
NOTE: Running task 1566 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 1567 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_fetch: Succeeded
NOTE: Running task 1568 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: Running task 1569 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_unpack)
NOTE: Running task 1570 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1571 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1585 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_fetch)
NOTE: Running task 1586 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1679 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: Running task 1685 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_fetch)
NOTE: Running task 1709 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_write_config: Started
NOTE: recipe libevdev-1.10.0-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe libevdev-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.16.4-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.16.4-r0: task do_write_config: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: Running task 1835 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_fetch)
NOTE: Running task 1836 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_fetch)
NOTE: Running task 1837 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_fetch)
NOTE: Running task 1838 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_fetch)
NOTE: Running task 1864 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1939 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: Running task 1940 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1990 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_unpack)
NOTE: recipe libevdev-1.10.0-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Succeeded
NOTE: Running task 2053 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_patch)
NOTE: Running task 2061 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Started
NOTE: Running task 2062 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_unpack)
NOTE: Running task 2063 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_fetch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Started
NOTE: Running task 2064 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_fetch: Succeeded
NOTE: Running task 2122 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_unpack)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Started
NOTE: Running task 2163 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_unpack)
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2260 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_unpack)
NOTE: Running task 2261 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_unpack)
NOTE: Running task 2262 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.10.0-r0: task do_patch: Started
NOTE: Running task 2263 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_unpack)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Succeeded
NOTE: Running task 2348 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_unpack: Started
NOTE: Running task 2349 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2350 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_patch)
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 2351 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 2352 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_patch)
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2353 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_patch)
NOTE: Running task 2354 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_patch)
NOTE: Running task 2355 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_unpack: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_unpack: Succeeded
NOTE: Running task 2356 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Started
NOTE: recipe libevdev-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2357 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2358 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2359 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Succeeded
NOTE: Running task 2360 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Started
NOTE: recipe libinput-1.16.4-r0: task do_patch: Succeeded
NOTE: Running task 2361 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libevdev-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Succeeded
NOTE: Running task 2362 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_patch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2363 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_patch: Succeeded
NOTE: Running task 2364 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2365 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2366 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2367 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libinput-1.16.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_patch: Succeeded
NOTE: Running task 2368 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: Running task 2369 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2370 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2371 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_configure)
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.16.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_configure: Started
NOTE: Running task 2372 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2373 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2374 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_configure)
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Succeeded
NOTE: Running task 2375 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_compile)
NOTE: recipe xkbcomp-1.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Succeeded
NOTE: Running task 2376 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_install)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 66ffbf0739ea4a70f7fc262363902d5eed0c8052d475b1a42659dcacb986d5de
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_unpack: Succeeded
NOTE: Running task 2418 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Succeeded
NOTE: Running task 2419 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2420 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c23f7cf00e40a11df88ab6ad9600ca1a11c71db53b6ce62b3aebf6c2f935e59e
NOTE: Setscene tasks completed
NOTE: Running task 2442 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_patch: Succeeded
NOTE: Running task 2450 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2451 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_lic: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_lic unihash changed to b0ead48b77c6bdf68c926741b361e6bb8fc35fbf7a721333f95fe157aaa19034
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Succeeded
NOTE: Running task 2452 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Succeeded
NOTE: Running task 2453 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 2454 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2455 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2456 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 2457 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 2458 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 2459 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2460 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Succeeded
NOTE: Running task 2461 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package)
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2462 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2463 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2464 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 2465 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2466 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 2467 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2468 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Succeeded
NOTE: Running task 2469 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_packagedata)
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2470 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package_write_rpm)
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Started
NOTE: recipe libevdev-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2471 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 2472 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe libevdev-1.10.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2473 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2474 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package_write_rpm)
NOTE: recipe mtdev-1.1.6-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2475 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2476 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2477 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2478 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_configure)
NOTE: recipe xkbcomp-1.4.4-r0: task do_configure: Started
NOTE: recipe libevdev-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2479 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_install)
NOTE: recipe libevdev-1.10.0-r0: task do_install: Started
NOTE: recipe libevdev-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 2480 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 2481 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_package)
NOTE: recipe libevdev-1.10.0-r0: task do_package: Started
NOTE: recipe libevdev-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2482 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2483 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2484 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libinput-1.16.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2485 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_configure)
NOTE: recipe libinput-1.16.4-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 2486 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_packagedata)
NOTE: recipe libevdev-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2487 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_package_write_rpm)
NOTE: recipe libevdev-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe libevdev-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_configure: Succeeded
NOTE: Running task 2488 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.16.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2489 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_compile)
NOTE: recipe libinput-1.16.4-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2490 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2491 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe xkbcomp-1.4.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2492 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2493 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2494 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 2495 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe xkbcomp-1.4.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_install: Succeeded
NOTE: Running task 2496 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_package)
NOTE: recipe xkbcomp-1.4.4-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2497 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2498 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2499 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_configure)
NOTE: Running task 2500 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_configure)
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2501 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_package: Succeeded
NOTE: Running task 2502 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2503 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.4-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2504 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.4-r0: task do_package_write_rpm: Started
NOTE: recipe libinput-1.16.4-r0: task do_compile: Succeeded
NOTE: Running task 2505 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_compile_ptest_base)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2506 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_install)
NOTE: recipe libinput-1.16.4-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_install: Succeeded
NOTE: Running task 2507 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_install_ptest_base)
NOTE: recipe libinput-1.16.4-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2508 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_package)
NOTE: Running task 2509 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_populate_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_package: Started
NOTE: recipe libinput-1.16.4-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.16.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_package: Succeeded
NOTE: Running task 2510 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_packagedata)
NOTE: recipe libinput-1.16.4-r0: task do_packagedata: Started
NOTE: recipe libinput-1.16.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2511 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_package_write_rpm)
NOTE: recipe libinput-1.16.4-r0: task do_package_write_rpm: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2512 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_compile)
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2513 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_install)
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2514 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Started
NOTE: recipe libinput-1.16.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2515 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_packagedata)
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2516 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package_write_rpm)
NOTE: Running task 2517 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package_write_rpm)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Succeeded
NOTE: Running task 2518 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_compile)
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Succeeded
NOTE: Running task 2519 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_install)
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
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_sysroot: Started
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
NOTE: Tasks Summary: Attempted 2540 tasks of which 2377 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============1627104551542697762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xserver-xorg: SRC_URI changed from "https://www.x.org/releases//individual/xserver/xorg-server-1.20.9.tar.bz2 file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch file://pkgconfig.patch file://0001-test-xtest-Initialize-array-with-braces.patch file://sdksyms-no-build-path.patch file://0001-drmmode_display.c-add-missing-mi.h-include.patch file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch" to "https://www.x.org/releases//individual/xserver/xorg-server-1.20.10.tar.bz2 file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch file://pkgconfig.patch file://0001-test-xtest-Initialize-array-with-braces.patch file://sdksyms-no-build-path.patch file://0001-drmmode_display.c-add-missing-mi.h-include.patch file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch"
packages/core2-32-poky-linux/xserver-xorg: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xf86-video-modesetting: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xf86-video-modesetting: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-dbg: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGSIZE changed from 36926524 to 36961012 (+0%)
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-dev: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-dev: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-dev: PKGSIZE changed from 1171390 to 1171393 (+0%)
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-doc: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-doc: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-doc: PKGSIZE changed from 133656 to 133665 (+0%)
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PKGSIZE changed from 315280 to 319376 (+1%)
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
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-src: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-src: PKGSIZE changed from 12325085 to 12331562 (+0%)
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
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg: PKGV changed from 1.20.9 [default] to 1.20.10 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg: PV changed from "1.20.9" to "1.20.10"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg: PKGSIZE changed from 2993333 to 2997429 (+0%)

--===============1627104551542697762==
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
DISTRO_VERSION       = "3.2+snapshot-b854ccbd707addbee152a5bbbd75c2fc7d8ffff7"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b854ccbd707addbee152a5bbbd75c2fc7d8ffff7"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 169 Found 103 Missed 66 Current 648 (60% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 733 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 776 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 788 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1096 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 815 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: Running task 1307 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1308 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_fetch)
NOTE: Running task 1316 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: Running task 1318 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_fetch)
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: Running task 1405 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: Running task 1480 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: Running task 1515 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_write_config)
NOTE: Running task 1530 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_fetch)
NOTE: recipe libevdev-1.10.0-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe libinput-1.16.4-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: Running task 1615 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_fetch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 1717 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1718 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
NOTE: recipe libinput-1.16.4-r0: task do_fetch: Succeeded
NOTE: Running task 1719 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_unpack)
NOTE: Running task 1720 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: Running task 1721 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_prepare_recipe_sysroot)
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe libinput-1.16.4-r0: task do_write_config: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Started
NOTE: Running task 1722 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_unpack)
NOTE: Running task 1723 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
NOTE: Running task 1724 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: Running task 1754 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_fetch)
NOTE: Running task 1755 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_fetch)
NOTE: Running task 1756 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_fetch)
NOTE: Running task 1757 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_fetch)
ERROR: libx11-1_1.6.12-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.7.0-r0 to 1:1.6.12-r0) [version-going-backwards]
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1782 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_fetch)
NOTE: Running task 1824 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1836 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_unpack)
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 817 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libinput-1.16.4-r0: task do_write_config: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_fetch: Started
NOTE: recipe libevdev-1.10.0-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
NOTE: recipe libevdev-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.16.4-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1942 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_unpack)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_fetch: Started
NOTE: Running task 1986 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_fetch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Started
NOTE: Running task 2028 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_unpack)
NOTE: Running task 2029 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Started
NOTE: Running task 2060 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_fetch: Succeeded
NOTE: Running task 2102 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_unpack)
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 2152 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_unpack)
NOTE: Running task 2153 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_unpack)
NOTE: Running task 2167 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2202 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Started
NOTE: Running task 2233 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_unpack: Started
NOTE: Running task 2252 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Succeeded
NOTE: Running task 2253 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_patch)
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 2254 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_patch)
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: recipe libinput-1.16.4-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_unpack: Started
NOTE: Running task 2280 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_patch)
NOTE: Running task 2290 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: Running task 2320 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2339 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 2352 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_patch)
NOTE: recipe xkbcomp-1.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2353 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2354 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_patch)
NOTE: Running task 2355 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_patch)
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_patch: Started
NOTE: Running task 2356 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Succeeded
NOTE: Running task 2357 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2358 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libinput-1.16.4-r0: task do_patch: Started
NOTE: Running task 2359 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Succeeded
NOTE: Running task 2360 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_patch: Started
NOTE: recipe libevdev-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_patch: Started
NOTE: Running task 2361 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Started
NOTE: recipe libinput-1.16.4-r0: task do_patch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Started
NOTE: Running task 2362 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2363 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.4-r0: task do_patch: Succeeded
NOTE: Running task 2364 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2365 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2366 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Succeeded
NOTE: Running task 2367 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2368 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2369 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe xkbcomp-1.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2370 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_configure)
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2371 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2372 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: Running task 2373 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libinput-1.16.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Succeeded
NOTE: Running task 2374 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_compile)
NOTE: recipe libevdev-1.10.0-r0: task do_configure: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2375 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Succeeded
NOTE: Running task 2376 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_install)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_unpack: Succeeded
NOTE: Running task 2377 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to bafeab211f96dcc2837ea65d9a9c6a333eccd590b0b8e09cccb3f79a13753554
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Succeeded
NOTE: Running task 2419 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2420 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3ebd7986c834cbc527b39a873a77f5cc1ffb99642290f5adb5f91062e33f1954
NOTE: Setscene tasks completed
NOTE: Running task 2442 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_patch: Succeeded
NOTE: Running task 2450 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2451 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_lic: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_lic: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_lic unihash changed to b0ead48b77c6bdf68c926741b361e6bb8fc35fbf7a721333f95fe157aaa19034
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Succeeded
NOTE: Running task 2452 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Succeeded
NOTE: Running task 2453 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 2454 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2455 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_compile)
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 2456 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2457 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2458 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Succeeded
NOTE: Running task 2459 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package)
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 2460 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 2461 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2462 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2463 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 2464 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2465 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2466 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Succeeded
NOTE: Running task 2467 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_packagedata)
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 2468 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: Running task 2469 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2470 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package_write_rpm)
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2471 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package_write_rpm)
NOTE: recipe mtdev-1.1.6-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2472 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2473 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_compile)
NOTE: recipe libevdev-1.10.0-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2474 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2475 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2476 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2477 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2478 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_install)
NOTE: recipe xkbcomp-1.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.10.0-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2479 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_configure)
NOTE: recipe xkbcomp-1.4.4-r0: task do_configure: Started
NOTE: recipe libevdev-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 2480 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 2481 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_package)
NOTE: recipe libevdev-1.10.0-r0: task do_package: Started
NOTE: recipe libevdev-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2482 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2483 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2484 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libinput-1.16.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2485 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_configure)
NOTE: recipe libinput-1.16.4-r0: task do_configure: Started
NOTE: recipe libevdev-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 2486 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2487 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_package_write_rpm)
NOTE: recipe libevdev-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe libevdev-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_configure: Succeeded
NOTE: Running task 2488 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.16.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2489 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_compile)
NOTE: recipe libinput-1.16.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2490 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2491 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_compile)
NOTE: recipe xkbcomp-1.4.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2492 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2493 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 2494 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2495 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2496 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2497 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_install)
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_install: Succeeded
NOTE: Running task 2498 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_package)
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2499 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_configure)
NOTE: recipe xkbcomp-1.4.4-r0: task do_package: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2500 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_configure)
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Started
NOTE: recipe libinput-1.16.4-r0: task do_compile: Succeeded
NOTE: Running task 2501 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_compile_ptest_base)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2502 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe libinput-1.16.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2503 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libinput-1.16.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2504 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package_write_rpm)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_package: Succeeded
NOTE: Running task 2505 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.4-r0: task do_packagedata: Started
NOTE: recipe libinput-1.16.4-r0: task do_install: Succeeded
NOTE: Running task 2506 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_install_ptest_base)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2507 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_package)
NOTE: Running task 2508 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_populate_sysroot)
NOTE: recipe xkbcomp-1.4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2509 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_package_write_rpm)
NOTE: recipe libinput-1.16.4-r0: task do_package: Started
NOTE: recipe libinput-1.16.4-r0: task do_populate_sysroot: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_package_write_rpm: Started
NOTE: recipe libinput-1.16.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_package: Succeeded
NOTE: Running task 2510 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_packagedata)
NOTE: recipe libinput-1.16.4-r0: task do_packagedata: Started
NOTE: recipe libinput-1.16.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2511 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_package_write_rpm)
NOTE: recipe libinput-1.16.4-r0: task do_package_write_rpm: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2512 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_compile)
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2513 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_install)
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2514 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Started
NOTE: recipe libinput-1.16.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2515 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_packagedata)
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2516 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package_write_rpm)
NOTE: Running task 2517 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package_write_rpm)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Succeeded
NOTE: Running task 2518 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_compile)
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Succeeded
NOTE: Running task 2519 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_install)
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Succeeded
NOTE: Running task 2520 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_populate_sysroot)
NOTE: Running task 2521 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_package)
NOTE: recipe libxfont2-2.0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2522 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package: Succeeded
NOTE: Running task 2523 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.4-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2524 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_package_write_rpm)
NOTE: recipe libxfont2-2.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2525 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_configure)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_configure: Succeeded
NOTE: Running task 2526 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_compile)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_compile: Succeeded
NOTE: Running task 2527 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_install)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_install: Succeeded
NOTE: Running task 2528 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_package)
NOTE: Running task 2529 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_sysroot: Started
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
NOTE: Tasks Summary: Attempted 2540 tasks of which 2377 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============1627104551542697762==
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
DISTRO_VERSION       = "3.2+snapshot-b854ccbd707addbee152a5bbbd75c2fc7d8ffff7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b854ccbd707addbee152a5bbbd75c2fc7d8ffff7"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 170 Found 104 Missed 66 Current 647 (61% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 724 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 733 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 787 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe encodings-1_1.0.5-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.0.5-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 814 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 815 of 817 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1096 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Succeeded
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
NOTE: Running task 1307 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1308 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_fetch)
NOTE: Running task 1316 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: Running task 1318 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_fetch)
NOTE: Running task 1405 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1480 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: recipe libevdev-1.10.0-r0: task do_fetch: Started
NOTE: Running task 1515 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_write_config)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: Running task 1530 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_fetch)
NOTE: recipe libinput-1.16.4-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: recipe libevdev-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 1561 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_unpack)
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1562 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 1563 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_fetch: Succeeded
NOTE: Running task 1564 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: Running task 1565 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_unpack)
NOTE: Running task 1566 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: Running task 1567 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: Running task 1602 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_write_config: Started
NOTE: Running task 1648 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Started
NOTE: Running task 1685 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_fetch)
NOTE: recipe libevdev-1.10.0-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1709 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1710 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_unpack)
NOTE: recipe libinput-1.16.4-r0: task do_write_config: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
NOTE: recipe libevdev-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.16.4-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1836 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_fetch)
NOTE: Running task 1837 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_fetch)
NOTE: Running task 1838 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_fetch)
NOTE: Running task 1839 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_fetch)
NOTE: Running task 1866 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_fetch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: Running task 1925 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1940 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Started
NOTE: recipe libevdev-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 2056 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_patch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_fetch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Started
NOTE: Running task 2088 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_fetch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Succeeded
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_fetch: Succeeded
NOTE: Running task 2136 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_unpack)
NOTE: Running task 2137 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_unpack)
NOTE: Running task 2138 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_fetch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: Running task 2197 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2282 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_patch)
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2325 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_unpack)
NOTE: Running task 2326 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_fetch: Succeeded
NOTE: Running task 2346 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_unpack)
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_unpack: Succeeded
NOTE: Running task 2347 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_unpack)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Started
NOTE: Running task 2348 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_unpack)
NOTE: Running task 2349 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Succeeded
NOTE: Running task 2350 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2351 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: Running task 2352 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2353 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_unpack: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Started
NOTE: Running task 2354 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2355 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_unpack: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 2356 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_patch)
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Started
NOTE: recipe libinput-1.16.4-r0: task do_patch: Started
NOTE: Running task 2357 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.4-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2358 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Succeeded
NOTE: Running task 2359 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2360 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_unpack: Succeeded
NOTE: Running task 2361 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_patch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libevdev-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.16.4-r0: task do_patch: Succeeded
NOTE: Running task 2362 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2363 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_patch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Succeeded
NOTE: Running task 2364 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2365 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2366 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe xkbcomp-1.4.4-r0: task do_patch: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2367 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: Running task 2368 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2369 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2370 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2371 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_configure)
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2372 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2373 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe libevdev-1.10.0-r0: task do_configure: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Succeeded
NOTE: Running task 2374 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_compile)
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2375 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_0.30.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Succeeded
NOTE: Running task 2376 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_install)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_unpack: Succeeded
NOTE: Running task 2377 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to a0fc48f856059ca7065fbf60cb17fa4a7fe9d06056f047e8ab270a0d74051002
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Succeeded
NOTE: Running task 2419 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2420 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 11a36dd3e6523ca99b8465d468c380af9aea480f36275496f5948f18128795a3
NOTE: Setscene tasks completed
NOTE: Running task 2442 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_patch: Succeeded
NOTE: Running task 2450 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2451 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_lic: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb:do_populate_lic unihash changed to b0ead48b77c6bdf68c926741b361e6bb8fc35fbf7a721333f95fe157aaa19034
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Succeeded
NOTE: Running task 2452 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Succeeded
NOTE: Running task 2453 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 2454 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 2455 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2456 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2457 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2458 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 2459 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 2460 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Succeeded
NOTE: Running task 2461 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2462 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2463 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 2464 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2465 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2466 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2467 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 2468 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Succeeded
NOTE: Running task 2469 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_packagedata)
NOTE: recipe libevdev-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2470 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_compile)
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.10.0-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2471 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package_write_rpm)
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 2472 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2473 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2474 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2475 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2476 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package_write_rpm: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2477 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2478 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_install)
NOTE: recipe xkbcomp-1.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2479 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_configure)
NOTE: recipe libevdev-1.10.0-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_configure: Started
NOTE: recipe libevdev-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 2480 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 2481 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_package)
NOTE: recipe libevdev-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.10.0-r0: task do_package: Started
NOTE: recipe libevdev-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2482 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.16.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2483 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2484 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libinput-1.16.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2485 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_configure)
NOTE: recipe libinput-1.16.4-r0: task do_configure: Started
NOTE: recipe libevdev-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 2486 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libevdev-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2487 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.10.0.bb:do_package_write_rpm)
NOTE: recipe libevdev-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe libevdev-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_configure: Succeeded
NOTE: Running task 2488 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.16.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2489 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_compile)
NOTE: recipe libinput-1.16.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2490 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2491 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_compile)
NOTE: recipe xkbcomp-1.4.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2492 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2493 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 2494 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2495 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_install)
NOTE: recipe xkbcomp-1.4.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2496 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2497 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_install: Succeeded
NOTE: Running task 2498 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_package)
NOTE: recipe xkbcomp-1.4.4-r0: task do_package: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2499 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_configure)
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2500 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_configure)
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Started
NOTE: recipe libinput-1.16.4-r0: task do_compile: Succeeded
NOTE: Running task 2501 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.16.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2502 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_install)
NOTE: recipe libinput-1.16.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2503 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libinput-1.16.4-r0: task do_install: Succeeded
NOTE: Running task 2504 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_install_ptest_base)
NOTE: recipe libinput-1.16.4-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.16.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2505 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2506 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_populate_sysroot)
NOTE: Running task 2507 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.4-r0: task do_package: Succeeded
NOTE: Running task 2508 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_packagedata)
NOTE: recipe libinput-1.16.4-r0: task do_package: Started
NOTE: recipe libinput-1.16.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2509 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb:do_package_write_rpm)
NOTE: recipe libinput-1.16.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_package_write_rpm: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.16.4-r0: task do_package: Succeeded
NOTE: Running task 2510 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_packagedata)
NOTE: recipe libinput-1.16.4-r0: task do_packagedata: Started
NOTE: recipe libinput-1.16.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2511 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.16.4.bb:do_package_write_rpm)
NOTE: recipe libinput-1.16.4-r0: task do_package_write_rpm: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2512 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_compile)
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2513 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_install)
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2514 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Succeeded
NOTE: Running task 2515 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_compile)
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Started
NOTE: recipe libinput-1.16.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2516 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_packagedata)
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2517 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package_write_rpm)
NOTE: Running task 2518 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package_write_rpm)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Succeeded
NOTE: Running task 2519 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_install)
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2520 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_populate_sysroot)
NOTE: Running task 2521 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_package)
NOTE: recipe libxfont2-2.0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package: Started
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Succeeded
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
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_1.20.10-r0: task do_populate_sysroot: Started
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
NOTE: Tasks Summary: Attempted 2540 tasks of which 2377 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============1627104551542697762==--
