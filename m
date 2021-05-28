Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.6891.1622200976149296791
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 04:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id 480CA38C1349
	for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 11:22:55 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libmodulemd: upgrading to 2.12.1 SUCCEEDED
Message-ID: <MADEUP.1683373175AC2CF6.13932@lists.openembedded.org>
X-Groupsio-MsgNum: 152348
Content-Type: multipart/mixed; boundary="===============3340723975469334255=="

--===============3340723975469334255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libmodulemd* to *2.12.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmodulemd-upgrade-2.12.0-2.12.1.patch
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

--===============3340723975469334255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 822 .bb files complete (0 cached, 822 parsed). 1456 targets, 41 skipped, 0 masked, 0 errors.
Removing 110 recipes from the core2-32 sysroot...done.
Removing 114 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-c14cccd72ec004a08ec66babd5eae43c2b105b46"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c14cccd72ec004a08ec66babd5eae43c2b105b46"
workspace            = "master:40d3366bea8d2417e89a37c6f2d38e1542160342"

Initialising tasks...done.
Sstate summary: Wanted 568 Local 540 Network 0 Missed 28 Current 201 (95% match, 96% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 203 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 208 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 267 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 271 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
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
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 272 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 273 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 277 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 281 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 283 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 284 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 285 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 293 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 294 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 295 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 296 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 297 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 298 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 299 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 300 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 301 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 303 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 304 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 305 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 306 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 307 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 308 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 309 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 311 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 312 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 313 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 314 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 316 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 317 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 318 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 319 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 320 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 321 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 322 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 323 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 324 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 326 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 328 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 330 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 331 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 332 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 333 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 335 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 338 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 343 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 344 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 345 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 346 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 348 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_deploy_setscene: Started
NOTE: Running setscene task 349 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 351 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 352 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 353 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 354 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 355 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 361 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 362 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe curl-7.76.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 365 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 366 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 367 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 368 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.49-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 369 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 374 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 376 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.76.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 381 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 383 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_deploy_setscene: Succeeded
NOTE: recipe libcap-2.49-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 384 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 386 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 397 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 398 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 400 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 406 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 407 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: Running task 684 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_fetch)
NOTE: Running task 685 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: Running task 733 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_packagedata_setscene: Started
NOTE: Running task 746 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_write_config)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 748 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_fetch)
NOTE: Running setscene task 422 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 426 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 844 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe libmodulemd-2.12.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Started
NOTE: Running task 950 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmodulemd-2.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 959 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_unpack)
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 438 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 960 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_write_config: Started
NOTE: recipe iproute2-5.11.0-r0: task do_fetch: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 978 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_unpack)
NOTE: recipe libmodulemd-2.12.1-r0: task do_write_config: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_unpack: Started
NOTE: Running task 983 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_unpack: Started
NOTE: recipe iptables-1.8.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: recipe elfutils-0.183-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmodulemd-2.12.1-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 996 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 449 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_setscene)
NOTE: recipe libmodulemd-2.12.1-r0: task do_patch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 451 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: Running task 997 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_patch)
NOTE: Running task 1001 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1004 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_patch)
NOTE: recipe libmodulemd-2.12.1-r0: task do_patch: Succeeded
NOTE: Running task 1009 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1010 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_lic)
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_populate_lic: Started
NOTE: recipe iproute2-5.11.0-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Succeeded
NOTE: Running task 1011 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1012 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libmodulemd-2.12.1-r0: task do_populate_lic: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_lic unihash changed to 07b9f136e0f799ecbab029ea0ebe150a1d284885eacacb564137789159b16b3c
NOTE: recipe libmodulemd-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-5.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 458 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.183-r0: task do_package_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 461 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 467 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 468 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 470 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 472 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 475 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 477 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 481 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 485 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 488 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 492 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 494 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 496 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 498 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 500 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 502 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 505 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 507 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.76.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 510 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe curl-7.76.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 512 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 513 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 517 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.76.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.76.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 519 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 521 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 522 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 525 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 527 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 529 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 533 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 535 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 536 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.40-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 543 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe curl-7.76.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 548 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 549 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 552 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 553 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 555 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 556 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 558 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 563 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 565 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-7.76.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1109 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 570 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 576 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 581 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 584 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 587 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 589 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1123 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1124 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running setscene task 591 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 592 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 597 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 601 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 603 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-2.49-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 605 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 606 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 607 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 608 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1143 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.49-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 612 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 616 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 618 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 624 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 627 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1196 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 634 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1213 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 636 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 637 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 640 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 644 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 646 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 650 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 651 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 653 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1251 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2021.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2021.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 658 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2021.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1278 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2021.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 679 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 680 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 682 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 685 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 687 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 689 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 690 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 691 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 692 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 693 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 694 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 695 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 697 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 698 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_setscene)
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 699 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1323 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 003c92f014369e85d1ad14dc5d1d0ac751b330863894e4dc43b3bd2a493a89ed
NOTE: Running task 1328 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 701 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 705 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 706 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 708 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 710 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 711 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 713 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 717 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 719 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 720 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 723 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 726 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 728 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 734 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 735 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 736 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 740 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 741 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 743 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 745 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 747 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 750 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 752 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 757 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 764 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 767 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 769 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 770 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1697 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2024 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2096 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-5.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 819d54398bccb8b0be6b0b86364b262d5891d323a571d56333664e0b39dceaf1
NOTE: Running task 2308 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2309 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: recipe iproute2-5.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2374 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_configure)
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-5.11.0-r0: task do_configure: Started
NOTE: recipe iproute2-5.11.0-r0: task do_configure: Succeeded
NOTE: Running task 2375 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_compile)
NOTE: recipe iproute2-5.11.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2376 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Succeeded
NOTE: Running task 2377 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 2378 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2379 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 2380 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: Running task 2381 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_compile: Succeeded
NOTE: Running task 2382 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_install)
NOTE: recipe iproute2-5.11.0-r0: task do_install: Started
NOTE: recipe iproute2-5.11.0-r0: task do_install: Succeeded
NOTE: Running task 2383 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package)
NOTE: recipe iproute2-5.11.0-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 2384 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2385 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package_write_rpm)
NOTE: recipe libyaml-0.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_package: Succeeded
NOTE: Running task 2386 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata: Started
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2387 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm)
NOTE: Running task 2388 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm)
NOTE: Running task 2389 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm)
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Succeeded
NOTE: Running task 2390 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_install)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Succeeded
NOTE: Running task 2391 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package)
NOTE: Running task 2392 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2393 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm unihash changed to 77230e380dc2c3213c4659e8bc7944bed831d32214ab47e77d4f585d3ae74b73
NOTE: recipe libmodulemd-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2394 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm unihash changed to 6f7473176518e63f697cf1fdaaed68b5491cbc1c057d0e9c3d78b60ec0bf5ebc
NOTE: recipe libmodulemd-2.12.1-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Succeeded
NOTE: Running task 2395 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2396 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2397 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_compile)
NOTE: recipe libmodulemd-2.12.1-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmodulemd-2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2398 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_install)
NOTE: recipe libmodulemd-2.12.1-r0: task do_install: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_install: Succeeded
NOTE: Running task 2399 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package)
NOTE: Running task 2400 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_sysroot)
NOTE: recipe libmodulemd-2.12.1-r0: task do_package: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmodulemd-2.12.1-r0: task do_package: Succeeded
NOTE: Running task 2401 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata)
NOTE: recipe libmodulemd-2.12.1-r0: task do_packagedata: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2402 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package_write_rpm)
NOTE: Running task 2403 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package_qa)
NOTE: recipe libmodulemd-2.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_package_qa: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_package_qa: Succeeded
NOTE: recipe libmodulemd-2.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2404 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2404 tasks of which 2339 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 19 ERROR messages shown, returning a non-zero exit code.

