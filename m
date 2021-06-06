Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.25791.1623000258094400724
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 9B9F038C1279
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Jun 2021 17:24:17 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xf86-input-libinput: upgrading to 1.0.1 SUCCEEDED
Message-ID: <MADEUP.16860E22CB09F31F.29797@lists.openembedded.org>
X-Groupsio-MsgNum: 152724
Content-Type: multipart/mixed; boundary="===============9195688735532451772=="

--===============9195688735532451772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xf86-input-libinput* to *1.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xf86-input-libinput-upgrade-0.30.0-1.0.1.patch
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

--===============9195688735532451772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 816 .bb files complete (0 cached, 816 parsed). 1452 targets, 41 skipped, 0 masked, 0 errors.
Removing 134 recipes from the core2-32 sysroot...done.
Removing 139 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-84500ae667f4895e122b13bb05e2170060cd2f4e"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:84500ae667f4895e122b13bb05e2170060cd2f4e"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 688 Local 630 Network 0 Missed 58 Current 224 (91% match, 93% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 225 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 231 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 271 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 274 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 275 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 277 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 279 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 280 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 281 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 283 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 284 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 285 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 286 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 287 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 288 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 289 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 292 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 293 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 294 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 295 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 296 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 297 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 298 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_package_write_rpm_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 299 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 300 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 301 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 302 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 303 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 304 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 305 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 307 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 308 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 313 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 323 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libdrm-2.4.106-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 324 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 325 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 326 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 333 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 335 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 336 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 337 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 338 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 339 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 341 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 342 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_21.1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 344 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 346 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 347 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 349 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 350 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 351 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 352 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 355 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 356 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 359 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 360 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 361 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_package_write_rpm_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: Running setscene task 362 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 377 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 386 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 387 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_packagedata_setscene)
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 388 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 399 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 401 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 408 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: Running setscene task 411 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 414 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 418 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: Running setscene task 419 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 420 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.7.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 421 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 425 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 430 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 431 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 432 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 435 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 436 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 437 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 441 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 442 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 443 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 444 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 445 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_package_write_rpm_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 446 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 453 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 454 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 455 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 456 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 458 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 459 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_package_write_rpm_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 460 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 461 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 462 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 465 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 468 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 469 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 470 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 473 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_deploy_setscene: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 476 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libevdev-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libevdev-1.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 479 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 481 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 484 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 487 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_package_write_rpm_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 488 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.49-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 489 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libevdev-1.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 490 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 499 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 503 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 504 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 506 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_deploy_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libevdev-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 511 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 515 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 524 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 525 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libevdev-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running task 690 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_fetch)
NOTE: Running task 702 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_packagedata_setscene: Started
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running task 741 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: Running task 750 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_write_config)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running setscene task 534 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch_setscene)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running task 784 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: Running task 796 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_fetch)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe libevdev-1.11.0-r0: task do_packagedata_setscene: Succeeded
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running setscene task 536 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.11.0.bb:do_deploy_source_date_epoch_setscene)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running task 836 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_fetch)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running task 860 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_fetch)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: Running task 896 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_fetch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 904 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_fetch)
NOTE: Running setscene task 539 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 905 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 906 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_fetch)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: Running setscene task 543 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 930 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_21.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 949 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Started
NOTE: Running setscene task 545 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe libinput-1.17.3-r0: task do_fetch: Started
NOTE: recipe libinput-1.17.3-r0: task do_write_config: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libinput-1.17.3-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libevdev-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_fetch: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: Running task 1030 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_unpack)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_fetch: Started
NOTE: recipe libinput-1.17.3-r0: task do_write_config: Succeeded
NOTE: Running task 1035 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: Running task 1037 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_unpack)
NOTE: Running task 1040 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_unpack)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 1068 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: recipe mesa-2_21.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 566 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 567 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 568 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 569 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 570 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Started
NOTE: Running task 1072 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_unpack)
NOTE: Running task 1073 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_unpack)
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libevdev-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.106-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1137 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_unpack)
NOTE: Running task 1138 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_unpack)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Started
NOTE: Running task 1147 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1152 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: recipe libinput-1.17.3-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_unpack: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 577 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Succeeded
NOTE: Running task 1165 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_patch)
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: Running setscene task 584 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 586 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running task 1170 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_patch)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_21.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1171 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1179 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: Running task 1181 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_patch)
NOTE: Running task 1182 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_patch)
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 1183 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.106-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 598 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 600 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 601 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.106-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Started
NOTE: Running setscene task 606 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 607 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 610 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: Running setscene task 619 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libinput-1.17.3-r0: task do_unpack: Succeeded
NOTE: Running task 1198 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1199 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1200 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.106-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libinput-1.17.3-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Succeeded
NOTE: Running task 1217 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: Running setscene task 625 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 626 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1226 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Succeeded
NOTE: Running task 1227 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1228 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_populate_lic)
NOTE: Running task 1233 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Succeeded
NOTE: Running task 1234 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 630 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1235 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 634 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 635 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libinput-1.17.3-r0: task do_patch: Succeeded
NOTE: Running task 1240 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 638 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_packagedata_setscene)
NOTE: Running task 1245 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 647 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 649 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_populate_lic: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.17.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_populate_lic: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_populate_lic unihash changed to 18ec660ea7fcf11451dc01d0e52f9abe6988ab2a5ddf0f17023b9d0131391eee
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 656 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libinput-1.17.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 657 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 667 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_unpack: Succeeded
NOTE: Running setscene task 672 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: Running task 1298 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_patch)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 679 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_patch: Succeeded
NOTE: Running task 1312 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 686 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 691 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 695 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 705 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 708 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 709 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 717 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 722 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 723 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: Running setscene task 727 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1331 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 730 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running setscene task 733 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running task 1344 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1345 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running setscene task 735 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.49-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 738 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 741 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 742 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 751 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: Running setscene task 753 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.49-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1378 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 757 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 758 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 761 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 765 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 768 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 769 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 770 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 771 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 772 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 774 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1405 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 777 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 779 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1410 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running setscene task 781 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 784 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 785 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 787 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 789 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 791 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 792 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 793 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 794 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 797 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1419 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 799 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 801 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 805 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 806 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 807 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 808 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 809 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 810 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 811 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 813 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 816 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 817 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 818 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 819 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 820 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 821 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 822 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 824 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 825 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 831 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 832 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 833 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 834 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 836 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 837 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 838 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 839 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 840 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 841 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1490 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 843 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 844 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 845 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 846 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 847 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 848 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 849 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 850 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 851 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 852 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 853 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 855 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 857 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 859 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 861 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 862 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 863 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 865 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 867 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 868 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 869 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 870 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 871 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1523 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 873 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 875 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 876 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 877 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 878 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e4fc2bea8e1e3db5d8f7ac9d518459201e9f688ddc73f029dd979756a0d0ad5d
NOTE: Running task 1528 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 880 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 882 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 883 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 884 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 886 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 887 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 888 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 890 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 891 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 892 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 894 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 895 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 896 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 897 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 898 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 899 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 905 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 906 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 907 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 909 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 910 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 911 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 912 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 913 of 912 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1870 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2159 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2238 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2415 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2416 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to ae023dad6456b560f7f98aa4e88b652beaab405a67ba50d2d02c6da8d168a200
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2621 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2622 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: Running task 2665 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2689 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2703 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_configure)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Started
NOTE: recipe libinput-1.17.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Succeeded
NOTE: Running task 2704 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_compile)
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Succeeded
NOTE: Running task 2705 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_install)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Succeeded
NOTE: Running task 2706 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Started
NOTE: recipe libinput-1.17.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2707 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_configure)
NOTE: recipe libinput-1.17.3-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Succeeded
NOTE: Running task 2708 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Succeeded
NOTE: Running task 2709 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.17.3-r0: task do_configure: Succeeded
NOTE: Running task 2710 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.17.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.17.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2711 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_compile)
NOTE: recipe libinput-1.17.3-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 2712 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2713 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_compile)
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2714 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2715 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Succeeded
NOTE: Running task 2716 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package)
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 2717 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 2718 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe libinput-1.17.3-r0: task do_compile: Succeeded
NOTE: Running task 2719 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_compile_ptest_base)
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe libinput-1.17.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.17.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2720 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_install)
NOTE: recipe libinput-1.17.3-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2721 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2722 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe libinput-1.17.3-r0: task do_install: Succeeded
NOTE: Running task 2723 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_install_ptest_base)
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Succeeded
NOTE: Running task 2724 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_packagedata)
NOTE: recipe libinput-1.17.3-r0: task do_install_ptest_base: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 2725 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe libinput-1.17.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2726 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_package)
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Started
NOTE: Running task 2727 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_populate_sysroot)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe libinput-1.17.3-r0: task do_package: Started
NOTE: recipe libinput-1.17.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2728 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2729 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package_write_rpm)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe libinput-1.17.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2730 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2731 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2732 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2733 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.17.3-r0: task do_package: Succeeded
NOTE: Running task 2734 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2735 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe libinput-1.17.3-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-src went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-dbg went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-ptest went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-staticdev went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-dev went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-doc went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-locale went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-bin went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
NOTE: recipe libinput-1.17.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2736 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_package_write_rpm)
NOTE: recipe libinput-1.17.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2737 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2738 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.17.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2739 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2740 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2741 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 2742 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: Running task 2743 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2744 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2745 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2746 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_configure)
NOTE: Running task 2747 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_configure)
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2748 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2749 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 2750 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2751 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Succeeded
NOTE: Running task 2752 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2753 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2754 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_compile)
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2755 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_install)
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2756 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2757 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_packagedata)
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2758 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package_write_rpm)
NOTE: Running task 2759 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package_write_rpm)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2760 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_compile)
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Succeeded
NOTE: Running task 2761 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_install)
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Succeeded
NOTE: Running task 2762 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_populate_sysroot)
NOTE: Running task 2763 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_package)
NOTE: recipe libxfont2-2.0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2764 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2765 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_configure)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package: Succeeded
NOTE: Running task 2766 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.4-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2767 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_package_write_rpm)
NOTE: recipe libxfont2-2.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_configure: Succeeded
NOTE: Running task 2768 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_compile)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_compile: Succeeded
NOTE: Running task 2769 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_install)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_install: Succeeded
NOTE: Running task 2770 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_package)
NOTE: Running task 2771 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2772 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2773 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_package: Succeeded
NOTE: Running task 2774 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2775 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2776 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_install: Succeeded
NOTE: Running task 2777 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_package)
NOTE: Running task 2778 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_populate_sysroot)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package: Succeeded
NOTE: Running task 2779 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2780 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_package_write_rpm)
NOTE: Running task 2781 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_package_write_rpm)
NOTE: Running task 2782 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_package_qa)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2783 of 2783 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2783 tasks of which 2637 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 37 ERROR messages shown, returning a non-zero exit code.

