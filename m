Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.327.1615826520938997538
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id AAE1738C1285
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:00 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gptfdisk: upgrading to 1.0.7 SUCCEEDED
Message-ID: <MADEUP.166C91A8F1C26FB4.29771@lists.openembedded.org>
X-Groupsio-MsgNum: 149487
Content-Type: multipart/mixed; boundary="===============1200826126764351562=="

--===============1200826126764351562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gptfdisk* to *1.0.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gptfdisk-upgrade-1.0.6-1.0.7.patch
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

--===============1200826126764351562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 41 skipped, 0 masked, 0 errors.
Removing 93 recipes from the core2-32 sysroot...done.
Removing 98 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-4c25faa8d8f6f302385f52587c87f613dfee164f"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4c25faa8d8f6f302385f52587c87f613dfee164f"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 488 Local 476 Network 0 Missed 12 Current 196 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 197 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 199 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 203 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1j-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 254 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 255 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 256 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 257 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 258 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 260 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 261 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 262 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 263 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 266 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 269 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 270 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 272 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 274 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 275 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 278 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 280 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 283 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 284 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 285 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 286 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe openssl-1.1.1j-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 290 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 291 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 292 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 293 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 295 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 296 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 298 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 299 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 300 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 301 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 302 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 303 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 304 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 305 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 306 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 307 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 308 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 311 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 312 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 313 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 315 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 317 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 318 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 319 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 321 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 322 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 323 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 327 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 329 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 330 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 332 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_deploy_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 339 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 356 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 358 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 361 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 362 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 365 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 371 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 376 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_deploy_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 388 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 391 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 392 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-src went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dbg went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcomerr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libss went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libe2p went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libext2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-badblocks went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dumpe2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-e2fsck went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-e2scrub went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-mke2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-resize2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-tune2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-ptest went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-staticdev went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dev went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-doc went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-ca went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 720 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_fetch)
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-cs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-da went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-de went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_populate_sysroot_setscene: Started
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-eo went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-es went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-fi went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-fr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: Running setscene task 406 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-hu went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_packagedata_setscene: Started
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-id went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-it went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-ms went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-nl went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-pl went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-pt went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-sr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-sv went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-tr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-uk went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-vi went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-zh-cn went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 415 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gptfdisk-1.0.7-r0: task do_fetch: Started
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gptfdisk-1.0.7-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 966 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_unpack)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 420 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe popt-1.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 431 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gptfdisk-1.0.7-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 996 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gptfdisk-1.0.7-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 439 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_patch: Succeeded
NOTE: Running task 1030 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1031 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_populate_lic)
NOTE: recipe gptfdisk-1.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_populate_lic: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_populate_lic unihash changed to 837c37a9bda989d567910fc5bfd86b0ba5b0bb70f3367e473cd451db20b6a565
NOTE: recipe gptfdisk-1.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 455 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 471 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 481 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 497 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1063 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 500 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running setscene task 504 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: Running task 1065 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1071 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1105 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1120 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: Running setscene task 548 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1138 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1164 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 579 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 582 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1j-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1j-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1218 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 620 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 622 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 624 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 627 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 631 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 634 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1239 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 643 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to d074322eb6b0a530bfcaca3bc13e483b2af168e438f712a15c767a7794ad3794
NOTE: Running task 1248 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 646 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 649 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 652 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 655 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 660 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 662 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 671 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 678 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 681 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 682 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1920 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe gptfdisk-1.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2159 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_configure)
NOTE: recipe gptfdisk-1.0.7-r0: task do_configure: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_configure: Succeeded
NOTE: Running task 2160 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_compile)
NOTE: recipe gptfdisk-1.0.7-r0: task do_compile: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_compile: Succeeded
NOTE: Running task 2161 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_install)
NOTE: recipe gptfdisk-1.0.7-r0: task do_install: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_install: Succeeded
NOTE: Running task 2162 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_package)
NOTE: Running task 2163 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_populate_sysroot)
NOTE: recipe gptfdisk-1.0.7-r0: task do_package: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gptfdisk-1.0.7-r0: task do_package: Succeeded
NOTE: Running task 2164 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_packagedata)
NOTE: recipe gptfdisk-1.0.7-r0: task do_packagedata: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2165 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_package_write_rpm)
NOTE: Running task 2166 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_package_qa)
NOTE: recipe gptfdisk-1.0.7-r0: task do_package_write_rpm: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_package_qa: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_package_qa: Succeeded
NOTE: recipe gptfdisk-1.0.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2167 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_build)
NOTE: Tasks Summary: Attempted 2167 tasks of which 2142 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 39 ERROR messages shown, returning a non-zero exit code.