--===============3340723975469334255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libmodulemd: PV changed from "2.12.0" to "2.12.1"
packages/core2-32-poky-linux/libmodulemd: PKGV changed from 2.12.0 [default] to 2.12.1 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: PV changed from "2.12.0" to "2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: PKGSIZE changed from 1206412 to 1206360 (-0%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: PKGV changed from 2.12.0 [default] to 2.12.1 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: PV changed from "2.12.0" to "2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: PKGV changed from 2.12.0 [default] to 2.12.1 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-doc: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-doc: PV changed from "2.12.0" to "2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-doc: PKGV changed from 2.12.0 [default] to 2.12.1 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-locale: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-locale: PV changed from "2.12.0" to "2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-locale: PKGV changed from 2.12.0 [default] to 2.12.1 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-src: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-src: PV changed from "2.12.0" to "2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-src: PKGSIZE changed from 1180339 to 1180875 (+0%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd-src: PKGV changed from 2.12.0 [default] to 2.12.1 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-staticdev: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-staticdev: PV changed from "2.12.0" to "2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-staticdev: PKGV changed from 2.12.0 [default] to 2.12.1 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd: PV changed from "2.12.0" to "2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd: PKGV changed from 2.12.0 [default] to 2.12.1 [default]
Changes to packages/core2-32-poky-linux/libmodulemd (sysroot):
  /usr/lib/libmodulemd.so.2 changed symlink target from libmodulemd.so.2.12.0 to libmodulemd.so.2.12.1
  /usr/lib/libmodulemd.so.2.12.0 moved to /usr/lib/libmodulemd.so.2.12.1

