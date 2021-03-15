Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.323.1615826521444849066
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0183B38C138C
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:02 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-tools: upgrading to 2.12.3 SUCCEEDED
Message-ID: <MADEUP.166C91A942B3F390.2480@lists.openembedded.org>
X-Groupsio-MsgNum: 149519
Content-Type: multipart/mixed; boundary="===============7754400865205871010=="

--===============7754400865205871010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lttng-tools* to *2.12.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lttng-tools-upgrade-2.12.2-2.12.3.patch
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

--===============7754400865205871010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 41 skipped, 0 masked, 0 errors.
Removing 97 recipes from the core2-32 sysroot...done.
Removing 103 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-74f5851d9f27577a5559d3d8885cc962c3938377"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:74f5851d9f27577a5559d3d8885cc962c3938377"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 516 Local 482 Network 0 Missed 34 Current 194 (93% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 195 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 196 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 197 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 199 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 200 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 201 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 203 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 246 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 247 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 248 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 249 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 250 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 251 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 254 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 255 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssl-1.1.1j-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 256 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 258 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 259 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 260 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 264 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe openssl-1.1.1j-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 265 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 267 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 268 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 271 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 272 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 273 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 274 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 275 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 278 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 279 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 284 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 285 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 286 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 290 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 291 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 293 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 294 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 295 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 312 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 313 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 314 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 315 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 316 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 317 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 318 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 323 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 324 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 325 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 335 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 336 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 337 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 338 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 339 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 340 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 343 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 344 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 351 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 352 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 358 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 364 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 366 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_deploy_setscene: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 368 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe make-mod-scripts-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 370 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 374 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_package_write_rpm_setscene)
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 375 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata_setscene)
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 376 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 377 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 378 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_deploy_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 384 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 395 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 406 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 409 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 415 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 422 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 425 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 660 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_fetch)
NOTE: Running task 673 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_fetch)
NOTE: Running task 674 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_fetch)
NOTE: Running task 677 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_fetch)
NOTE: Running task 739 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_fetch)
NOTE: Running task 740 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_fetch)
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 441 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_fetch: Started
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_fetch: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe liburcu-0.12.2-r0: task do_fetch: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_fetch: Started
NOTE: Running task 963 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_unpack)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 451 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lttng-modules-2.12.4-r0: task do_fetch: Started
NOTE: Running task 966 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_unpack)
NOTE: recipe lttng-tools-2.12.3-r0: task do_fetch: Succeeded
NOTE: Running task 967 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_unpack)
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Succeeded
NOTE: Running task 968 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_unpack)
NOTE: recipe lttng-modules-2.12.4-r0: task do_fetch: Succeeded
NOTE: Running task 969 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_unpack)
NOTE: recipe musl-utils-20170421-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 970 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-utils-20170421-r0: task do_fetch: Succeeded
NOTE: Running setscene task 464 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 996 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_unpack)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_unpack: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_unpack: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1013 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_unpack: Started
NOTE: recipe musl-utils-20170421-r0: task do_unpack: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_unpack: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_unpack: Succeeded
NOTE: Running task 1018 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_patch)
NOTE: Running task 1019 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Succeeded
NOTE: Running task 1020 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: Running task 1021 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 1022 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_patch)
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-utils-20170421-r0: task do_unpack: Succeeded
NOTE: Running task 1023 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_patch)
NOTE: recipe lttng-modules-2.12.4-r0: task do_patch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_populate_sysroot_setscene)
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_patch: Started
NOTE: recipe musl-utils-20170421-r0: task do_patch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_patch: Succeeded
NOTE: Running task 1037 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-tools-2.12.3-r0: task do_unpack: Succeeded
NOTE: Running task 1038 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Succeeded
NOTE: recipe lttng-modules-2.12.4-r0: task do_patch: Succeeded
NOTE: Running task 1040 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch_ptest_path)
NOTE: Running task 1041 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1042 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-utils-20170421-r0: task do_patch: Succeeded
NOTE: Running task 1043 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_deploy_source_date_epoch)
NOTE: recipe liburcu-0.12.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_patch: Succeeded
NOTE: Running task 1044 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-tools-2.12.3-r0: task do_patch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-utils-20170421-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Succeeded
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-modules-2.12.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-utils-20170421-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_patch: Succeeded
NOTE: Running task 1045 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1046 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_populate_lic)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_populate_lic: Started
NOTE: Running setscene task 479 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 481 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 482 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe lttng-tools-2.12.3-r0: task do_populate_lic: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_populate_lic unihash changed to e55b3340f6a996deb16d1e032b54b763bebb9e3958d4acb1f2af8574bd45dd9b
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 485 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 486 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 488 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 490 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 495 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 497 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 506 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 507 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 510 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 511 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 513 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 515 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 517 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 519 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 522 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 523 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: Running task 1080 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 526 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 528 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 531 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running setscene task 533 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: Running task 1089 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1090 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 536 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 538 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 539 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 545 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 549 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 550 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1106 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_fetch)
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 554 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 559 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1131 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 563 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 565 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 567 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 568 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 570 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_fetch: Started
NOTE: Running setscene task 573 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_fetch: Succeeded
NOTE: Running task 1137 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1143 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 579 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 581 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 582 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 585 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 587 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 591 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 592 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1152 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1186 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 606 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 607 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1j-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 611 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 614 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 616 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 620 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 621 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1j-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1j-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 629 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 630 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 631 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 633 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 634 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 635 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 636 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1j-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 638 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1j-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 640 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 642 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 644 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 645 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 649 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 650 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 651 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1j-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1232 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 657 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 660 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 667 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 669 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 671 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1265 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 679 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 680 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to d074322eb6b0a530bfcaca3bc13e483b2af168e438f712a15c767a7794ad3794
NOTE: Running task 1282 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 686 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 688 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: Running setscene task 689 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 704 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 705 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 708 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 709 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 710 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 711 of 710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1602 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1694 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1697 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 1892 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1909 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1910 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.12.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-utils-20170421-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liburcu-0.12.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2094 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_configure)
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-modules-2.12.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-utils-20170421-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2095 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to a2ea2736a2cca7af6c85d7b4ffb0889ec54698101bbb59e0910b5b918c8a457e
NOTE: Running task 2116 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.12.2-r0: task do_configure: Started
NOTE: recipe musl-utils-20170421-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_unpack: Succeeded
NOTE: Running task 2163 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_symlink_kernsrc)
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2164 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 2165 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_kernel_checkout: Started
NOTE: recipe musl-utils-20170421-r0: task do_configure: Succeeded
NOTE: Running task 2166 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_compile)
NOTE: recipe musl-utils-20170421-r0: task do_compile: Started
NOTE: recipe musl-utils-20170421-r0: task do_compile: Succeeded
NOTE: Running task 2167 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_install)
NOTE: recipe musl-utils-20170421-r0: task do_install: Started
NOTE: recipe musl-utils-20170421-r0: task do_install: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_kernel_checkout: Succeeded
NOTE: Running task 2168 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_package)
NOTE: Running task 2169 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_validate_branches)
NOTE: recipe musl-utils-20170421-r0: task do_package: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_validate_branches: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_validate_branches: Succeeded
NOTE: Running task 2170 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_kernel_metadata)
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_kernel_metadata: Started
NOTE: recipe musl-utils-20170421-r0: task do_package: Succeeded
NOTE: Running task 2171 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_packagedata)
NOTE: recipe musl-utils-20170421-r0: task do_packagedata: Started
NOTE: recipe musl-utils-20170421-r0: task do_packagedata: Succeeded
NOTE: Running task 2172 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_package_write_rpm)
NOTE: recipe musl-utils-20170421-r0: task do_package_write_rpm: Started
NOTE: recipe musl-utils-20170421-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_kernel_metadata: Succeeded
NOTE: Running task 2173 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_patch)
NOTE: Running task 2174 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_kernel_version_sanity_check)
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_patch: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_patch: Succeeded
NOTE: Running task 2175 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_kernel_configme)
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_kernel_configme: Started
NOTE: recipe liburcu-0.12.2-r0: task do_configure: Succeeded
NOTE: Running task 2177 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_compile)
NOTE: recipe liburcu-0.12.2-r0: task do_compile: Started
NOTE: recipe liburcu-0.12.2-r0: task do_compile: Succeeded
NOTE: Running task 2178 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_install)
NOTE: recipe liburcu-0.12.2-r0: task do_install: Started
NOTE: recipe liburcu-0.12.2-r0: task do_install: Succeeded
NOTE: Running task 2179 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_populate_sysroot)
NOTE: Running task 2180 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_package)
NOTE: recipe liburcu-0.12.2-r0: task do_populate_sysroot: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package: Started
NOTE: recipe liburcu-0.12.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2181 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Succeeded
NOTE: Running task 2182 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2183 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_configure)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2184 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_configure: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package: Succeeded
NOTE: Running task 2185 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_packagedata)
NOTE: recipe liburcu-0.12.2-r0: task do_packagedata: Started
NOTE: recipe liburcu-0.12.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2186 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_package_write_rpm)
NOTE: recipe liburcu-0.12.2-r0: task do_package_write_rpm: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_kernel_configme: Succeeded
NOTE: Running task 2187 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_configure)
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_configure: Succeeded
NOTE: Running task 2188 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_kernel_configcheck)
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_kernel_configcheck: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Succeeded
NOTE: Running task 2189 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2190 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install)
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 2191 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2192 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package)
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2193 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_compile)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_kernel_configcheck: Succeeded
NOTE: Running task 2194 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_compile)
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 2195 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_packagedata)
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2196 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package_write_rpm)
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2197 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_install)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_install: Succeeded
NOTE: Running task 2198 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_populate_sysroot)
NOTE: Running task 2199 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_package)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2200 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-tools-2.12.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2201 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_configure)
NOTE: recipe lttng-tools-2.12.3-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_package: Succeeded
NOTE: Running task 2202 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_packagedata)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2203 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_package_write_rpm)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_configure: Succeeded
NOTE: Running task 2204 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_configure_ptest_base)
NOTE: recipe lttng-tools-2.12.3-r0: task do_configure_ptest_base: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2205 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_compile)
NOTE: recipe lttng-tools-2.12.3-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_compile: Succeeded
NOTE: Running task 2206 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_shared_workdir)
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_shared_workdir: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_shared_workdir: Succeeded
NOTE: Running task 2208 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_compile_kernelmodules)
NOTE: Running task 2209 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_configure)
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_compile_kernelmodules: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_compile_kernelmodules: Succeeded
NOTE: Running task 2214 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_compile)
NOTE: recipe make-mod-scripts-1.0-r0: task do_compile: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_compile: Succeeded
NOTE: Running task 2224 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_configure)
NOTE: recipe lttng-modules-2.12.4-r0: task do_configure: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_configure: Succeeded
NOTE: Running task 2229 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_compile)
NOTE: recipe lttng-modules-2.12.4-r0: task do_compile: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_compile: Succeeded
NOTE: Running task 2230 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_compile_ptest_base)
NOTE: recipe lttng-tools-2.12.3-r0: task do_compile_ptest_base: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2231 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_install)
NOTE: recipe lttng-tools-2.12.3-r0: task do_install: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_install: Succeeded
NOTE: Running task 2232 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_install_ptest_base)
NOTE: recipe lttng-tools-2.12.3-r0: task do_install_ptest_base: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2233 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_package)
NOTE: Running task 2234 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_populate_sysroot)
NOTE: recipe lttng-tools-2.12.3-r0: task do_package: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_package: Succeeded
NOTE: Running task 2235 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_packagedata)
NOTE: recipe lttng-tools-2.12.3-r0: task do_packagedata: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_packagedata: Succeeded
NOTE: recipe lttng-modules-2.12.4-r0: task do_compile: Succeeded
NOTE: Running task 2236 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_install)
NOTE: recipe lttng-modules-2.12.4-r0: task do_install: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_install: Succeeded
NOTE: Running task 2237 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_package)
NOTE: recipe lttng-modules-2.12.4-r0: task do_package: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_package: Succeeded
NOTE: Running task 2238 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_packagedata)
NOTE: recipe lttng-modules-2.12.4-r0: task do_packagedata: Started
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-src went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-dbg went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-staticdev went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-dev went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-doc went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-locale went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-lib-ring-buffer-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-clock-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-client-discard-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-client-mmap-discard-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-client-mmap-overwrite-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-client-overwrite-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-metadata-client-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-metadata-mmap-client-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-statedump-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-tracer-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-wrapper-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-kprobes-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-kretprobes-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-block-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-btrfs-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-compaction-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-ext4-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-gpio-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-i2c-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-irq-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-jbd2-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-kmem-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-module-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-napi-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-net-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-power-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-printk-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-random-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-rcu-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-regmap-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-sched-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-scsi-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-signal-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-skb-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-sock-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-statedump-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-sunrpc-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-timer-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-udp-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-v4l2-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-vmscan-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-workqueue-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-x86-exceptions-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-x86-irq-vectors-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-uprobes-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-clock-plugin-test-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-test-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
NOTE: recipe lttng-modules-2.12.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2239 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_package_write_rpm)
NOTE: Running task 2240 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_package_write_rpm)
NOTE: Running task 2241 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_package_qa)
NOTE: recipe lttng-modules-2.12.4-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_package_qa: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_package_qa: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2242 of 2242 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2242 tasks of which 2131 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 54 ERROR messages shown, returning a non-zero exit code.