--===============9195688735532451772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 816 .bb files complete (0 cached, 816 parsed). 1452 targets, 49 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-84500ae667f4895e122b13bb05e2170060cd2f4e"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:84500ae667f4895e122b13bb05e2170060cd2f4e"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 63 Local 6 Network 0 Missed 57 Current 838 (9% match, 93% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 843 of 901 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 885 of 901 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 889 of 901 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Succeeded
NOTE: Running task 1109 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe mesa-2_21.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_21.1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 899 of 901 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_packagedata_setscene)
NOTE: Running task 1395 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_fetch)
NOTE: Running task 1466 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: recipe mesa-2_21.1.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1617 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: Running task 1657 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_write_config)
NOTE: recipe libinput-1.17.3-r0: task do_fetch: Started
NOTE: Running task 1726 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: recipe libinput-1.17.3-r0: task do_fetch: Succeeded
NOTE: Running task 1757 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_unpack)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running task 1770 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_fetch)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running task 1796 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: Running task 1797 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running task 1848 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_fetch)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running task 1925 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: recipe libinput-1.17.3-r0: task do_write_config: Started
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running task 1939 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_fetch)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Started
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running task 2026 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: Running task 2027 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe libinput-1.17.3-r0: task do_write_config: Succeeded
NOTE: recipe libinput-1.17.3-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Succeeded
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2049 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_unpack)
NOTE: Running task 2059 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_fetch)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running task 2060 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_fetch)
NOTE: Running task 2061 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 2062 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_fetch)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 2156 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_fetch: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_fetch: Succeeded
NOTE: Running task 2199 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_unpack)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_21.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 901 of 901 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 2228 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: Running task 2327 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_unpack)
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Started
NOTE: Running task 2328 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2329 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2357 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_unpack)
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 2371 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: Running task 2372 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_unpack)
NOTE: Running task 2373 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: Running task 2404 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: recipe libinput-1.17.3-r0: task do_unpack: Succeeded
NOTE: Running task 2464 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_patch)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 2531 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_unpack: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: Running task 2532 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: Running task 2533 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_patch)
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2534 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_patch)
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 2535 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_patch)
NOTE: recipe libinput-1.17.3-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Started
NOTE: Running task 2536 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_patch)
NOTE: Running task 2537 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe mesa-2_21.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2558 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2559 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Started
NOTE: recipe libinput-1.17.3-r0: task do_patch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Started
NOTE: Running task 2560 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2561 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Succeeded
NOTE: Running task 2562 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2563 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Succeeded
NOTE: Running task 2564 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2565 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: recipe libinput-1.17.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2566 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Succeeded
NOTE: Running task 2567 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2568 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2569 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2570 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_populate_lic)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2571 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.17.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_populate_lic: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2572 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2573 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_configure)
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to a8696e704c99cc59615f43f4ade37486103a54ed0fa00837ab731a5a39076f1c
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2599 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_populate_lic: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_populate_lic unihash changed to 18ec660ea7fcf11451dc01d0e52f9abe6988ab2a5ddf0f17023b9d0131391eee
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Succeeded
NOTE: Running task 2638 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_compile)
NOTE: recipe libinput-1.17.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2639 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Succeeded
NOTE: Running task 2640 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_install)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_unpack: Succeeded
NOTE: Running task 2641 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Succeeded
NOTE: Running task 2642 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f375887b6676e4b3e599da54f7d8296740821993a123d53f1b0a0f328db6805f
NOTE: Setscene tasks completed
NOTE: Running task 2675 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe libinput-1.17.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2685 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libinput-1.17.3-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_patch: Succeeded
NOTE: Running task 2686 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Succeeded
NOTE: Running task 2687 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Succeeded
NOTE: Running task 2688 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.17.3-r0: task do_configure: Succeeded
NOTE: Running task 2689 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.17.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.17.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2690 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_compile)
NOTE: recipe libinput-1.17.3-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 2691 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2692 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2693 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Started
NOTE: recipe libinput-1.17.3-r0: task do_compile: Succeeded
NOTE: Running task 2694 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_compile_ptest_base)
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe libinput-1.17.3-r0: task do_compile_ptest_base: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2695 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_install)
NOTE: recipe libinput-1.17.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2696 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 2697 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 2698 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Started
NOTE: recipe libinput-1.17.3-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Succeeded
NOTE: Running task 2699 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package)
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2700 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.17.3-r0: task do_install: Succeeded
NOTE: Running task 2701 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_install_ptest_base)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.17.3-r0: task do_install_ptest_base: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2702 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2703 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: Running task 2704 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Succeeded
NOTE: Running task 2705 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2706 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package_write_rpm)
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Started
NOTE: recipe libinput-1.17.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2707 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_package)
NOTE: Running task 2708 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_populate_sysroot)
NOTE: recipe libinput-1.17.3-r0: task do_package: Started
NOTE: recipe libinput-1.17.3-r0: task do_populate_sysroot: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.17.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2709 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2710 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2711 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2712 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2713 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe libinput-1.17.3-r0: task do_package: Succeeded
NOTE: Running task 2714 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_packagedata)
NOTE: recipe libinput-1.17.3-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2715 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-src went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-dbg went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-ptest went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-staticdev went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-dev went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-doc went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-locale went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-bin went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
NOTE: recipe libinput-1.17.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2716 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_package_write_rpm)
NOTE: recipe libinput-1.17.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2717 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.17.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2718 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2719 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2720 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2721 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 2722 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2723 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2724 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2725 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2726 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_configure)
NOTE: Running task 2727 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_configure)
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 2728 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2729 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2730 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package_write_rpm)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Succeeded
NOTE: Running task 2731 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2732 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2733 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_compile)
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2734 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_install)
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2735 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2736 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_packagedata)
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2737 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package_write_rpm)
NOTE: Running task 2738 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package_write_rpm)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Succeeded
NOTE: Running task 2739 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_compile)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Succeeded
NOTE: Running task 2740 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_install)
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Succeeded
NOTE: Running task 2741 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_populate_sysroot)
NOTE: Running task 2742 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_package)
NOTE: recipe libxfont2-2.0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2743 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2744 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_configure)
NOTE: recipe libxfont2-2.0.4-r0: task do_package: Succeeded
NOTE: Running task 2745 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2746 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_package_write_rpm)
NOTE: recipe libxfont2-2.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_configure: Succeeded
NOTE: Running task 2747 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_compile)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_compile: Succeeded
NOTE: Running task 2748 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_install)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_install: Succeeded
NOTE: Running task 2749 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_package)
NOTE: Running task 2750 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2751 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2752 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_package: Succeeded
NOTE: Running task 2753 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2754 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2755 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_install: Succeeded
NOTE: Running task 2756 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_package)
NOTE: Running task 2757 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_populate_sysroot)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package: Succeeded
NOTE: Running task 2758 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2759 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_package_write_rpm)
NOTE: Running task 2760 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_package_write_rpm)
NOTE: Running task 2761 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_package_qa)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2762 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2762 tasks of which 2622 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 37 ERROR messages shown, returning a non-zero exit code.