--===============3340723975469334255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 822 .bb files complete (0 cached, 822 parsed). 1456 targets, 49 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-c14cccd72ec004a08ec66babd5eae43c2b105b46"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c14cccd72ec004a08ec66babd5eae43c2b105b46"
workspace            = "master:40d3366bea8d2417e89a37c6f2d38e1542160342"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 11 Network 0 Missed 27 Current 720 (28% match, 96% complete)
Removing 2 stale sstate objects for arch armv7vet2hf-neon...done.
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 726 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 727 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.20.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcrypt-4.4.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcrypt-4.4.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 756 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.20.bb:do_packagedata_setscene)
NOTE: recipe libxcrypt-4.4.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.20-r0: task do_packagedata_setscene: Started
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
NOTE: Running task 1048 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
NOTE: recipe libxcrypt-4.4.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcrypt-4.4.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1514 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_fetch)
NOTE: Running task 1515 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1720 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: Running task 1762 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_write_config)
NOTE: Running task 1767 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_fetch)
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Succeeded
NOTE: Running task 1893 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: Running task 1894 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1895 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_unpack)
NOTE: Running task 1938 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: recipe libmodulemd-2.12.1-r0: task do_fetch: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Started
NOTE: Running task 2085 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: recipe iproute2-5.11.0-r0: task do_fetch: Started
NOTE: recipe iproute2-5.11.0-r0: task do_fetch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: Running task 2180 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_unpack)
NOTE: Running task 2181 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2235 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: recipe libmodulemd-2.12.1-r0: task do_write_config: Succeeded
NOTE: recipe libmodulemd-2.12.1-r0: task do_unpack: Started
NOTE: recipe iproute2-5.11.0-r0: task do_unpack: Started
NOTE: recipe iproute2-5.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 2236 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2237 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmodulemd-2.12.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Succeeded
NOTE: Running task 2238 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_patch)
NOTE: Running task 2239 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2240 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_lic)
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2241 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: recipe iproute2-5.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 2242 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_patch)
NOTE: recipe libmodulemd-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_populate_lic: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: recipe iproute2-5.11.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Succeeded
NOTE: Running task 2243 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libmodulemd-2.12.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_lic unihash changed to 07b9f136e0f799ecbab029ea0ebe150a1d284885eacacb564137789159b16b3c
NOTE: recipe libmodulemd-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_patch: Succeeded
NOTE: Running task 2244 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-5.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-5.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2245 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_configure)
NOTE: recipe iproute2-5.11.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2246 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2247 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to c595f0a663b4b4145931aa921820e54ee4039dbe83b5859baf3e073783af767b
NOTE: Running task 2280 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-5.11.0-r0: task do_configure: Succeeded
NOTE: Running task 2312 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_compile)
NOTE: recipe iproute2-5.11.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2313 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 12d7a2ece7d5b4db4b0aab64a6f7075029a42a683d2a71033b32fe1f0196787b
NOTE: Setscene tasks completed
NOTE: Running task 2348 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2355 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 2356 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2357 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Succeeded
NOTE: Running task 2358 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 2359 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: Running task 2360 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 2361 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2362 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package_write_rpm)
NOTE: recipe libyaml-0.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_compile: Succeeded
NOTE: Running task 2363 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_install)
NOTE: recipe iproute2-5.11.0-r0: task do_install: Started
NOTE: recipe iproute2-5.11.0-r0: task do_install: Succeeded
NOTE: Running task 2364 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package)
NOTE: recipe iproute2-5.11.0-r0: task do_package: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package: Succeeded
NOTE: Running task 2365 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata: Started
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2366 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm)
NOTE: Running task 2367 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm)
NOTE: Running task 2368 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Succeeded
NOTE: Running task 2369 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_install)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Succeeded
NOTE: Running task 2370 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package)
NOTE: Running task 2371 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2372 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2373 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_configure)
NOTE: recipe libmodulemd-2.12.1-r0: task do_configure: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2374 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_compile)
NOTE: recipe libmodulemd-2.12.1-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Succeeded
NOTE: Running task 2375 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2376 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmodulemd-2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2377 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_install)
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm unihash changed to 837da3958251f8e1e185d09f3c060719ab942c2241a689e23fd4f101ffbf5a4f
NOTE: recipe libmodulemd-2.12.1-r0: task do_install: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_install: Succeeded
NOTE: Running task 2378 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package)
NOTE: Running task 2379 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_sysroot)
NOTE: recipe libmodulemd-2.12.1-r0: task do_package: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmodulemd-2.12.1-r0: task do_package: Succeeded
NOTE: Running task 2380 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata)
NOTE: recipe libmodulemd-2.12.1-r0: task do_packagedata: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2381 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package_write_rpm)
NOTE: Running task 2382 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package_qa)
NOTE: recipe libmodulemd-2.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_package_qa: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_package_qa: Succeeded
NOTE: recipe libmodulemd-2.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm unihash changed to 067f8119c1d528e3e8543967183c187c0125da7bd4c38ea8c94f2a4367b6f48e
NOTE: Running noexec task 2383 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2383 tasks of which 2324 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 26 ERROR messages shown, returning a non-zero exit code.