--===============7754400865205871010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/lttng-tools: PV changed from "2.12.2" to "2.12.3"
packages/core2-32-poky-linux/lttng-tools: SRC_URI changed from "https://lttng.org/files/lttng-tools/lttng-tools-2.12.2.tar.bz2 file://0001-tests-do-not-strip-a-helper-library.patch file://run-ptest file://lttng-sessiond.service file://0001-tests-regression-disable-the-tools-live-tests.patch file://determinism.patch" to "https://lttng.org/files/lttng-tools/lttng-tools-2.12.3.tar.bz2 file://0001-tests-do-not-strip-a-helper-library.patch file://run-ptest file://lttng-sessiond.service file://0001-tests-regression-disable-the-tools-live-tests.patch file://determinism.patch"
packages/core2-32-poky-linux/lttng-tools: PKGV changed from 2.12.2 [default] to 2.12.3 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dbg: PV changed from "2.12.2" to "2.12.3"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dbg: PKGSIZE changed from 25814184 to 25819640 (+0%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dbg: PKGV changed from 2.12.2 [default] to 2.12.3 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dev: PV changed from "2.12.2" to "2.12.3"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dev: PKGV changed from 2.12.2 [default] to 2.12.3 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-doc: PV changed from "2.12.2" to "2.12.3"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-doc: PKGSIZE changed from 242137 to 243154 (+0%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-doc: PKGV changed from 2.12.2 [default] to 2.12.3 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-locale: PV changed from "2.12.2" to "2.12.3"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-locale: PKGV changed from 2.12.2 [default] to 2.12.3 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: PV changed from "2.12.2" to "2.12.3"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: PKGSIZE changed from 8718899 to 8719767 (+0%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: PKGV changed from 2.12.2 [default] to 2.12.3 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-src: PV changed from "2.12.2" to "2.12.3"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-src: PKGSIZE changed from 4346228 to 4353266 (+0%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-src: PKGV changed from 2.12.2 [default] to 2.12.3 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-staticdev: PV changed from "2.12.2" to "2.12.3"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-staticdev: PKGV changed from 2.12.2 [default] to 2.12.3 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools: PV changed from "2.12.2" to "2.12.3"
packages/core2-32-poky-linux/lttng-tools/lttng-tools: PKGV changed from 2.12.2 [default] to 2.12.3 [default]

--===============7754400865205871010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 49 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-74f5851d9f27577a5559d3d8885cc962c3938377"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:74f5851d9f27577a5559d3d8885cc962c3938377"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 21 Network 0 Missed 29 Current 645 (42% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1073 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1271 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_fetch)
NOTE: Running task 1319 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_fetch)
NOTE: Running task 1329 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_fetch)
NOTE: Running task 1340 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_fetch)
NOTE: Running task 1586 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_fetch)
NOTE: recipe liburcu-0.12.2-r0: task do_fetch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_fetch: Succeeded
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_fetch: Started
NOTE: Running task 1935 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_unpack)
NOTE: Running task 1936 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_fetch: Started
NOTE: Running task 1984 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_unpack)
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Succeeded
NOTE: Running task 2018 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_unpack)
NOTE: recipe lttng-tools-2.12.3-r0: task do_fetch: Succeeded
NOTE: Running task 2057 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_unpack)
NOTE: recipe lttng-modules-2.12.4-r0: task do_fetch: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_fetch: Succeeded
NOTE: Running task 2080 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_unpack)
NOTE: Running task 2081 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.12.2-r0: task do_unpack: Started
NOTE: recipe liburcu-0.12.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_unpack: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_unpack: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_unpack: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liburcu-0.12.2-r0: task do_unpack: Succeeded
NOTE: Running task 2082 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_patch)
NOTE: recipe lttng-modules-2.12.4-r0: task do_unpack: Succeeded
NOTE: Running task 2083 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_patch)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_unpack: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Succeeded
NOTE: Running task 2084 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_patch)
NOTE: Running task 2085 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch)
NOTE: recipe liburcu-0.12.2-r0: task do_patch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_patch: Succeeded
NOTE: recipe lttng-modules-2.12.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2086 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-modules-2.12.4-r0: task do_patch: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_patch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_unpack: Succeeded
NOTE: Running task 2087 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_patch)
NOTE: recipe liburcu-0.12.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_patch: Succeeded
NOTE: Running task 2088 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Succeeded
NOTE: Running task 2089 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch_ptest_path)
NOTE: Running task 2090 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-tools-2.12.3-r0: task do_patch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2091 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_configure)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_patch: Succeeded
NOTE: recipe lttng-modules-2.12.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2092 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Started
NOTE: recipe liburcu-0.12.2-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2093 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2094 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe lttng-modules-2.12.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2095 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_configure)
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-modules-2.12.4-r0: task do_configure: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2096 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2097 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_populate_lic)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_populate_lic: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_configure: Succeeded
NOTE: Running task 2098 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 81a8fc4714d5e3078725ea52621d5cb3338ee3fac13e562738f12dc54f636770
NOTE: Running task 2117 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-tools-2.12.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_populate_lic unihash changed to e55b3340f6a996deb16d1e032b54b763bebb9e3958d4acb1f2af8574bd45dd9b
NOTE: recipe lttng-modules-2.12.4-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2141 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0035619123a81c38302d981de40f05297df401876f3fad665b331ce08c59cb24
NOTE: Setscene tasks completed
NOTE: Running task 2170 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2171 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_configure: Succeeded
NOTE: Running task 2172 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_compile)
NOTE: recipe liburcu-0.12.2-r0: task do_compile: Started
NOTE: recipe liburcu-0.12.2-r0: task do_compile: Succeeded
NOTE: Running task 2173 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_install)
NOTE: recipe liburcu-0.12.2-r0: task do_install: Started
NOTE: recipe liburcu-0.12.2-r0: task do_install: Succeeded
NOTE: Running task 2174 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_populate_sysroot)
NOTE: Running task 2175 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_package)
NOTE: recipe liburcu-0.12.2-r0: task do_populate_sysroot: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package: Started
NOTE: recipe liburcu-0.12.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2176 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2177 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_configure)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_configure: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Succeeded
NOTE: Running task 2178 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2179 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile)
NOTE: recipe lttng-modules-2.12.4-r0: task do_compile: Succeeded
NOTE: Running task 2180 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_install)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_install: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package: Succeeded
NOTE: Running task 2181 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_packagedata)
NOTE: recipe liburcu-0.12.2-r0: task do_packagedata: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_install: Succeeded
NOTE: Running task 2182 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_package)
NOTE: recipe lttng-modules-2.12.4-r0: task do_package: Started
NOTE: recipe liburcu-0.12.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2183 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_package_write_rpm)
NOTE: recipe liburcu-0.12.2-r0: task do_package_write_rpm: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-modules-2.12.4-r0: task do_package: Succeeded
NOTE: Running task 2184 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_packagedata)
NOTE: recipe lttng-modules-2.12.4-r0: task do_packagedata: Started
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-src went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-dbg went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-staticdev went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-dev went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-doc went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-locale went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-lib-ring-buffer-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-clock-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-client-discard-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-client-mmap-discard-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-client-mmap-overwrite-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-client-overwrite-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-metadata-client-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-metadata-mmap-client-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-statedump-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-tracer-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-wrapper-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-kprobes-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-kretprobes-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-block-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-btrfs-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-compaction-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-ext4-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-gpio-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-i2c-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-irq-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-jbd2-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-kmem-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-module-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-napi-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-net-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-power-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-printk-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-random-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-rcu-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-sched-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-scsi-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-signal-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-skb-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-sock-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-statedump-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-sunrpc-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-timer-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-udp-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-vmscan-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-workqueue-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-uprobes-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-clock-plugin-test-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-test-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
NOTE: recipe lttng-modules-2.12.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2185 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_package_write_rpm)
NOTE: recipe lttng-modules-2.12.4-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Succeeded
NOTE: Running task 2186 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2187 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install)
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 2188 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2189 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package)
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2190 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_compile)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 2191 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_packagedata)
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2192 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package_write_rpm)
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2193 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_install)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_install: Succeeded
NOTE: Running task 2194 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_populate_sysroot)
NOTE: Running task 2195 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_package)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2196 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-tools-2.12.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2197 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_configure)
NOTE: recipe lttng-tools-2.12.3-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_package: Succeeded
NOTE: Running task 2198 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_packagedata)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2199 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_package_write_rpm)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_configure: Succeeded
NOTE: Running task 2200 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_configure_ptest_base)
NOTE: recipe lttng-tools-2.12.3-r0: task do_configure_ptest_base: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2201 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_compile)
NOTE: recipe lttng-tools-2.12.3-r0: task do_compile: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_compile: Succeeded
NOTE: Running task 2202 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_compile_ptest_base)
NOTE: recipe lttng-tools-2.12.3-r0: task do_compile_ptest_base: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2203 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_install)
NOTE: recipe lttng-tools-2.12.3-r0: task do_install: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_install: Succeeded
NOTE: Running task 2204 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_install_ptest_base)
NOTE: recipe lttng-tools-2.12.3-r0: task do_install_ptest_base: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2205 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_package)
NOTE: Running task 2206 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_populate_sysroot)
NOTE: recipe lttng-tools-2.12.3-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_package: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_package: Succeeded
NOTE: Running task 2207 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_packagedata)
NOTE: recipe lttng-tools-2.12.3-r0: task do_packagedata: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2208 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_package_write_rpm)
NOTE: Running task 2209 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_package_qa)
NOTE: recipe lttng-tools-2.12.3-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_package_qa: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_package_qa: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2210 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2210 tasks of which 2137 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 50 ERROR messages shown, returning a non-zero exit code.