--===============9195688735532451772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 816 .bb files complete (0 cached, 816 parsed). 1452 targets, 66 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-84500ae667f4895e122b13bb05e2170060cd2f4e"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:84500ae667f4895e122b13bb05e2170060cd2f4e"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 63 Local 6 Network 0 Missed 57 Current 838 (9% match, 93% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 843 of 901 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 885 of 901 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 889 of 901 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Succeeded
NOTE: Running task 1109 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1395 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_fetch)
NOTE: Running task 1466 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: recipe mesa-2_21.1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 899 of 901 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_21.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1617 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: recipe libinput-1.17.3-r0: task do_fetch: Started
NOTE: Running task 1657 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_write_config)
NOTE: recipe libinput-1.17.3-r0: task do_fetch: Succeeded
NOTE: Running task 1669 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_unpack)
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1720 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: Running task 1728 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: Running task 1751 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1771 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_fetch)
NOTE: recipe mesa-2_21.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: Running task 1848 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_fetch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1861 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: recipe libinput-1.17.3-r0: task do_write_config: Started
NOTE: recipe libinput-1.17.3-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: Running task 1939 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_fetch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1974 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: Running task 1975 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.17.3-r0: task do_write_config: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 2021 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_unpack)
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 2043 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: Running task 2053 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_fetch)
NOTE: Running task 2061 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_fetch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: Running task 2062 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_fetch)
NOTE: Running task 2063 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_fetch: Started
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_fetch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_fetch: Started
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running task 2137 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_unpack)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_fetch: Succeeded
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running task 2177 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_unpack)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running task 2243 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Started
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Started
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Succeeded
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running task 2270 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_unpack)
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2290 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2291 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_unpack)
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 2313 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2314 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: Running task 2315 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2316 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: recipe libinput-1.17.3-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_21.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2343 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_patch)
NOTE: Running setscene task 901 of 901 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_unpack: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 2417 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_patch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Started
NOTE: Running task 2499 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: Running task 2524 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2534 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_patch)
NOTE: recipe libinput-1.17.3-r0: task do_patch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2535 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_patch)
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 2536 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_patch)
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: Running task 2537 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2538 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_patch: Started
NOTE: recipe libinput-1.17.3-r0: task do_patch: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Started
NOTE: Running task 2539 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_deploy_source_date_epoch)
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2549 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2561 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2562 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libinput-1.17.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2563 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2564 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2565 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_patch: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2566 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2567 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2568 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_populate_lic)
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Started
NOTE: Running task 2569 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Succeeded
NOTE: Running task 2570 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libinput-1.17.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2571 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_populate_lic: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2572 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_configure)
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_populate_lic: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_populate_lic unihash changed to 18ec660ea7fcf11451dc01d0e52f9abe6988ab2a5ddf0f17023b9d0131391eee
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to af8664518cbc6402031640163c4390c955100a45cde311e8b3b1c7b30b30ef23
NOTE: Running task 2598 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2634 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_configure)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Succeeded
NOTE: Running task 2635 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_compile)
NOTE: recipe libinput-1.17.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Succeeded
NOTE: Running task 2639 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2640 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Succeeded
NOTE: Running task 2641 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_unpack: Succeeded
NOTE: Running task 2642 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 93756c671474c35a2671dda5ef84a5d04884ce64292016de139a9612b8f1bfeb
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: Running task 2675 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libinput-1.17.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2685 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_configure)
NOTE: recipe libinput-1.17.3-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_patch: Succeeded
NOTE: Running task 2686 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Succeeded
NOTE: Running task 2687 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Succeeded
NOTE: Running task 2688 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.17.3-r0: task do_configure: Succeeded
NOTE: Running task 2689 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.17.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.17.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2690 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_compile)
NOTE: recipe libinput-1.17.3-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 2691 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2692 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2693 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_compile)
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2694 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 2695 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 2696 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe libinput-1.17.3-r0: task do_compile: Succeeded
NOTE: Running task 2697 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_compile_ptest_base)
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Succeeded
NOTE: Running task 2698 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package)
NOTE: recipe libinput-1.17.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.17.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2699 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Started
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2700 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.17.3-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2701 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 2702 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe libinput-1.17.3-r0: task do_install: Succeeded
NOTE: Running task 2703 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_install_ptest_base)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe libinput-1.17.3-r0: task do_install_ptest_base: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Succeeded
NOTE: Running task 2704 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: Running task 2705 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_packagedata)
NOTE: recipe libinput-1.17.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2706 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_package)
NOTE: Running task 2707 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Started
NOTE: recipe libinput-1.17.3-r0: task do_package: Started
NOTE: recipe libinput-1.17.3-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2708 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package_write_rpm)
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Started
NOTE: recipe libinput-1.17.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2709 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2710 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2711 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2712 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.17.3-r0: task do_package: Succeeded
NOTE: Running task 2713 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.17.3-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2714 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2715 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-src went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-dbg went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-ptest went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-staticdev went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-dev went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-doc went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-locale went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-bin went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libinput-1.17.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2716 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_package_write_rpm)
NOTE: recipe libinput-1.17.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2717 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.17.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2718 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2719 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2720 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 2721 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: Running task 2722 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2723 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2724 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2725 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_configure)
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2726 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_configure)
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2727 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2728 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 2729 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2730 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package_write_rpm)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Succeeded
NOTE: Running task 2731 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2732 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2733 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_compile)
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2734 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_install)
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2735 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2736 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_packagedata)
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2737 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package_write_rpm)
NOTE: Running task 2738 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package_write_rpm)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Succeeded
NOTE: Running task 2739 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_compile)
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Succeeded
NOTE: Running task 2740 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_install)
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Succeeded
NOTE: Running task 2741 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_populate_sysroot)
NOTE: Running task 2742 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_package)
NOTE: recipe libxfont2-2.0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2743 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package: Succeeded
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2744 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_configure)
NOTE: Running task 2745 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.4-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2746 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_package_write_rpm)
NOTE: recipe libxfont2-2.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_configure: Succeeded
NOTE: Running task 2747 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_compile)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_compile: Succeeded
NOTE: Running task 2748 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_install)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_install: Succeeded
NOTE: Running task 2749 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_package)
NOTE: Running task 2750 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2751 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2752 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_package: Succeeded
NOTE: Running task 2753 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2754 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2755 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_install: Succeeded
NOTE: Running task 2756 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_package)
NOTE: Running task 2757 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_populate_sysroot)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package: Succeeded
NOTE: Running task 2758 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2759 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_package_write_rpm)
NOTE: Running task 2760 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_package_write_rpm)
NOTE: Running task 2761 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_package_qa)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2762 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2762 tasks of which 2622 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 37 ERROR messages shown, returning a non-zero exit code.