--===============1200826126764351562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gptfdisk/gptfdisk-dbg: PV changed from "1.0.6" to "1.0.7"
packages/core2-32-poky-linux/gptfdisk/gptfdisk-dbg: PKGSIZE changed from 5139952 to 5136200 (-0%)
packages/core2-32-poky-linux/gptfdisk/gptfdisk-dbg: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-32-poky-linux/gptfdisk/gptfdisk-dev: PV changed from "1.0.6" to "1.0.7"
packages/core2-32-poky-linux/gptfdisk/gptfdisk-dev: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-32-poky-linux/gptfdisk/gptfdisk-doc: PV changed from "1.0.6" to "1.0.7"
packages/core2-32-poky-linux/gptfdisk/gptfdisk-doc: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-32-poky-linux/gptfdisk/gptfdisk-locale: PV changed from "1.0.6" to "1.0.7"
packages/core2-32-poky-linux/gptfdisk/gptfdisk-locale: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-32-poky-linux/gptfdisk/gptfdisk-src: PV changed from "1.0.6" to "1.0.7"
packages/core2-32-poky-linux/gptfdisk/gptfdisk-src: PKGSIZE changed from 428784 to 429501 (+0%)
packages/core2-32-poky-linux/gptfdisk/gptfdisk-src: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-32-poky-linux/gptfdisk/gptfdisk-staticdev: PV changed from "1.0.6" to "1.0.7"
packages/core2-32-poky-linux/gptfdisk/gptfdisk-staticdev: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-32-poky-linux/gptfdisk/gptfdisk: PV changed from "1.0.6" to "1.0.7"
packages/core2-32-poky-linux/gptfdisk/gptfdisk: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-32-poky-linux/gptfdisk: PKGV changed from 1.0.6 [default] to 1.0.7 [default]
packages/core2-32-poky-linux/gptfdisk: PV changed from "1.0.6" to "1.0.7"
packages/core2-32-poky-linux/gptfdisk: SRC_URI changed from "https://downloads.sourceforge.net/gptfdisk/1.0.6/gptfdisk-1.0.6.tar.gz file://0001-gptcurses-correctly-include-curses.h.patch" to "https://downloads.sourceforge.net/gptfdisk/1.0.7/gptfdisk-1.0.7.tar.gz file://0001-gptcurses-correctly-include-curses.h.patch"

--===============1200826126764351562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 49 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-4c25faa8d8f6f302385f52587c87f613dfee164f"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4c25faa8d8f6f302385f52587c87f613dfee164f"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 34 Local 23 Network 0 Missed 11 Current 639 (67% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 653 of 673 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 654 of 673 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1101 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 668 of 673 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1508 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_fetch)
NOTE: recipe gptfdisk-1.0.7-r0: task do_fetch: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_fetch: Succeeded
NOTE: Running task 1888 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_unpack)
NOTE: Running task 1889 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe gptfdisk-1.0.7-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 673 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata_setscene)
NOTE: recipe gptfdisk-1.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 2046 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_patch)
NOTE: recipe gptfdisk-1.0.7-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-src went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dbg went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcomerr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libss went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libe2p went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libext2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-badblocks went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dumpe2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-e2fsck went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe gptfdisk-1.0.7-r0: task do_patch: Succeeded
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-e2scrub went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: Running task 2047 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2048 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_populate_lic)
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-mke2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-resize2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-tune2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-ptest went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-staticdev went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dev went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-doc went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-ca went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-cs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-da went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-de went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-eo went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-es went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-fi went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-fr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-hu went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe gptfdisk-1.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_populate_lic: Started
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-id went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-it went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-ms went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-nl went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-pl went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-pt went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-sr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-sv went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-tr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-uk went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: Running task 2049 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-vi went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: Running task 2050 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-zh-cn went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gptfdisk-1.0.7-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_populate_lic unihash changed to 837c37a9bda989d567910fc5bfd86b0ba5b0bb70f3367e473cd451db20b6a565
NOTE: Setscene tasks completed
NOTE: recipe gptfdisk-1.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2064 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_configure: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_configure: Succeeded
NOTE: Running task 2068 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 81a8fc4714d5e3078725ea52621d5cb3338ee3fac13e562738f12dc54f636770
NOTE: recipe gptfdisk-1.0.7-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2110 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0035619123a81c38302d981de40f05297df401876f3fad665b331ce08c59cb24
NOTE: Setscene tasks completed
NOTE: Running task 2133 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gptfdisk-1.0.7-r0: task do_compile: Succeeded
NOTE: Running task 2140 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_install)
NOTE: recipe gptfdisk-1.0.7-r0: task do_install: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_install: Succeeded
NOTE: Running task 2141 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_package)
NOTE: Running task 2142 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_populate_sysroot)
NOTE: recipe gptfdisk-1.0.7-r0: task do_package: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gptfdisk-1.0.7-r0: task do_package: Succeeded
NOTE: Running task 2143 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_packagedata)
NOTE: recipe gptfdisk-1.0.7-r0: task do_packagedata: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2144 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_package_write_rpm)
NOTE: Running task 2145 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_package_qa)
NOTE: recipe gptfdisk-1.0.7-r0: task do_package_write_rpm: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_package_qa: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_package_qa: Succeeded
NOTE: recipe gptfdisk-1.0.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2146 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_build)
NOTE: Tasks Summary: Attempted 2146 tasks of which 2126 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 39 ERROR messages shown, returning a non-zero exit code.