--===============7754400865205871010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 58 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-74f5851d9f27577a5559d3d8885cc962c3938377"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:74f5851d9f27577a5559d3d8885cc962c3938377"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 21 Network 0 Missed 29 Current 645 (42% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1073 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1271 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_fetch)
NOTE: Running task 1319 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_fetch)
NOTE: Running task 1329 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_fetch)
NOTE: Running task 1340 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_fetch)
NOTE: Running task 1586 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_fetch)
NOTE: recipe liburcu-0.12.2-r0: task do_fetch: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_fetch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_fetch: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Started
NOTE: Running task 1905 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_unpack)
NOTE: Running task 1906 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_fetch: Started
NOTE: Running task 1938 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_unpack)
NOTE: recipe lttng-tools-2.12.3-r0: task do_fetch: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Succeeded
NOTE: Running task 2006 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_unpack)
NOTE: Running task 2023 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_unpack)
NOTE: recipe lttng-modules-2.12.4-r0: task do_fetch: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_fetch: Succeeded
NOTE: Running task 2080 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_unpack)
NOTE: Running task 2081 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.12.2-r0: task do_unpack: Started
NOTE: recipe liburcu-0.12.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_unpack: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_unpack: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_unpack: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liburcu-0.12.2-r0: task do_unpack: Succeeded
NOTE: Running task 2082 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_patch)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 2083 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_patch)
NOTE: recipe lttng-modules-2.12.4-r0: task do_unpack: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Succeeded
NOTE: Running task 2084 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_patch)
NOTE: Running task 2085 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch)
NOTE: recipe liburcu-0.12.2-r0: task do_patch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_patch: Succeeded
NOTE: recipe lttng-modules-2.12.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2086 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_patch: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_patch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_unpack: Succeeded
NOTE: Running task 2087 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_patch)
NOTE: recipe liburcu-0.12.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_patch: Succeeded
NOTE: Running task 2088 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_deploy_source_date_epoch)
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Succeeded
NOTE: Running task 2089 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch_ptest_path)
NOTE: Running task 2090 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_patch: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_patch: Succeeded
NOTE: Running task 2091 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe liburcu-0.12.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-modules-2.12.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2092 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_configure)
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_configure: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2093 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2094 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2095 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_patch: Succeeded
NOTE: Running task 2096 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2097 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_populate_lic)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_populate_lic: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_configure: Succeeded
NOTE: Running task 2098 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_compile)
NOTE: recipe lttng-tools-2.12.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_populate_lic: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_populate_lic unihash changed to e55b3340f6a996deb16d1e032b54b763bebb9e3958d4acb1f2af8574bd45dd9b
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 66af55b123d9f9dcf0b8b6ec352551d2c5d1af62fbd17812dafc6110128e1f05
NOTE: Running task 2117 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-modules-2.12.4-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2141 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to df6a43dc8818d0947bc0f54fdff6095a9b2ee1e477bf529fb2ae6b3ac56371fe
NOTE: Setscene tasks completed
NOTE: Running task 2144 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure)
NOTE: Running task 2170 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_configure: Succeeded
NOTE: Running task 2172 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_compile)
NOTE: recipe liburcu-0.12.2-r0: task do_compile: Started
NOTE: recipe liburcu-0.12.2-r0: task do_compile: Succeeded
NOTE: Running task 2173 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_install)
NOTE: recipe liburcu-0.12.2-r0: task do_install: Started
NOTE: recipe liburcu-0.12.2-r0: task do_install: Succeeded
NOTE: Running task 2174 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_populate_sysroot)
NOTE: Running task 2175 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_package)
NOTE: recipe liburcu-0.12.2-r0: task do_populate_sysroot: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package: Started
NOTE: recipe liburcu-0.12.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2176 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2177 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_configure)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_configure: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Succeeded
NOTE: Running task 2178 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2179 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package: Succeeded
NOTE: Running task 2180 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_packagedata)
NOTE: recipe liburcu-0.12.2-r0: task do_packagedata: Started
NOTE: recipe liburcu-0.12.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2181 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_package_write_rpm)
NOTE: recipe liburcu-0.12.2-r0: task do_package_write_rpm: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Succeeded
NOTE: Running task 2182 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2183 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install)
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_compile: Succeeded
NOTE: Running task 2184 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_install)
NOTE: recipe lttng-modules-2.12.4-r0: task do_install: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 2185 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2186 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package)
NOTE: recipe lttng-modules-2.12.4-r0: task do_install: Succeeded
NOTE: Running task 2187 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_package)
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_package: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_package: Succeeded
NOTE: Running task 2188 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_packagedata)
NOTE: recipe lttng-modules-2.12.4-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2189 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_compile)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_compile: Started
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-src went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-dbg went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-staticdev went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-dev went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-doc went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-locale went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-lib-ring-buffer-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-clock-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-client-discard-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-client-mmap-discard-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-client-mmap-overwrite-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-client-overwrite-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-metadata-client-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-metadata-mmap-client-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-statedump-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-tracer-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-wrapper-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-kprobes-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-kretprobes-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-block-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-btrfs-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-compaction-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-ext4-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-gpio-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-i2c-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-irq-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-jbd2-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-kmem-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-module-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-napi-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-net-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-power-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-printk-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-random-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-rcu-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-sched-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-scsi-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-signal-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-skb-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-sock-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-statedump-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-sunrpc-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-timer-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-udp-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-vmscan-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-workqueue-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-writeback-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-uprobes-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-clock-plugin-test-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-test-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
NOTE: recipe lttng-modules-2.12.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2190 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_package_write_rpm)
NOTE: recipe lttng-modules-2.12.4-r0: task do_package_write_rpm: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 2191 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_packagedata)
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2192 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package_write_rpm)
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2193 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_install)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_install: Succeeded
NOTE: Running task 2194 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_populate_sysroot)
NOTE: Running task 2195 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_package)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2196 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-tools-2.12.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2197 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_configure)
NOTE: recipe lttng-tools-2.12.3-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_package: Succeeded
NOTE: Running task 2198 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_packagedata)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2199 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_package_write_rpm)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_configure: Succeeded
NOTE: Running task 2200 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_configure_ptest_base)
NOTE: recipe lttng-tools-2.12.3-r0: task do_configure_ptest_base: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2201 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_compile)
NOTE: recipe lttng-tools-2.12.3-r0: task do_compile: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_compile: Succeeded
NOTE: Running task 2202 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_compile_ptest_base)
NOTE: recipe lttng-tools-2.12.3-r0: task do_compile_ptest_base: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2203 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_install)
NOTE: recipe lttng-tools-2.12.3-r0: task do_install: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_install: Succeeded
NOTE: Running task 2204 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_install_ptest_base)
NOTE: recipe lttng-tools-2.12.3-r0: task do_install_ptest_base: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2205 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_package)
NOTE: Running task 2206 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_populate_sysroot)
NOTE: recipe lttng-tools-2.12.3-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_package: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_package: Succeeded
NOTE: Running task 2207 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_packagedata)
NOTE: recipe lttng-tools-2.12.3-r0: task do_packagedata: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2208 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_package_write_rpm)
NOTE: Running task 2209 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_package_qa)
NOTE: recipe lttng-tools-2.12.3-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_package_qa: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_package_qa: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2210 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2210 tasks of which 2137 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 51 ERROR messages shown, returning a non-zero exit code.