--===============9195688735532451772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 816 .bb files complete (0 cached, 816 parsed). 1452 targets, 58 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-84500ae667f4895e122b13bb05e2170060cd2f4e"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:84500ae667f4895e122b13bb05e2170060cd2f4e"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 63 Local 6 Network 0 Missed 57 Current 838 (9% match, 93% complete)
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 843 of 901 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 885 of 901 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 889 of 901 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_21.1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 899 of 901 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_packagedata_setscene)
NOTE: Running task 1109 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe mesa-2_21.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_21.1.1-r0: task do_packagedata_setscene: Started
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running task 1395 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_fetch)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running task 1466 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: recipe mesa-2_21.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 901 of 901 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1618 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: Running task 1657 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_write_config)
NOTE: recipe libinput-1.17.3-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: recipe libinput-1.17.3-r0: task do_fetch: Succeeded
NOTE: Running task 1722 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_unpack)
NOTE: Running task 1727 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1745 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: Running task 1751 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1771 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_fetch)
NOTE: Running task 1849 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_fetch)
NOTE: recipe mesa-2_21.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1906 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: recipe libinput-1.17.3-r0: task do_write_config: Started
NOTE: Running task 1940 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_fetch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
NOTE: recipe libinput-1.17.3-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Started
NOTE: Running task 2020 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: recipe libinput-1.17.3-r0: task do_write_config: Succeeded
NOTE: Running task 2021 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_21.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 2030 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_unpack)
NOTE: Running task 2069 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_fetch)
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 2077 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_fetch)
NOTE: Running task 2078 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 2079 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_fetch)
NOTE: Running task 2110 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_fetch: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_fetch: Succeeded
NOTE: Running task 2223 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_unpack)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 2260 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 2376 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Started
NOTE: Running task 2429 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_unpack)
NOTE: Running task 2430 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 2475 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_unpack)
NOTE: Running task 2476 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_unpack)
NOTE: Running task 2477 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 2495 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2517 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_unpack: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 2550 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libinput-1.17.3-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2551 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_patch)
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2552 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_patch)
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Succeeded
NOTE: Running task 2553 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 2554 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2555 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_patch)
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2556 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_patch)
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Started
NOTE: Running task 2557 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe libinput-1.17.3-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_patch: Started
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Started
NOTE: Running task 2558 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe libinput-1.17.3-r0: task do_patch: Succeeded
NOTE: Running task 2559 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2560 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2561 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Succeeded
NOTE: Running task 2562 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Succeeded
NOTE: Running task 2563 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2564 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: Running task 2565 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2566 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libinput-1.17.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2567 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: Running task 2568 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Started
NOTE: Running task 2569 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2570 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_populate_lic: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.17.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2571 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_configure)
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_populate_lic unihash changed to 18ec660ea7fcf11451dc01d0e52f9abe6988ab2a5ddf0f17023b9d0131391eee
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 18ff1335989c10daf887d231d18248f4253445e601e18dc205b8b6a777f9bd7f
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2597 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2602 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: Running task 2628 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_configure)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Succeeded
NOTE: Running task 2638 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe libinput-1.17.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Succeeded
NOTE: Running task 2639 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2640 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_unpack: Succeeded
NOTE: Running task 2641 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Succeeded
NOTE: Running task 2642 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b9e21ab3b31a31ce3eb7b137c75c027a08c8977bb36ec7d973653c0701679a8f
NOTE: Setscene tasks completed
NOTE: Running task 2675 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libinput-1.17.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2685 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_configure)
NOTE: recipe libinput-1.17.3-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_patch: Succeeded
NOTE: Running task 2686 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Succeeded
NOTE: Running task 2687 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Succeeded
NOTE: Running task 2688 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.17.3-r0: task do_configure: Succeeded
NOTE: Running task 2689 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.17.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.17.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2690 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_compile)
NOTE: recipe libinput-1.17.3-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 2691 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2692 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2693 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 2694 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 2695 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2696 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Succeeded
NOTE: Running task 2697 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package)
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2698 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.17.3-r0: task do_compile: Succeeded
NOTE: Running task 2699 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_compile_ptest_base)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2700 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe libinput-1.17.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.17.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2701 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe libinput-1.17.3-r0: task do_install: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 2702 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Succeeded
NOTE: Running task 2703 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_packagedata)
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Started
NOTE: recipe libinput-1.17.3-r0: task do_install: Succeeded
NOTE: Running task 2704 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_install_ptest_base)
NOTE: recipe libinput-1.17.3-r0: task do_install_ptest_base: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2705 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libinput-1.17.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2706 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_package)
NOTE: Running task 2707 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2708 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package_write_rpm)
NOTE: recipe libinput-1.17.3-r0: task do_package: Started
NOTE: recipe libinput-1.17.3-r0: task do_populate_sysroot: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Started
NOTE: recipe libinput-1.17.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2709 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2710 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2711 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.17.3-r0: task do_package: Succeeded
NOTE: Running task 2712 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2713 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.17.3-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-src went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-dbg went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-ptest went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-staticdev went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-dev went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-doc went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-locale went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-bin went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2714 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe libinput-1.17.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2715 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2716 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libinput-1.17.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2717 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.17.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2718 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2719 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2720 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 2721 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2722 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2723 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2724 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2725 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_configure)
NOTE: Running task 2726 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_configure)
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2727 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2728 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2729 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package_write_rpm)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 2730 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Succeeded
NOTE: Running task 2731 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2732 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2733 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_compile)
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2734 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_install)
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2735 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2736 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_packagedata)
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2737 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package_write_rpm)
NOTE: Running task 2738 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package_write_rpm)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Succeeded
NOTE: Running task 2739 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_compile)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Succeeded
NOTE: Running task 2740 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_install)
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Succeeded
NOTE: Running task 2741 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_populate_sysroot)
NOTE: Running task 2742 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_package)
NOTE: recipe libxfont2-2.0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2743 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2744 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_configure)
NOTE: recipe libxfont2-2.0.4-r0: task do_package: Succeeded
NOTE: Running task 2745 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2746 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_package_write_rpm)
NOTE: recipe libxfont2-2.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_configure: Succeeded
NOTE: Running task 2747 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_compile)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_compile: Succeeded
NOTE: Running task 2748 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_install)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_install: Succeeded
NOTE: Running task 2749 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_package)
NOTE: Running task 2750 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2751 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2752 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_package: Succeeded
NOTE: Running task 2753 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2754 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2755 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_install: Succeeded
NOTE: Running task 2756 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_package)
NOTE: Running task 2757 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_populate_sysroot)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package: Succeeded
NOTE: Running task 2758 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2759 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_package_write_rpm)
NOTE: Running task 2760 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_package_write_rpm)
NOTE: Running task 2761 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_package_qa)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2762 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2762 tasks of which 2622 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 37 ERROR messages shown, returning a non-zero exit code.