--===============1200826126764351562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 58 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-4c25faa8d8f6f302385f52587c87f613dfee164f"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4c25faa8d8f6f302385f52587c87f613dfee164f"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 34 Local 23 Network 0 Missed 11 Current 639 (67% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 653 of 673 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 654 of 673 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 668 of 673 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1101 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 673 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1508 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_fetch)
NOTE: recipe gptfdisk-1.0.7-r0: task do_fetch: Started
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-src went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dbg went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcomerr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe gptfdisk-1.0.7-r0: task do_fetch: Succeeded
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libss went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: Running task 1857 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_unpack)
NOTE: Running task 1858 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_prepare_recipe_sysroot)
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libe2p went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libext2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-badblocks went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dumpe2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-e2fsck went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-e2scrub went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-mke2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-resize2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-tune2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-ptest went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-staticdev went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dev went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-doc went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe gptfdisk-1.0.7-r0: task do_unpack: Started
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-ca went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-cs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe gptfdisk-1.0.7-r0: task do_prepare_recipe_sysroot: Started
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-da went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-de went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-eo went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe gptfdisk-1.0.7-r0: task do_unpack: Succeeded
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-es went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: Running task 2046 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_patch)
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-fi went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-fr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-hu went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-id went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-it went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-ms went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-nl went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-pl went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-pt went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-sr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-sv went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-tr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-uk went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-vi went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe gptfdisk-1.0.7-r0: task do_patch: Started
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-zh-cn went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gptfdisk-1.0.7-r0: task do_patch: Succeeded
NOTE: Running task 2063 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2064 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_populate_lic)
NOTE: recipe gptfdisk-1.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2065 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2066 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gptfdisk-1.0.7-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_populate_lic unihash changed to 837c37a9bda989d567910fc5bfd86b0ba5b0bb70f3367e473cd451db20b6a565
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2067 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_configure: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_configure: Succeeded
NOTE: Running task 2068 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 66af55b123d9f9dcf0b8b6ec352551d2c5d1af62fbd17812dafc6110128e1f05
NOTE: recipe gptfdisk-1.0.7-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2110 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to df6a43dc8818d0947bc0f54fdff6095a9b2ee1e477bf529fb2ae6b3ac56371fe
NOTE: Setscene tasks completed
NOTE: Running task 2133 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gptfdisk-1.0.7-r0: task do_compile: Succeeded
NOTE: Running task 2140 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_install)
NOTE: recipe gptfdisk-1.0.7-r0: task do_install: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_install: Succeeded
NOTE: Running task 2141 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_package)
NOTE: Running task 2142 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_populate_sysroot)
NOTE: recipe gptfdisk-1.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_package: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gptfdisk-1.0.7-r0: task do_package: Succeeded
NOTE: Running task 2143 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_packagedata)
NOTE: recipe gptfdisk-1.0.7-r0: task do_packagedata: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2144 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_package_write_rpm)
NOTE: Running task 2145 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_package_qa)
NOTE: recipe gptfdisk-1.0.7-r0: task do_package_write_rpm: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_package_qa: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_package_qa: Succeeded
NOTE: recipe gptfdisk-1.0.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2146 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_build)
NOTE: Tasks Summary: Attempted 2146 tasks of which 2126 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 39 ERROR messages shown, returning a non-zero exit code.