--===============7754400865205871010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-74f5851d9f27577a5559d3d8885cc962c3938377"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:74f5851d9f27577a5559d3d8885cc962c3938377"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 49 Local 20 Network 0 Missed 29 Current 646 (40% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1073 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1271 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_fetch)
NOTE: Running task 1319 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_fetch)
NOTE: Running task 1329 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_fetch)
NOTE: Running task 1340 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_fetch)
NOTE: Running task 1586 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_fetch)
NOTE: recipe liburcu-0.12.2-r0: task do_fetch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_fetch: Succeeded
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_fetch: Started
NOTE: Running task 1802 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_unpack)
NOTE: Running task 1803 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_fetch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Started
NOTE: Running task 1854 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_unpack)
NOTE: recipe lttng-tools-2.12.3-r0: task do_fetch: Succeeded
NOTE: Running task 1929 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_unpack)
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Succeeded
NOTE: Running task 1963 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_unpack)
NOTE: recipe lttng-modules-2.12.4-r0: task do_fetch: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_fetch: Succeeded
NOTE: Running task 2080 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_unpack)
NOTE: Running task 2081 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.12.2-r0: task do_unpack: Started
NOTE: recipe liburcu-0.12.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_unpack: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_unpack: Started
NOTE: recipe liburcu-0.12.2-r0: task do_unpack: Succeeded
NOTE: recipe lttng-modules-2.12.4-r0: task do_unpack: Started
NOTE: Running task 2082 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_patch)
NOTE: recipe lttng-modules-2.12.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_unpack: Succeeded
NOTE: Running task 2083 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_patch)
NOTE: recipe liburcu-0.12.2-r0: task do_patch: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_unpack: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Succeeded
NOTE: Running task 2084 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_patch)
NOTE: Running task 2085 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch)
NOTE: recipe liburcu-0.12.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_patch: Succeeded
NOTE: Running task 2086 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-modules-2.12.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-modules-2.12.4-r0: task do_patch: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_patch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_patch: Succeeded
NOTE: Running task 2087 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-tools-2.12.3-r0: task do_unpack: Succeeded
NOTE: Running task 2088 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Succeeded
NOTE: Running task 2089 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch_ptest_path)
NOTE: Running task 2090 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-modules-2.12.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2091 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_configure)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_patch: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_patch: Started
NOTE: Running task 2092 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Started
NOTE: recipe liburcu-0.12.2-r0: task do_configure: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2093 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2094 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2095 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_patch: Succeeded
NOTE: Running task 2096 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2097 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_populate_lic)
NOTE: recipe lttng-modules-2.12.4-r0: task do_configure: Succeeded
NOTE: Running task 2098 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_compile)
NOTE: recipe lttng-tools-2.12.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 3cd33b3b118bcd2d611f0ef1df7e5da16aaba995e145f3e72f84ba5240ca287f
NOTE: Running task 2117 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-modules-2.12.4-r0: task do_compile: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_populate_lic unihash changed to e55b3340f6a996deb16d1e032b54b763bebb9e3958d4acb1f2af8574bd45dd9b
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2141 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e214d8e722684895ce7d2e4e2646ce6ff189091d0349f92be4eca70546780a46
NOTE: Setscene tasks completed
NOTE: Running task 2169 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: Running task 2171 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_configure: Succeeded
NOTE: Running task 2172 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_compile)
NOTE: recipe liburcu-0.12.2-r0: task do_compile: Started
NOTE: recipe liburcu-0.12.2-r0: task do_compile: Succeeded
NOTE: Running task 2173 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_install)
NOTE: recipe liburcu-0.12.2-r0: task do_install: Started
NOTE: recipe liburcu-0.12.2-r0: task do_install: Succeeded
NOTE: Running task 2174 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_populate_sysroot)
NOTE: Running task 2175 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_package)
NOTE: recipe liburcu-0.12.2-r0: task do_populate_sysroot: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package: Started
NOTE: recipe liburcu-0.12.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2176 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2177 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_configure)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_configure: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Succeeded
NOTE: Running task 2178 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure_ptest_base)
NOTE: recipe liburcu-0.12.2-r0: task do_package: Succeeded
NOTE: Running task 2179 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_packagedata)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Started
NOTE: recipe liburcu-0.12.2-r0: task do_packagedata: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2180 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Started
NOTE: recipe liburcu-0.12.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2181 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_package_write_rpm)
NOTE: recipe liburcu-0.12.2-r0: task do_package_write_rpm: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-modules-2.12.4-r0: task do_compile: Succeeded
NOTE: Running task 2182 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_install)
NOTE: recipe lttng-modules-2.12.4-r0: task do_install: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_install: Succeeded
NOTE: Running task 2183 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_package)
NOTE: recipe lttng-modules-2.12.4-r0: task do_package: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_package: Succeeded
NOTE: Running task 2184 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_packagedata)
NOTE: recipe lttng-modules-2.12.4-r0: task do_packagedata: Started
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-src went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-dbg went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-staticdev went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-dev went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-doc went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-locale went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-lib-ring-buffer-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-clock-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-client-discard-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-client-mmap-discard-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-client-mmap-overwrite-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-client-overwrite-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-metadata-client-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-metadata-mmap-client-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-statedump-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-tracer-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-wrapper-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-kprobes-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-kretprobes-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-block-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-btrfs-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-compaction-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-ext4-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-gpio-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-i2c-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-irq-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-jbd2-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-kmem-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-module-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-napi-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-net-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-power-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-printk-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-random-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-rcu-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-sched-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-scsi-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-signal-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-skb-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-sock-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-statedump-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-sunrpc-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-timer-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-udp-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-vmscan-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-workqueue-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-writeback-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-uprobes-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-clock-plugin-test-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-test-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
NOTE: recipe lttng-modules-2.12.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2185 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_package_write_rpm)
NOTE: recipe lttng-modules-2.12.4-r0: task do_package_write_rpm: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Succeeded
NOTE: Running task 2186 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2187 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install)
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 2188 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2189 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package)
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2190 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_compile)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 2191 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_packagedata)
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2192 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package_write_rpm)
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2193 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_install)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_install: Succeeded
NOTE: Running task 2194 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_populate_sysroot)
NOTE: Running task 2195 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_package)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2196 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-tools-2.12.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2197 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_configure)
NOTE: recipe lttng-tools-2.12.3-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_package: Succeeded
NOTE: Running task 2198 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_packagedata)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2199 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_package_write_rpm)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_configure: Succeeded
NOTE: Running task 2200 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_configure_ptest_base)
NOTE: recipe lttng-tools-2.12.3-r0: task do_configure_ptest_base: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2201 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_compile)
NOTE: recipe lttng-tools-2.12.3-r0: task do_compile: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_compile: Succeeded
NOTE: Running task 2202 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_compile_ptest_base)
NOTE: recipe lttng-tools-2.12.3-r0: task do_compile_ptest_base: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2203 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_install)
NOTE: recipe lttng-tools-2.12.3-r0: task do_install: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_install: Succeeded
NOTE: Running task 2204 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_install_ptest_base)
NOTE: recipe lttng-tools-2.12.3-r0: task do_install_ptest_base: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2205 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_package)
NOTE: Running task 2206 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_populate_sysroot)
NOTE: recipe lttng-tools-2.12.3-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_package: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_package: Succeeded
NOTE: Running task 2207 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_packagedata)
NOTE: recipe lttng-tools-2.12.3-r0: task do_packagedata: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2208 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_package_write_rpm)
NOTE: Running task 2209 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_package_qa)
NOTE: recipe lttng-tools-2.12.3-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_package_qa: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_package_qa: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2210 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2210 tasks of which 2137 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 51 ERROR messages shown, returning a non-zero exit code.