--===============9195688735532451772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1452 entries from dependency cache.
Parsing recipes...done.
Parsing of 816 .bb files complete (815 cached, 1 parsed). 1452 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-84500ae667f4895e122b13bb05e2170060cd2f4e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:84500ae667f4895e122b13bb05e2170060cd2f4e"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 64 Local 7 Network 0 Missed 57 Current 837 (10% match, 93% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 842 of 901 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 851 of 901 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 888 of 901 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe encodings-1_1.0.5-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe encodings-1_1.0.5-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 898 of 901 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Started
NOTE: recipe encodings-1_1.0.5-r3: task do_packagedata_setscene: Succeeded
NOTE: Running task 1109 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe mesa-2_21.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_21.1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 899 of 901 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_packagedata_setscene)
NOTE: Running task 1395 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_fetch)
NOTE: Running task 1466 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_fetch)
NOTE: Running task 1617 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: recipe mesa-2_21.1.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1657 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_write_config)
NOTE: recipe libinput-1.17.3-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Started
NOTE: Running task 1726 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: recipe libinput-1.17.3-r0: task do_fetch: Succeeded
NOTE: Running task 1739 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_unpack)
NOTE: recipe font-util-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1768 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_unpack)
NOTE: Running task 1769 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1772 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_fetch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: Running task 1848 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_fetch)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe libinput-1.17.3-r0: task do_write_config: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running task 1885 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running task 1939 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_fetch)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe libinput-1.17.3-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Started
NOTE: recipe libinput-1.17.3-r0: task do_write_config: Succeeded
NOTE: Running task 1959 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: Running task 1960 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Started
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Started
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe libxfont2-2.0.4-r0: task do_fetch: Succeeded
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running task 2011 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_unpack)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe font-util-1.3.2-r0: task do_unpack: Succeeded
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running task 2054 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_patch)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: Running task 2060 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_fetch)
NOTE: Running task 2061 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 2062 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_fetch)
NOTE: Running task 2063 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_fetch)
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_fetch: Started
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
ERROR: mesa-2_21.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:21.1.2-r0 to 2:21.1.1-r0) [version-going-backwards]
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_fetch: Succeeded
NOTE: Running task 2132 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_unpack)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 2197 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_unpack)
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 901 of 901 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 2251 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.2-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Started
NOTE: Running task 2285 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_unpack)
NOTE: Running task 2291 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mkfontscale-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 2311 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2321 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_unpack)
NOTE: Running task 2322 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2323 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: Running task 2324 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: recipe libinput-1.17.3-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_unpack: Started
NOTE: Running task 2356 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 2423 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2532 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_patch)
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe font-util-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_unpack: Succeeded
NOTE: Running task 2533 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 2534 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_patch)
NOTE: recipe font-util-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libinput-1.17.3-r0: task do_patch: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2535 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_patch)
NOTE: recipe rgb-1_1.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 2536 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_patch)
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: Running task 2537 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Started
NOTE: recipe mesa-2_21.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2558 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.17.3-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_patch: Started
NOTE: Running task 2559 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_deploy_source_date_epoch)
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2560 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2561 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2562 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_patch: Succeeded
NOTE: Running task 2563 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.17.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_patch: Succeeded
NOTE: Running task 2564 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2565 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2566 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2567 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_populate_lic)
NOTE: recipe mkfontscale-1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2568 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe rgb-1_1.0.6-r0: task do_patch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: Running task 2569 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2570 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2571 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe libinput-1.17.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_populate_lic: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2572 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_configure)
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 8e80df8e3c154258d07017b0fffc2fdf741c69e23789e2227ad5fca7b03eec1a
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_populate_lic unihash changed to 18ec660ea7fcf11451dc01d0e52f9abe6988ab2a5ddf0f17023b9d0131391eee
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2598 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe mkfontscale-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_configure: Succeeded
NOTE: Running task 2637 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_configure)
NOTE: Running task 2638 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_compile)
NOTE: recipe libinput-1.17.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_compile: Succeeded
NOTE: Running task 2639 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2640 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_unpack: Succeeded
NOTE: Running task 2641 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_install: Succeeded
NOTE: Running task 2642 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 70976806914b80e0b2d21ca75441b1fe883e77187b4c6b289081eb49492d3b04
NOTE: Setscene tasks completed
NOTE: Running task 2675 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libinput-1.17.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2685 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_configure)
NOTE: recipe libinput-1.17.3-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_patch: Succeeded
NOTE: Running task 2686 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package: Succeeded
NOTE: Running task 2687 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_packagedata: Succeeded
NOTE: Running task 2688 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm)
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Started
NOTE: recipe xserver-xf86-config-0.1-r33: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.17.3-r0: task do_configure: Succeeded
NOTE: Running task 2689 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.17.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.17.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2690 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_compile)
NOTE: recipe libinput-1.17.3-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 2691 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2692 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_install)
NOTE: recipe rgb-1_1.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2693 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_compile)
NOTE: recipe font-util-1.3.2-r0: task do_install: Started
NOTE: recipe libinput-1.17.3-r0: task do_compile: Succeeded
NOTE: Running task 2694 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_compile_ptest_base)
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Started
NOTE: recipe libinput-1.17.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.17.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2695 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 2696 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 2697 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package)
NOTE: recipe rgb-1_1.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2698 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_install)
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_package: Started
NOTE: recipe libinput-1.17.3-r0: task do_install: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_install: Succeeded
NOTE: recipe font-util-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2699 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package)
NOTE: Running task 2700 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2701 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe libinput-1.17.3-r0: task do_install: Succeeded
NOTE: Running task 2702 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_install_ptest_base)
NOTE: recipe libinput-1.17.3-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.17.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2703 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_package)
NOTE: Running task 2704 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_populate_sysroot)
NOTE: recipe font-util-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 2705 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_packagedata)
NOTE: recipe libinput-1.17.3-r0: task do_package: Started
NOTE: recipe libinput-1.17.3-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2706 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe rgb-1_1.0.6-r0: task do_package: Succeeded
NOTE: Running task 2707 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Started
NOTE: recipe libinput-1.17.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rgb-1_1.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2708 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.0.6.bb:do_package_write_rpm)
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Started
NOTE: recipe rgb-1_1.0.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2709 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2710 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2711 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.17.3-r0: task do_package: Succeeded
NOTE: Running task 2712 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_packagedata)
NOTE: recipe libinput-1.17.3-r0: task do_packagedata: Started
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-src went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-dbg went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-ptest went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-staticdev went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-dev went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-doc went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-locale went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput-bin went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
ERROR: libinput-1.17.3-r0 do_packagedata: QA Issue: Package version for package libinput went backwards which would break package feeds (from 0:1.18.0-r0 to 0:1.17.3-r0) [version-going-backwards]
NOTE: recipe libinput-1.17.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2713 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.17.3.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2714 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.17.3-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2715 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2716 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2717 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.17.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2718 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2719 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2720 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 2721 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2722 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2723 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2724 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2725 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_configure)
NOTE: Running task 2726 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2727 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2728 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 2729 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2730 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package_write_rpm)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Succeeded
NOTE: Running task 2731 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2732 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mkfontscale-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2733 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_compile)
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2734 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_install)
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2735 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2736 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_packagedata)
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2737 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb:do_package_write_rpm)
NOTE: Running task 2738 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb:do_package_write_rpm)
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe mkfontscale-1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_configure: Succeeded
NOTE: Running task 2739 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_compile)
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Started
NOTE: recipe font-util-1.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.4-r0: task do_compile: Succeeded
NOTE: Running task 2740 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_install)
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_install: Succeeded
NOTE: Running task 2741 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_populate_sysroot)
NOTE: Running task 2742 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_package)
NOTE: recipe libxfont2-2.0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2743 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2744 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_configure)
NOTE: recipe libxfont2-2.0.4-r0: task do_package: Succeeded
NOTE: Running task 2745 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.4-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2746 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb:do_package_write_rpm)
NOTE: recipe libxfont2-2.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxfont2-2.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_configure: Succeeded
NOTE: Running task 2747 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_compile)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_compile: Succeeded
NOTE: Running task 2748 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_install)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_install: Succeeded
NOTE: Running task 2749 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_package)
NOTE: Running task 2750 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2751 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2752 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_package: Succeeded
NOTE: Running task 2753 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2754 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2755 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_install: Succeeded
NOTE: Running task 2756 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_package)
NOTE: Running task 2757 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_populate_sysroot)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package: Succeeded
NOTE: Running task 2758 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2759 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb:do_package_write_rpm)
NOTE: Running task 2760 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_package_write_rpm)
NOTE: Running task 2761 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_package_qa)
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe xf86-input-libinput-2_1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_1.20.11-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2762 of 2762 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2762 tasks of which 2622 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 37 ERROR messages shown, returning a non-zero exit code.