--===============1200826126764351562==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-gptfdisk-upgrade-1.0.6-1.0.7.patch"

From 34204dcad853ae2eaf7a5811c1740a53c71aac67 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 05:53:14 +0000
Subject: [PATCH] gptfdisk: upgrade 1.0.6 -> 1.0.7

---
 .../fdisk/{gptfdisk_1.0.6.bb => gptfdisk_1.0.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fdisk/{gptfdisk_1.0.6.bb => gptfdisk_1.0.7.bb} (93%)

diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.6.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb
similarity index 93%
rename from meta/recipes-devtools/fdisk/gptfdisk_1.0.6.bb
rename to meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb
index 5112debf89..a697b74f98 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.6.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb
@@ -10,7 +10,7 @@ DEPENDS = "util-linux"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-gptcurses-correctly-include-curses.h.patch \
            "
-SRC_URI[sha256sum] = "ddc551d643a53f0bd4440345d3ae32c49b04a797e9c01036ea460b6bb4168ca8"
+SRC_URI[sha256sum] = "754004b7f85b279287c7ac3c0469b1d7e0eae043a97a2e587b0560ca5f3828c0"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/gptfdisk/files/gptfdisk/"
 UPSTREAM_CHECK_REGEX = "/gptfdisk/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.17.1


--===============1200826126764351562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-4c25faa8d8f6f302385f52587c87f613dfee164f"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4c25faa8d8f6f302385f52587c87f613dfee164f"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 33 Local 22 Network 0 Missed 11 Current 640 (66% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 654 of 673 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 655 of 673 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 668 of 673 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1101 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 673 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1508 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_fetch)
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-src went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe gptfdisk-1.0.7-r0: task do_fetch: Started
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dbg went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcomerr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libss went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libe2p went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libext2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe gptfdisk-1.0.7-r0: task do_fetch: Succeeded
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-badblocks went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dumpe2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: Running task 1811 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_unpack)
NOTE: Running task 1812 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_prepare_recipe_sysroot)
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-e2fsck went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-e2scrub went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-mke2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-resize2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-tune2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-ptest went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-staticdev went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dev went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-doc went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-ca went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-cs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-da went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-de went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-eo went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-es went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-fi went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-fr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-hu went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-id went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-it went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-ms went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-nl went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-pl went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe gptfdisk-1.0.7-r0: task do_unpack: Started
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-pt went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-sr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-sv went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-tr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe gptfdisk-1.0.7-r0: task do_prepare_recipe_sysroot: Started
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-uk went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-vi went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-zh-cn went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe gptfdisk-1.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 2046 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_patch)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gptfdisk-1.0.7-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gptfdisk-1.0.7-r0: task do_patch: Succeeded
NOTE: Running task 2063 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2064 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_populate_lic)
NOTE: recipe gptfdisk-1.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2065 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2066 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gptfdisk-1.0.7-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_populate_lic unihash changed to 837c37a9bda989d567910fc5bfd86b0ba5b0bb70f3367e473cd451db20b6a565
NOTE: recipe gptfdisk-1.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2067 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_configure: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_configure: Succeeded
NOTE: Running task 2068 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 3cd33b3b118bcd2d611f0ef1df7e5da16aaba995e145f3e72f84ba5240ca287f
NOTE: recipe gptfdisk-1.0.7-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2110 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e214d8e722684895ce7d2e4e2646ce6ff189091d0349f92be4eca70546780a46
NOTE: Setscene tasks completed
NOTE: Running task 2133 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gptfdisk-1.0.7-r0: task do_compile: Succeeded
NOTE: Running task 2140 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_install)
NOTE: recipe gptfdisk-1.0.7-r0: task do_install: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_install: Succeeded
NOTE: Running task 2141 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_package)
NOTE: Running task 2142 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_populate_sysroot)
NOTE: recipe gptfdisk-1.0.7-r0: task do_package: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gptfdisk-1.0.7-r0: task do_package: Succeeded
NOTE: Running task 2143 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_packagedata)
NOTE: recipe gptfdisk-1.0.7-r0: task do_packagedata: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2144 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_package_write_rpm)
NOTE: Running task 2145 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_package_qa)
NOTE: recipe gptfdisk-1.0.7-r0: task do_package_write_rpm: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_package_qa: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_package_qa: Succeeded
NOTE: recipe gptfdisk-1.0.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2146 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_build)
NOTE: Tasks Summary: Attempted 2146 tasks of which 2126 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 39 ERROR messages shown, returning a non-zero exit code.