--===============7754400865205871010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1438 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (813 cached, 1 parsed). 1438 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-74f5851d9f27577a5559d3d8885cc962c3938377"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:74f5851d9f27577a5559d3d8885cc962c3938377"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 21 Network 0 Missed 29 Current 645 (42% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1073 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1271 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_fetch)
NOTE: Running task 1319 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_fetch)
NOTE: Running task 1329 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_fetch)
NOTE: Running task 1340 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_fetch)
NOTE: Running task 1586 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_fetch)
NOTE: recipe liburcu-0.12.2-r0: task do_fetch: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_fetch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_fetch: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Started
NOTE: Running task 1869 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_unpack)
NOTE: Running task 1870 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_fetch: Started
NOTE: Running task 1896 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_unpack)
NOTE: recipe lttng-tools-2.12.3-r0: task do_fetch: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Succeeded
NOTE: Running task 1969 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_unpack)
NOTE: Running task 1988 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_unpack)
NOTE: recipe lttng-modules-2.12.4-r0: task do_fetch: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_fetch: Succeeded
NOTE: Running task 2080 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_unpack)
NOTE: Running task 2081 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.12.2-r0: task do_unpack: Started
NOTE: recipe liburcu-0.12.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_unpack: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_unpack: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_unpack: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liburcu-0.12.2-r0: task do_unpack: Succeeded
NOTE: Running task 2082 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_patch)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_unpack: Succeeded
NOTE: recipe lttng-modules-2.12.4-r0: task do_unpack: Succeeded
NOTE: Running task 2083 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_patch)
NOTE: Running task 2084 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_patch)
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Succeeded
NOTE: Running task 2085 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch)
NOTE: recipe liburcu-0.12.2-r0: task do_patch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_patch: Succeeded
NOTE: Running task 2086 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-modules-2.12.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_patch: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_patch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_patch: Succeeded
NOTE: Running task 2087 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-tools-2.12.3-r0: task do_unpack: Succeeded
NOTE: Running task 2088 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_patch)
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Succeeded
NOTE: Running task 2089 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch_ptest_path)
NOTE: Running task 2090 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_patch: Succeeded
NOTE: Running task 2091 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-modules-2.12.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2092 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_configure)
NOTE: recipe lttng-tools-2.12.3-r0: task do_patch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_configure: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2093 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_configure)
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2094 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2095 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-modules-2.12.4-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_patch: Succeeded
NOTE: Running task 2096 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2097 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_populate_lic: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_configure: Succeeded
NOTE: Running task 2098 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_compile)
NOTE: recipe lttng-modules-2.12.4-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to e8780c5889ba218f01b6e7f1a683b93d66d11d7ae1a19eb56e4c075f0c14297a
NOTE: Running task 2117 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-tools-2.12.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_populate_lic unihash changed to e55b3340f6a996deb16d1e032b54b763bebb9e3958d4acb1f2af8574bd45dd9b
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2141 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to dccf08ffa08447c2c6f24a0c783d4967a30a6c9e85ab4a1f5c27fef61560210e
NOTE: Setscene tasks completed
NOTE: Running task 2169 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2171 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_configure: Succeeded
NOTE: Running task 2172 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_compile)
NOTE: recipe liburcu-0.12.2-r0: task do_compile: Started
NOTE: recipe liburcu-0.12.2-r0: task do_compile: Succeeded
NOTE: Running task 2173 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_install)
NOTE: recipe liburcu-0.12.2-r0: task do_install: Started
NOTE: recipe liburcu-0.12.2-r0: task do_install: Succeeded
NOTE: Running task 2174 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_populate_sysroot)
NOTE: Running task 2175 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_package)
NOTE: recipe liburcu-0.12.2-r0: task do_populate_sysroot: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package: Started
NOTE: recipe liburcu-0.12.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2176 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2177 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_configure)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_configure: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Succeeded
NOTE: Running task 2178 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure_ptest_base)
NOTE: recipe liburcu-0.12.2-r0: task do_package: Succeeded
NOTE: Running task 2179 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_packagedata)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_packagedata: Started
NOTE: Running task 2180 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Started
NOTE: recipe liburcu-0.12.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2181 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_package_write_rpm)
NOTE: recipe liburcu-0.12.2-r0: task do_package_write_rpm: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Succeeded
NOTE: Running task 2182 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2183 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install)
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 2184 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2185 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package)
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2186 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_compile)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 2187 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_packagedata)
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2188 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package_write_rpm)
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_compile: Succeeded
NOTE: Running task 2189 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_install)
NOTE: recipe lttng-modules-2.12.4-r0: task do_install: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-modules-2.12.4-r0: task do_install: Succeeded
NOTE: Running task 2190 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_package)
NOTE: recipe lttng-modules-2.12.4-r0: task do_package: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_package: Succeeded
NOTE: Running task 2191 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_packagedata)
NOTE: recipe lttng-modules-2.12.4-r0: task do_packagedata: Started
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-src went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-dbg went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-staticdev went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-dev went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-doc went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules-locale went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package lttng-modules went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-lib-ring-buffer-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-clock-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-client-discard-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-client-mmap-discard-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-client-mmap-overwrite-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-client-overwrite-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-metadata-client-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-ring-buffer-metadata-mmap-client-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-statedump-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-tracer-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-wrapper-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-kprobes-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-kretprobes-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-block-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-btrfs-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-compaction-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-ext4-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-gpio-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-i2c-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-irq-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-jbd2-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-kmem-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-module-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-napi-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-net-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-power-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-printk-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-random-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-rcu-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-regmap-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-sched-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-scsi-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-signal-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-skb-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-sock-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-statedump-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-sunrpc-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-timer-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-udp-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-v4l2-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-vmscan-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-workqueue-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-x86-exceptions-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-probe-x86-irq-vectors-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-uprobes-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-clock-plugin-test-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
ERROR: lttng-modules-2.12.4-r0 do_packagedata: QA Issue: Package version for package kernel-module-lttng-test-5.10.21-yocto-standard went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.12.4-r0) [version-going-backwards]
NOTE: recipe lttng-modules-2.12.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2192 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb:do_package_write_rpm)
NOTE: recipe lttng-modules-2.12.4-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2193 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_install)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_install: Started
NOTE: recipe lttng-modules-2.12.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_install: Succeeded
NOTE: Running task 2194 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_populate_sysroot)
NOTE: Running task 2195 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_package)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2196 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-tools-2.12.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2197 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_configure)
NOTE: recipe lttng-tools-2.12.3-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_package: Succeeded
NOTE: Running task 2198 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_packagedata)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2199 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb:do_package_write_rpm)
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-ust-2_2.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_configure: Succeeded
NOTE: Running task 2200 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_configure_ptest_base)
NOTE: recipe lttng-tools-2.12.3-r0: task do_configure_ptest_base: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2201 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_compile)
NOTE: recipe lttng-tools-2.12.3-r0: task do_compile: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_compile: Succeeded
NOTE: Running task 2202 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_compile_ptest_base)
NOTE: recipe lttng-tools-2.12.3-r0: task do_compile_ptest_base: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2203 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_install)
NOTE: recipe lttng-tools-2.12.3-r0: task do_install: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_install: Succeeded
NOTE: Running task 2204 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_install_ptest_base)
NOTE: recipe lttng-tools-2.12.3-r0: task do_install_ptest_base: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2205 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_package)
NOTE: Running task 2206 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_populate_sysroot)
NOTE: recipe lttng-tools-2.12.3-r0: task do_package: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_package: Succeeded
NOTE: Running task 2207 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_packagedata)
NOTE: recipe lttng-tools-2.12.3-r0: task do_packagedata: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2208 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_package_write_rpm)
NOTE: Running task 2209 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_package_qa)
NOTE: recipe lttng-tools-2.12.3-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_package_qa: Started
NOTE: recipe lttng-tools-2.12.3-r0: task do_package_qa: Succeeded
NOTE: recipe lttng-tools-2.12.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2210 of 2210 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2210 tasks of which 2137 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 54 ERROR messages shown, returning a non-zero exit code.

--===============7754400865205871010==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-lttng-tools-upgrade-2.12.2-2.12.3.patch"

From e4e45f35c4389e78a43c7734ac51d44f9543f789 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 14:27:32 +0000
Subject: [PATCH] lttng-tools: upgrade 2.12.2 -> 2.12.3

---
 .../lttng/{lttng-tools_2.12.2.bb => lttng-tools_2.12.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.12.2.bb => lttng-tools_2.12.3.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
index 52bfd36370..7074096ee7 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://determinism.patch \
            "
 
-SRC_URI[sha256sum] = "9ed9161795ff023b076f9f95afaa4f1f822ec42495c0fa04c586ab8fa74e84f1"
+SRC_URI[sha256sum] = "2890da230edd523fcf497e9eb28133b7606d64fa01bcbffadbfcba42104db153"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.17.1


--===============7754400865205871010==--