--===============9195688735532451772==
Content-Type: text/x-diff; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xf86-input-libinput-upgrade-0.30.0-1.0.1.patch"

RnJvbSBlOGQ4NmRjNzI4NjcwNWY5ZmFkY2YxMTMyZmRmMDljYTNkNDg0MzE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQGF1aC55b2N0b3Byb2plY3Qu
b3JnPgpEYXRlOiBTdW4sIDYgSnVuIDIwMjEgMTQ6Mzc6MjkgKzAwMDAKU3ViamVjdDogW1BBVENI
XSB4Zjg2LWlucHV0LWxpYmlucHV0OiB1cGdyYWRlIDAuMzAuMCAtPiAxLjAuMQoKLS0tCiAuLi4v
eG9yZy1kcml2ZXIveGY4Ni1pbnB1dC1saWJpbnB1dF8wLjMwLjAuYmIgfCAxMSAtLS0tCiAuLi4v
eG9yZy1kcml2ZXIveGY4Ni1pbnB1dC1saWJpbnB1dF8xLjAuMS5iYiAgfCA2MiArKysrKysrKysr
KysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9u
cygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWRyaXZl
ci94Zjg2LWlucHV0LWxpYmlucHV0XzAuMzAuMC5iYgogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLWRyaXZlci94Zjg2LWlucHV0LWxpYmlucHV0XzEuMC4xLmJi
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZHJpdmVyL3hmODYtaW5w
dXQtbGliaW5wdXRfMC4zMC4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZHJpdmVy
L3hmODYtaW5wdXQtbGliaW5wdXRfMC4zMC4wLmJiCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCBkMDI5ODhjYWE0Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLWRyaXZlci94Zjg2LWlucHV0LWxpYmlucHV0XzAuMzAuMC5iYgorKysgL2Rldi9udWxsCkBA
IC0xLDExICswLDAgQEAKLXJlcXVpcmUgeG9yZy1kcml2ZXItaW5wdXQuaW5jCi0KLVNVTU1BUlkg
PSAiR2VuZXJpYyBpbnB1dCBkcml2ZXIgZm9yIHRoZSBYLk9yZyBzZXJ2ZXIgYmFzZWQgb24gbGli
aW5wdXQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT01ZTZiMjBlYTJl
Zjk0YTk5ODE0NWYwZWEzZjc4OGVlMCIKLQotREVQRU5EUyArPSAibGliaW5wdXQiCi0KLVNSQ19V
UklbbWQ1c3VtXSA9ICIxMWRjZmEyY2MzOWY3OTA3MzFhOTU0NWZjZGVlYTcxNyIKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICJmOWM3ZjlmZDQxYWUxNDA2MWUwZTljM2JkNDVmYTE3MGU1ZTIxMDI3YTJi
YzU4MTAwMzRlMWU3NDhkYjk5NmMwIgotCi1GSUxFU18ke1BOfSArPSAiJHtkYXRhZGlyfS9YMTEv
eG9yZy5jb25mLmQiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1kcml2
ZXIveGY4Ni1pbnB1dC1saWJpbnB1dF8xLjAuMS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLWRyaXZlci94Zjg2LWlucHV0LWxpYmlucHV0XzEuMC4xLmJiCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAuLjc5MzcyYzJhMjEKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1kcml2ZXIveGY4Ni1pbnB1dC1saWJpbnB1dF8xLjAuMS5i
YgpAQCAtMCwwICsxLDYyIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMg
aGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcg
aXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4
dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1t
YXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1V
cGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFy
cyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysg
Q09QWUlORworIyBAQCAtMSwyMCArMSwyMCBAQAorIyAtQ29weXJpZ2h0IMKpIDIwMTQgUmVkIEhh
dCwgSW5jLgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVAorIyAgCisjIC1QZXJtaXNz
aW9uIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBkaXN0cmlidXRlLCBhbmQgc2VsbCB0aGlzIHNvZnR3
YXJlCisjIC1hbmQgaXRzIGRvY3VtZW50YXRpb24gZm9yIGFueSBwdXJwb3NlIGlzIGhlcmVieSBn
cmFudGVkIHdpdGhvdXQKKyMgLWZlZSwgcHJvdmlkZWQgdGhhdCB0aGUgYWJvdmUgY29weXJpZ2h0
IG5vdGljZSBhcHBlYXIgaW4gYWxsIGNvcGllcworIyAtYW5kIHRoYXQgYm90aCB0aGF0IGNvcHly
aWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2UKKyMgLWFwcGVhciBpbiBzdXBw
b3J0aW5nIGRvY3VtZW50YXRpb24sIGFuZCB0aGF0IHRoZSBuYW1lIG9mIHRoZSBhdXRob3JzCisj
IC1ub3QgYmUgdXNlZCBpbiBhZHZlcnRpc2luZyBvciBwdWJsaWNpdHkgcGVydGFpbmluZyB0byBk
aXN0cmlidXRpb24gb2YgdGhlCisjIC1zb2Z0d2FyZSB3aXRob3V0IHNwZWNpZmljLCB3cml0dGVu
IHByaW9yIHBlcm1pc3Npb24uICBUaGUgYXV0aG9ycyBtYWtlIG5vCisjIC1yZXByZXNlbnRhdGlv
bnMgYWJvdXQgdGhlIHN1aXRhYmlsaXR5IG9mIHRoaXMgc29mdHdhcmUgZm9yIGFueQorIyAtcHVy
cG9zZS4gIEl0IGlzIHByb3ZpZGVkICJhcyBpcyIgd2l0aG91dCBleHByZXNzIG9yIGltcGxpZWQK
KyMgLXdhcnJhbnR5LgorIyArUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBj
aGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weQorIyArb2YgdGhpcyBzb2Z0d2Fy
ZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRv
CisjICtkZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcg
d2l0aG91dCBsaW1pdGF0aW9uIHRoZQorIyArcmlnaHRzIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBt
ZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwgYW5kL29yCisjICtzZWxsIGNv
cGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZSBT
b2Z0d2FyZSBpcworIyArZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dp
bmcgY29uZGl0aW9uczoKKyMgIAorIyAtVEhFIEFVVEhPUlMgRElTQ0xBSU0gQUxMIFdBUlJBTlRJ
RVMgV0lUSCBSRUdBUkQgVE8gVEhJUyBTT0ZUV0FSRSwKKyMgLUlOQ0xVRElORyBBTEwgSU1QTElF
RCBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSBBTkQgRklUTkVTUywgSU4KKyMgLU5PIEVW
RU5UIFNIQUxMIFRIRSBBVVRIT1JTIEJFIExJQUJMRSBGT1IgQU5ZIFNQRUNJQUwsIElORElSRUNU
IE9SCisjIC1DT05TRVFVRU5USUFMIERBTUFHRVMgT1IgQU5ZIERBTUFHRVMgV0hBVFNPRVZFUiBS
RVNVTFRJTkcgRlJPTSBMT1NTCisjIC1PRiBVU0UsIERBVEEgT1IgUFJPRklUUywgV0hFVEhFUiBJ
TiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsCisjIC1ORUdMSUdFTkNFIE9SIE9USEVSIFRPUlRJT1VT
IEFDVElPTiwgQVJJU0lORyBPVVQgT0YgT1IgSU4KKyMgLUNPTk5FQ1RJT04gV0lUSCBUSEUgVVNF
IE9SIFBFUkZPUk1BTkNFIE9GIFRISVMgU09GVFdBUkUuCisjICtUaGUgYWJvdmUgY29weXJpZ2h0
IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSAoaW5jbHVkaW5nIHRoZSBuZXh0Cisj
ICtwYXJhZ3JhcGgpIHNoYWxsIGJlIGluY2x1ZGVkIGluIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRp
YWwgcG9ydGlvbnMgb2YgdGhlCisjICtTb2Z0d2FyZS4KKyMgKworIyArVEhFIFNPRlRXQVJFIElT
IFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1Mg
T1IKKyMgK0lNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJ
RVMgT0YgTUVSQ0hBTlRBQklMSVRZLAorIyArRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBP
U0UgQU5EIE5PTklORlJJTkdFTUVOVC4gSU4gTk8gRVZFTlQgU0hBTEwgVEhFCisjICtBVVRIT1JT
IE9SIENPUFlSSUdIVCBIT0xERVJTIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9S
IE9USEVSCisjICtMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBU
T1JUIE9SIE9USEVSV0lTRSwgQVJJU0lORworIyArRlJPTSwgT1VUIE9GIE9SIElOIENPTk5FQ1RJ
T04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUiBPVEhFUiBERUFMSU5HUworIyArSU4g
VEhFIFNPRlRXQVJFLgorIyAKKyMKKworcmVxdWlyZSB4b3JnLWRyaXZlci1pbnB1dC5pbmMKKwor
U1VNTUFSWSA9ICJHZW5lcmljIGlucHV0IGRyaXZlciBmb3IgdGhlIFguT3JnIHNlcnZlciBiYXNl
ZCBvbiBsaWJpbnB1dCIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWEy
MjkyNTEyN2JkM2M4MjdjMzg0Y2VkZDIzZWQyMzA5IgorCitERVBFTkRTICs9ICJsaWJpbnB1dCIK
KworU1JDX1VSSVtzaGEyNTZzdW1dID0gImZkZGVjNDljMTE1NTkxOTE4NDc1MTU1YmYxNmFhZjIz
MDE3ZDdmODE0Y2VlNzgyM2EwYzExZjg2N2FjYTI0NWIiCisKK0ZJTEVTXyR7UE59ICs9ICIke2Rh
dGFkaXJ9L1gxMS94b3JnLmNvbmYuZCIKLS0gCjIuMTcuMQoK