--===============3340723975469334255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-doc: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-locale: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-staticdev: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
packages/core2-32-poky-linux/libmodulemd/libmodulemd: FILELIST: removed "/usr/lib/libmodulemd.so.2.12.0", added "/usr/lib/libmodulemd.so.2.12.1"
Changes to packages/core2-32-poky-linux/libmodulemd (sysroot):
  /usr/lib/libmodulemd.so.2 changed symlink target from libmodulemd.so.2.12.0 to libmodulemd.so.2.12.1
  /usr/lib/libmodulemd.so.2.12.0 moved to /usr/lib/libmodulemd.so.2.12.1

--===============3340723975469334255==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libmodulemd-upgrade-2.12.0-2.12.1.patch"

From ac53f2b93fcff77a3892b98ca218e3c45d293197 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 28 May 2021 08:18:32 +0000
Subject: [PATCH] libmodulemd: upgrade 2.12.0 -> 2.12.1

---
 meta/recipes-devtools/libmodulemd/libmodulemd_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index 2f60ce8e02..771b2c094f 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -8,8 +8,8 @@ SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=
            file://0001-modulemd-generate-the-manpage-only-if-the-feature-is.patch \
            "
 
-PV = "2.12.0"
-SRCREV = "aaed38c899a958a88a6a368a70510e350ebe336c"
+PV = "2.12.1"
+SRCREV = "c0897fa0e9d7d1305fd4813b1010c1d4cca42346"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============3340723975469334255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 822 .bb files complete (0 cached, 822 parsed). 1456 targets, 58 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-c14cccd72ec004a08ec66babd5eae43c2b105b46"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c14cccd72ec004a08ec66babd5eae43c2b105b46"
workspace            = "master:40d3366bea8d2417e89a37c6f2d38e1542160342"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 11 Network 0 Missed 27 Current 720 (28% match, 96% complete)
Removing 2 stale sstate objects for arch mips32r2...done.
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 726 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 727 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.20.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcrypt-4.4.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcrypt-4.4.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 756 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.20.bb:do_packagedata_setscene)
NOTE: recipe libxcrypt-4.4.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.20-r0: task do_packagedata_setscene: Started
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
NOTE: Running task 1049 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxcrypt-4.4.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcrypt-4.4.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1514 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: Running task 1515 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_fetch)
NOTE: Setscene tasks completed
NOTE: Running task 1720 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: Running task 1762 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_write_config)
NOTE: Running task 1767 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_fetch)
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 1853 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: Running task 1854 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Succeeded
NOTE: Running task 1890 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_unpack)
NOTE: Running task 1938 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: recipe libmodulemd-2.12.1-r0: task do_fetch: Started
NOTE: recipe iproute2-5.11.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 2102 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: Running task 2111 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_unpack)
NOTE: Running task 2112 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2184 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: recipe libmodulemd-2.12.1-r0: task do_write_config: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_write_config: Succeeded
NOTE: recipe libmodulemd-2.12.1-r0: task do_unpack: Started
NOTE: recipe iproute2-5.11.0-r0: task do_unpack: Started
NOTE: recipe iproute2-5.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 2236 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2237 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libmodulemd-2.12.1-r0: task do_patch: Started
NOTE: recipe iproute2-5.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 2238 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_patch)
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Succeeded
NOTE: Running task 2239 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_patch)
NOTE: recipe iproute2-5.11.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_patch: Succeeded
NOTE: Running task 2240 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2241 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_lic)
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2242 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Succeeded
NOTE: Running task 2243 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libmodulemd-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_populate_lic: Started
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_lic unihash changed to 07b9f136e0f799ecbab029ea0ebe150a1d284885eacacb564137789159b16b3c
NOTE: recipe libmodulemd-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2244 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2245 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe iproute2-5.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_patch: Succeeded
NOTE: Running task 2246 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-5.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to f20e56863f279864f793c196186fd913736ed0b7b4957799428efc8fc1d21d8d
NOTE: recipe iproute2-5.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2279 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2290 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-5.11.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2312 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe iproute2-5.11.0-r0: task do_configure: Succeeded
NOTE: Running task 2313 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_compile)
NOTE: recipe iproute2-5.11.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 68fb4675c705c63d14a6e5ec82c070bcf09e2a0e26b586284168e481d961f3dc
NOTE: Setscene tasks completed
NOTE: Running task 2347 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2355 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Succeeded
NOTE: Running task 2356 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 2357 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2358 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 2359 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: Running task 2360 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 2361 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe iproute2-5.11.0-r0: task do_compile: Succeeded
NOTE: Running task 2362 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_install)
NOTE: recipe iproute2-5.11.0-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2363 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package_write_rpm)
NOTE: recipe libyaml-0.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-5.11.0-r0: task do_install: Succeeded
NOTE: Running task 2364 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package)
NOTE: recipe iproute2-5.11.0-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_package: Succeeded
NOTE: Running task 2365 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata: Started
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2366 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm)
NOTE: Running task 2367 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm)
NOTE: Running task 2368 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Succeeded
NOTE: Running task 2369 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_install)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Succeeded
NOTE: Running task 2370 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package)
NOTE: Running task 2371 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2372 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2373 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_configure)
NOTE: recipe libmodulemd-2.12.1-r0: task do_configure: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2374 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_compile)
NOTE: recipe libmodulemd-2.12.1-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Succeeded
NOTE: Running task 2375 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2376 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2377 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_install)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmodulemd-2.12.1-r0: task do_install: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_install: Succeeded
NOTE: Running task 2378 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package)
NOTE: Running task 2379 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_sysroot)
NOTE: recipe libmodulemd-2.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_package: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmodulemd-2.12.1-r0: task do_package: Succeeded
NOTE: Running task 2380 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata)
NOTE: recipe libmodulemd-2.12.1-r0: task do_packagedata: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2381 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package_write_rpm)
NOTE: Running task 2382 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package_qa)
NOTE: recipe libmodulemd-2.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_package_qa: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_package_qa: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm unihash changed to b77d9f5e7b49d42b48250104a426a7c62ebf3a6a8eca8b9e500ccbc93ecb28aa
NOTE: recipe libmodulemd-2.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm unihash changed to 4587044b7b7c87f2d95c4f244050c9984b8451da6dfa44ec97c3c6aebe582255
NOTE: Running noexec task 2383 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2383 tasks of which 2324 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 26 ERROR messages shown, returning a non-zero exit code.