--===============1200826126764351562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1440 entries from dependency cache.
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
DISTRO_VERSION       = "3.2+snapshot-4c25faa8d8f6f302385f52587c87f613dfee164f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4c25faa8d8f6f302385f52587c87f613dfee164f"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 33 Local 22 Network 0 Missed 11 Current 640 (66% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 654 of 673 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 655 of 673 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1101 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 668 of 673 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1508 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_fetch)
NOTE: recipe gptfdisk-1.0.7-r0: task do_fetch: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_fetch: Succeeded
NOTE: Running task 1831 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_unpack)
NOTE: Running task 1832 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe gptfdisk-1.0.7-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gptfdisk-1.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 670 of 673 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata_setscene)
NOTE: recipe gptfdisk-1.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 2046 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_patch)
NOTE: recipe gptfdisk-1.0.7-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-src went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dbg went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcomerr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libss went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libe2p went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libext2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-badblocks went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dumpe2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-e2fsck went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-e2scrub went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-mke2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe gptfdisk-1.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-resize2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-tune2fs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-ptest went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-staticdev went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-dev went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-doc went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-ca went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-cs went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-da went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-de went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe gptfdisk-1.0.7-r0: task do_patch: Succeeded
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-eo went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: Running task 2047 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_deploy_source_date_epoch)
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-es went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: Running task 2048 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_populate_lic)
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-fi went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-fr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-hu went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-id went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-it went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-ms went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-nl went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-pl went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-pt went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-sr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-sv went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-tr went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-uk went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-vi went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
ERROR: e2fsprogs-1.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package e2fsprogs-locale-zh-cn went backwards which would break package feeds (from 0:1.46.2-r0 to 0:1.46.1-r0) [version-going-backwards]
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2049 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe gptfdisk-1.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_populate_lic: Started
NOTE: Running task 2050 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_populate_lic unihash changed to 837c37a9bda989d567910fc5bfd86b0ba5b0bb70f3367e473cd451db20b6a565
NOTE: recipe gptfdisk-1.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2067 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_configure)
NOTE: recipe gptfdisk-1.0.7-r0: task do_configure: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_configure: Succeeded
NOTE: Running task 2068 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to e8780c5889ba218f01b6e7f1a683b93d66d11d7ae1a19eb56e4c075f0c14297a
NOTE: recipe gptfdisk-1.0.7-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2110 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to dccf08ffa08447c2c6f24a0c783d4967a30a6c9e85ab4a1f5c27fef61560210e
NOTE: Setscene tasks completed
NOTE: Running task 2133 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gptfdisk-1.0.7-r0: task do_compile: Succeeded
NOTE: Running task 2140 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_install)
NOTE: recipe gptfdisk-1.0.7-r0: task do_install: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_install: Succeeded
NOTE: Running task 2141 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_package)
NOTE: Running task 2142 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_populate_sysroot)
NOTE: recipe gptfdisk-1.0.7-r0: task do_package: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gptfdisk-1.0.7-r0: task do_package: Succeeded
NOTE: Running task 2143 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_packagedata)
NOTE: recipe gptfdisk-1.0.7-r0: task do_packagedata: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2144 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_package_write_rpm)
NOTE: Running task 2145 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_package_qa)
NOTE: recipe gptfdisk-1.0.7-r0: task do_package_write_rpm: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_package_qa: Started
NOTE: recipe gptfdisk-1.0.7-r0: task do_package_qa: Succeeded
NOTE: recipe gptfdisk-1.0.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2146 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb:do_build)
NOTE: Tasks Summary: Attempted 2146 tasks of which 2126 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 39 ERROR messages shown, returning a non-zero exit code.

--===============1200826126764351562==--