--===============9195688735532451772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xf86-input-libinput: SRC_URI changed from "https://www.x.org/releases//individual/driver/xf86-input-libinput-0.30.0.tar.bz2" to "https://www.x.org/releases//individual/driver/xf86-input-libinput-1.0.1.tar.bz2"
packages/core2-32-poky-linux/xf86-input-libinput: PKGV changed from 0.30.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/xf86-input-libinput: PV changed from "0.30.0" to "1.0.1"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dbg: PKGSIZE changed from 207880 to 207664 (-0%)
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dbg: PKGV changed from 0.30.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dbg: PV changed from "0.30.0" to "1.0.1"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dev: PKGSIZE changed from 9379 to 9418 (+0%)
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dev: PKGV changed from 0.30.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dev: PV changed from "0.30.0" to "1.0.1"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-doc: PKGSIZE changed from 16361 to 16358 (-0%)
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-doc: PKGV changed from 0.30.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-doc: PV changed from "0.30.0" to "1.0.1"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-locale: PKGV changed from 0.30.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-locale: PV changed from "0.30.0" to "1.0.1"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-src: PKGSIZE changed from 172163 to 171253 (-1%)
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-src: PKGV changed from 0.30.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-src: PV changed from "0.30.0" to "1.0.1"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-staticdev: PKGV changed from 0.30.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-staticdev: PV changed from "0.30.0" to "1.0.1"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput: PKGV changed from 0.30.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput: PV changed from "0.30.0" to "1.0.1"

--===============9195688735532451772==--