--===============3340723975469334255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 822 .bb files complete (0 cached, 822 parsed). 1456 targets, 66 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-c14cccd72ec004a08ec66babd5eae43c2b105b46"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c14cccd72ec004a08ec66babd5eae43c2b105b46"
workspace            = "master:40d3366bea8d2417e89a37c6f2d38e1542160342"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 11 Network 0 Missed 27 Current 720 (28% match, 96% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
Removing 2 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 726 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 727 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.20.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcrypt-4.4.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcrypt-4.4.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 756 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.20.bb:do_packagedata_setscene)
NOTE: recipe libxcrypt-4.4.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.20-r0: task do_packagedata_setscene: Started
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
NOTE: Running task 1048 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxcrypt-4.4.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcrypt-4.4.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1514 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: Running task 1515 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_fetch)
NOTE: Setscene tasks completed
NOTE: Running task 1720 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: Running task 1762 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_write_config)
NOTE: Running task 1767 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_fetch)
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 1822 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: Running task 1823 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Succeeded
NOTE: Running task 1849 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_unpack)
NOTE: Running task 1938 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: recipe libmodulemd-2.12.1-r0: task do_fetch: Started
NOTE: recipe iproute2-5.11.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: Running task 2050 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: recipe iproute2-5.11.0-r0: task do_fetch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2066 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_unpack)
NOTE: Running task 2067 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2116 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: recipe libmodulemd-2.12.1-r0: task do_write_config: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_unpack: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_write_config: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_unpack: Started
NOTE: recipe iproute2-5.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 2236 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: recipe libmodulemd-2.12.1-r0: task do_patch: Started
NOTE: recipe iproute2-5.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 2237 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Succeeded
NOTE: Running task 2238 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_patch)
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2239 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-5.11.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_patch: Succeeded
NOTE: Running task 2240 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2241 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_lic)
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Succeeded
NOTE: Running task 2242 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libmodulemd-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_populate_lic: Started
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2243 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_lic unihash changed to 07b9f136e0f799ecbab029ea0ebe150a1d284885eacacb564137789159b16b3c
NOTE: recipe libmodulemd-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2244 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2245 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe iproute2-5.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_patch: Succeeded
NOTE: Running task 2246 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-5.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-5.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2247 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b80ca9cb6f12efc434285e0cbdc29240bcddec8e6bb23ad97d256c99ba75ad9c
NOTE: Running task 2280 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-5.11.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2312 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe iproute2-5.11.0-r0: task do_configure: Succeeded
NOTE: Running task 2313 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5886c3877a166989898858b3c759cb4f873c991d347b81a7653b3acf48423ffc
NOTE: Setscene tasks completed
NOTE: Running task 2347 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2355 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Succeeded
NOTE: Running task 2356 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 2357 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2358 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 2359 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: Running task 2360 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe iproute2-5.11.0-r0: task do_compile: Succeeded
NOTE: Running task 2361 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_install)
NOTE: recipe iproute2-5.11.0-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_install: Succeeded
NOTE: Running task 2362 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package)
NOTE: recipe iproute2-5.11.0-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 2363 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2364 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package_write_rpm)
NOTE: recipe libyaml-0.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_package: Succeeded
NOTE: Running task 2365 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata: Started
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2366 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm)
NOTE: Running task 2367 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm)
NOTE: Running task 2368 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Succeeded
NOTE: Running task 2369 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_install)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Succeeded
NOTE: Running task 2370 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package)
NOTE: Running task 2371 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2372 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm unihash changed to ed0c479fa885ff354b4ee18acb1a901b6f52fadb99ef6dbb68964ee4c0557c3b
NOTE: recipe libmodulemd-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2373 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_configure)
NOTE: recipe libmodulemd-2.12.1-r0: task do_configure: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2374 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_compile)
NOTE: recipe libmodulemd-2.12.1-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Succeeded
NOTE: Running task 2375 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2376 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm unihash changed to e16d97aaf6cfc9047cb5d4d55c3a02600d5d8f7b5378de193fb1b074af94127f
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmodulemd-2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2377 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_install)
NOTE: recipe libmodulemd-2.12.1-r0: task do_install: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_install: Succeeded
NOTE: Running task 2378 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package)
NOTE: Running task 2379 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_sysroot)
NOTE: recipe libmodulemd-2.12.1-r0: task do_package: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmodulemd-2.12.1-r0: task do_package: Succeeded
NOTE: Running task 2380 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata)
NOTE: recipe libmodulemd-2.12.1-r0: task do_packagedata: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2381 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package_write_rpm)
NOTE: Running task 2382 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package_qa)
NOTE: recipe libmodulemd-2.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_package_qa: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_package_qa: Succeeded
NOTE: recipe libmodulemd-2.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2383 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2383 tasks of which 2324 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 26 ERROR messages shown, returning a non-zero exit code.

--===============3340723975469334255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1457 entries from dependency cache.
Parsing recipes...done.
Parsing of 822 .bb files complete (821 cached, 1 parsed). 1456 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-c14cccd72ec004a08ec66babd5eae43c2b105b46"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c14cccd72ec004a08ec66babd5eae43c2b105b46"
workspace            = "master:40d3366bea8d2417e89a37c6f2d38e1542160342"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 11 Network 0 Missed 27 Current 720 (28% match, 96% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
Removing 2 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 726 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 727 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.20.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcrypt-4.4.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcrypt-4.4.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 756 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.20.bb:do_packagedata_setscene)
NOTE: recipe libxcrypt-4.4.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.20-r0: task do_packagedata_setscene: Started
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-src went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dbg went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-staticdev went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-dev went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-doc went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt-locale went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
ERROR: libxcrypt-4.4.20-r0 do_packagedata_setscene: QA Issue: Package version for package libxcrypt went backwards which would break package feeds (from 0:4.4.22-r0 to 0:4.4.20-r0) [version-going-backwards]
NOTE: Running task 1049 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxcrypt-4.4.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcrypt-4.4.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1625 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_fetch)
NOTE: Running task 1626 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: Running task 1720 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: Running task 1762 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_write_config)
NOTE: Running task 1768 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_fetch)
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Started
NOTE: Running task 1935 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 1955 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: Running task 1956 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Succeeded
NOTE: Running task 1976 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_unpack)
NOTE: recipe libmodulemd-2.12.1-r0: task do_fetch: Started
NOTE: recipe iproute2-5.11.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 2077 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: recipe iproute2-5.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 2111 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_unpack)
NOTE: Running task 2112 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Succeeded
NOTE: recipe libmodulemd-2.12.1-r0: task do_write_config: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe libmodulemd-2.12.1-r0: task do_write_config: Succeeded
NOTE: Running task 2235 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: recipe libmodulemd-2.12.1-r0: task do_unpack: Started
NOTE: recipe iproute2-5.11.0-r0: task do_unpack: Started
NOTE: recipe iproute2-5.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2236 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe libmodulemd-2.12.1-r0: task do_patch: Started
NOTE: Running task 2237 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Succeeded
NOTE: Running task 2238 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_patch)
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_patch: Succeeded
NOTE: Running task 2239 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2240 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_lic)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Succeeded
NOTE: Running task 2241 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libmodulemd-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_populate_lic: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2242 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_lic unihash changed to 07b9f136e0f799ecbab029ea0ebe150a1d284885eacacb564137789159b16b3c
NOTE: recipe libmodulemd-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 2243 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_patch)
NOTE: recipe iproute2-5.11.0-r0: task do_patch: Started
NOTE: recipe iproute2-5.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_patch: Succeeded
NOTE: Running task 2244 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-5.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-5.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2245 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2246 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2247 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe iproute2-5.11.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 62f6431f19fede238466e190955b5b9d556d5896ebde028532bf0150e9f43d12
NOTE: Running task 2280 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-5.11.0-r0: task do_configure: Succeeded
NOTE: Running task 2312 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2313 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe iproute2-5.11.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 4536779b7dca0a5c3d8e03313918f0c89e1a8005eaa6177b0bfb304d882f478c
NOTE: Setscene tasks completed
NOTE: Running task 2347 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2355 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Succeeded
NOTE: Running task 2356 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 2357 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2358 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 2359 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: Running task 2360 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_compile: Succeeded
NOTE: Running task 2361 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_install)
NOTE: recipe iproute2-5.11.0-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 2362 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe iproute2-5.11.0-r0: task do_install: Succeeded
NOTE: Running task 2363 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package)
NOTE: recipe iproute2-5.11.0-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2364 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package_write_rpm)
NOTE: recipe libyaml-0.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_package: Succeeded
NOTE: Running task 2365 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata: Started
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2366 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm)
NOTE: Running task 2367 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm)
NOTE: Running task 2368 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Succeeded
NOTE: Running task 2369 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_install)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Succeeded
NOTE: Running task 2370 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package)
NOTE: Running task 2371 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2372 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2373 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_configure)
NOTE: recipe libmodulemd-2.12.1-r0: task do_configure: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2374 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_compile)
NOTE: recipe libmodulemd-2.12.1-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Succeeded
NOTE: Running task 2375 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2376 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2377 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_install)
NOTE: recipe libmodulemd-2.12.1-r0: task do_install: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_install: Succeeded
NOTE: Running task 2378 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package)
NOTE: Running task 2379 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_sysroot)
NOTE: recipe libmodulemd-2.12.1-r0: task do_package: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm unihash changed to d5a7ea7ec83d63d28698664eca293cb9bdd2dea92e315586419640bb35cafc8b
NOTE: recipe libmodulemd-2.12.1-r0: task do_package: Succeeded
NOTE: Running task 2380 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata)
NOTE: recipe libmodulemd-2.12.1-r0: task do_packagedata: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2381 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package_write_rpm)
NOTE: Running task 2382 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package_qa)
NOTE: recipe libmodulemd-2.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_package_qa: Started
NOTE: recipe libmodulemd-2.12.1-r0: task do_package_qa: Succeeded
NOTE: recipe libmodulemd-2.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm unihash changed to 5d7be74e4fa0bc06348a715cf613081b19ae59c7d76939958b77ea772bf14c51
NOTE: Running noexec task 2383 of 2383 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2383 tasks of which 2324 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 26 ERROR messages shown, returning a non-zero exit code.

--===============3340723975469334255==--
