Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.26025.1623000257692446751
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id DC75F38C1236
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Jun 2021 17:24:17 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-tools: upgrading to 2.12.4 SUCCEEDED
Message-ID: <MADEUP.16860E22CE9696FB.22991@lists.openembedded.org>
X-Groupsio-MsgNum: 152726
Content-Type: multipart/mixed; boundary="===============8829147291501062246=="

--===============8829147291501062246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lttng-tools* to *2.12.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lttng-tools-upgrade-2.12.3-2.12.4.patch
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

--===============8829147291501062246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 816 .bb files complete (0 cached, 816 parsed). 1452 targets, 41 skipped, 0 masked, 0 errors.
Removing 111 recipes from the core2-32 sysroot...done.
Removing 117 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-b44642db24e083f10076ab2633d52e2f55adee16"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b44642db24e083f10076ab2633d52e2f55adee16"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 585 Local 542 Network 0 Missed 43 Current 199 (92% match, 94% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 200 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 206 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Started
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
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_package_write_rpm_setscene: Started
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
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 250 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 251 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 252 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 255 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 257 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 258 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 259 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 261 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 262 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 263 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 264 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 265 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 266 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 267 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 268 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 271 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 273 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 274 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 275 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 276 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 277 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 280 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 281 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 282 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 283 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 286 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 287 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 288 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 289 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 290 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 292 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 293 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 294 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 295 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 296 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 297 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 298 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 301 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 302 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 303 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: recipe libx11-1_1.7.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 304 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 308 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 326 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 327 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 329 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 330 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 331 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 332 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 333 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 334 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 335 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 336 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 344 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 347 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 349 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 351 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 352 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_package_write_rpm_setscene)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 353 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 354 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 357 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 358 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 359 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 360 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 361 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 362 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 364 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: Running setscene task 370 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 371 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_deploy_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 377 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 380 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 383 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 385 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 394 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.49-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 404 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 407 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 413 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_deploy_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 418 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 419 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 425 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 428 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 431 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 432 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: Running task 670 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_fetch)
NOTE: Running task 673 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 682 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_fetch)
NOTE: Running task 689 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_fetch)
NOTE: Running task 690 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_fetch)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 733 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 754 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_fetch)
NOTE: Running task 755 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_fetch)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 451 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: recipe liburcu-0.12.2-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 966 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: recipe liburcu-0.12.2-r0: task do_fetch: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Started
NOTE: Running task 971 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_unpack)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_fetch: Started
NOTE: recipe musl-utils-20170421-r0: task do_fetch: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_fetch: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_fetch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_fetch: Succeeded
NOTE: Running task 983 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_unpack)
NOTE: Running task 984 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_unpack)
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_fetch: Succeeded
NOTE: recipe lttng-modules-2.12.6-r0: task do_fetch: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 985 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_unpack)
NOTE: Running task 986 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_unpack)
NOTE: Running task 987 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe musl-utils-20170421-r0: task do_fetch: Succeeded
NOTE: Running task 992 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_unpack)
NOTE: recipe liburcu-0.12.2-r0: task do_unpack: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 1006 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_unpack: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1007 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-utils-20170421-r0: task do_unpack: Started
NOTE: Running setscene task 465 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe liburcu-0.12.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 467 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: Running task 1015 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_patch)
NOTE: recipe lttng-modules-2.12.6-r0: task do_unpack: Succeeded
NOTE: Running task 1017 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Succeeded
NOTE: Running task 1018 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-utils-20170421-r0: task do_unpack: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1019 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_patch)
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1020 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_patch)
NOTE: recipe liburcu-0.12.2-r0: task do_patch: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_patch: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 1027 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 481 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: recipe musl-utils-20170421-r0: task do_patch: Started
NOTE: Running task 1035 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata_setscene)
NOTE: Running task 1052 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_unpack: Succeeded
NOTE: Running task 1053 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_patch)
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Succeeded
NOTE: Running task 1054 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch_ptest_path)
NOTE: Running task 1055 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-utils-20170421-r0: task do_patch: Succeeded
NOTE: recipe lttng-modules-2.12.6-r0: task do_patch: Succeeded
NOTE: Running task 1056 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_deploy_source_date_epoch)
NOTE: Running task 1057 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_deploy_source_date_epoch)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe liburcu-0.12.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_patch: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_patch: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1058 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_deploy_source_date_epoch)
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-utils-20170421-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Succeeded
NOTE: recipe lttng-modules-2.12.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 510 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_packagedata_setscene)
NOTE: recipe liburcu-0.12.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 517 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 522 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe musl-utils-20170421-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 526 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1087 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1088 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_populate_lic)
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_populate_lic: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 533 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 537 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_populate_sysroot_setscene)
NOTE: recipe lttng-tools-2.12.4-r0: task do_populate_lic: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_populate_lic unihash changed to 0ce7c550a397184d711fb354be3eece8e39e4a27da4a7b9b62653d6c555bafa1
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 542 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 549 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 552 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 556 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 558 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 563 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 565 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 567 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 576 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 577 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1148 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_fetch)
NOTE: Running setscene task 581 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 587 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 588 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 592 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 596 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 598 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 600 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.49-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1159 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_fetch: Succeeded
NOTE: Running task 1160 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_unpack)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 605 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 613 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 615 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 618 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.49-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 621 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 623 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1170 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1171 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 625 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 627 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 629 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 630 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-2.49-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1210 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 633 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 643 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 644 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 646 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 649 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running setscene task 651 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1221 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 655 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 656 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 661 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 663 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 664 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 669 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1233 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1248 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-src went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dbg went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-staticdev went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dev went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-doc went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-locale went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 671 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 673 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 675 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 678 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 686 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 689 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 692 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 693 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 694 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-3.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 705 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 706 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 707 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 708 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 709 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 710 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 711 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 712 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1274 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 713 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 717 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 720 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 722 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 727 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 729 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 734 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 735 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 741 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 742 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1335 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 745 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 749 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 750 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e4fc2bea8e1e3db5d8f7ac9d518459201e9f688ddc73f029dd979756a0d0ad5d
NOTE: Running task 1340 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 752 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 754 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 755 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 756 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 760 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 762 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 764 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 768 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 769 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 771 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 778 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 779 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 782 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 784 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1682 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1872 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1874 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1905 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2055 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2071 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2072 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.12.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-utils-20170421-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liburcu-0.12.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2247 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_configure)
NOTE: recipe lttng-modules-2.12.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2248 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to ae023dad6456b560f7f98aa4e88b652beaab405a67ba50d2d02c6da8d168a200
NOTE: recipe musl-utils-20170421-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2320 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_configure)
NOTE: recipe liburcu-0.12.2-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe musl-utils-20170421-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_unpack: Succeeded
NOTE: Running task 2351 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_symlink_kernsrc)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 2352 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_kernel_checkout: Started
NOTE: recipe musl-utils-20170421-r0: task do_configure: Succeeded
NOTE: Running task 2353 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_compile)
NOTE: recipe musl-utils-20170421-r0: task do_compile: Started
NOTE: recipe musl-utils-20170421-r0: task do_compile: Succeeded
NOTE: Running task 2354 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_install)
NOTE: recipe musl-utils-20170421-r0: task do_install: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_kernel_checkout: Succeeded
NOTE: Running task 2355 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_validate_branches)
NOTE: recipe musl-utils-20170421-r0: task do_install: Succeeded
NOTE: Running task 2356 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_package)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_validate_branches: Started
NOTE: recipe musl-utils-20170421-r0: task do_package: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_validate_branches: Succeeded
NOTE: Running task 2357 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_kernel_metadata)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_kernel_metadata: Started
NOTE: recipe musl-utils-20170421-r0: task do_package: Succeeded
NOTE: Running task 2358 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_packagedata)
NOTE: recipe musl-utils-20170421-r0: task do_packagedata: Started
NOTE: recipe musl-utils-20170421-r0: task do_packagedata: Succeeded
NOTE: Running task 2359 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_package_write_rpm)
NOTE: recipe musl-utils-20170421-r0: task do_package_write_rpm: Started
NOTE: recipe musl-utils-20170421-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_kernel_metadata: Succeeded
NOTE: Running task 2360 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_patch)
NOTE: Running task 2361 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_kernel_version_sanity_check)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_patch: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_patch: Succeeded
NOTE: Running task 2362 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_kernel_configme)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_kernel_configme: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2364 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2365 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2366 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2367 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2368 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liburcu-0.12.2-r0: task do_configure: Succeeded
NOTE: Running task 2369 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_compile)
NOTE: recipe liburcu-0.12.2-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2370 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2371 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2372 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_compile: Succeeded
NOTE: Running task 2373 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_install)
NOTE: recipe liburcu-0.12.2-r0: task do_install: Started
NOTE: recipe liburcu-0.12.2-r0: task do_install: Succeeded
NOTE: Running task 2374 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_populate_sysroot)
NOTE: Running task 2375 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_package)
NOTE: recipe liburcu-0.12.2-r0: task do_populate_sysroot: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package: Started
NOTE: recipe liburcu-0.12.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2376 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2377 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_configure)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_configure: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package: Succeeded
NOTE: Running task 2378 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_packagedata)
NOTE: recipe liburcu-0.12.2-r0: task do_packagedata: Started
NOTE: recipe liburcu-0.12.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2379 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_package_write_rpm)
NOTE: recipe liburcu-0.12.2-r0: task do_package_write_rpm: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_kernel_configme: Succeeded
NOTE: Running task 2380 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_configure)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_configure: Succeeded
NOTE: Running task 2381 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_kernel_configcheck)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_kernel_configcheck: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Succeeded
NOTE: Running task 2382 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2383 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_configure: Succeeded
NOTE: Running task 2384 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_compile)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_kernel_configcheck: Succeeded
NOTE: Running task 2385 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_compile)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Succeeded
NOTE: Running task 2386 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2387 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install)
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_compile: Succeeded
NOTE: Running task 2388 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_install)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_install: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 2389 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_install: Succeeded
NOTE: Running task 2390 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_populate_sysroot)
NOTE: Running task 2391 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_package)
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2392 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_populate_sysroot: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2393 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-tools-2.12.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2394 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_configure)
NOTE: recipe lttng-tools-2.12.4-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_package: Succeeded
NOTE: Running task 2395 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_packagedata)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2396 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_package_write_rpm)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_package_write_rpm: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 2397 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_packagedata)
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2398 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package_write_rpm)
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_configure: Succeeded
NOTE: Running task 2399 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_configure_ptest_base)
NOTE: recipe lttng-tools-2.12.4-r0: task do_configure_ptest_base: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2400 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_compile)
NOTE: recipe lttng-tools-2.12.4-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_compile: Succeeded
NOTE: Running task 2401 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_shared_workdir)
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_shared_workdir: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_shared_workdir: Succeeded
NOTE: Running task 2403 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_compile_kernelmodules)
NOTE: Running task 2404 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_configure)
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_compile_kernelmodules: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_compile: Succeeded
NOTE: Running task 2405 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_compile_ptest_base)
NOTE: recipe lttng-tools-2.12.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2406 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_install)
NOTE: recipe lttng-tools-2.12.4-r0: task do_install: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_install: Succeeded
NOTE: Running task 2407 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_install_ptest_base)
NOTE: recipe lttng-tools-2.12.4-r0: task do_install_ptest_base: Started
NOTE: recipe linux-yocto-5.10.41+gitAUTOINC+48a13749dc_bb3f40e801-r0: task do_compile_kernelmodules: Succeeded
NOTE: Running task 2412 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_compile)
NOTE: recipe make-mod-scripts-1.0-r0: task do_compile: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_compile: Succeeded
NOTE: Running task 2422 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_configure)
NOTE: Running task 2423 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_install)
NOTE: recipe lttng-modules-2.12.6-r0: task do_configure: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_install: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_install: Succeeded
NOTE: Running task 2424 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_package)
NOTE: recipe lttng-modules-2.12.6-r0: task do_configure: Succeeded
NOTE: Running task 2425 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_compile)
NOTE: recipe lttng-modules-2.12.6-r0: task do_compile: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_package: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_package: Succeeded
NOTE: Running task 2426 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_packagedata)
NOTE: recipe make-mod-scripts-1.0-r0: task do_packagedata: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2427 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_package)
NOTE: Running task 2428 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_populate_sysroot)
NOTE: recipe lttng-tools-2.12.4-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_package: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2429 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_package_write_rpm)
NOTE: recipe make-mod-scripts-1.0-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_package: Succeeded
NOTE: Running task 2430 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_packagedata)
NOTE: recipe lttng-tools-2.12.4-r0: task do_packagedata: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_packagedata: Succeeded
NOTE: recipe lttng-modules-2.12.6-r0: task do_compile: Succeeded
NOTE: Running task 2431 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_install)
NOTE: recipe lttng-modules-2.12.6-r0: task do_install: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_install: Succeeded
NOTE: Running task 2432 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_package)
NOTE: recipe lttng-modules-2.12.6-r0: task do_package: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_package: Succeeded
NOTE: Running task 2433 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_packagedata)
NOTE: recipe lttng-modules-2.12.6-r0: task do_packagedata: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2434 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_package_write_rpm)
NOTE: Running task 2435 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_package_write_rpm)
NOTE: Running task 2436 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_package_qa)
NOTE: recipe lttng-modules-2.12.6-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_package_qa: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_package_qa: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2437 of 2437 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2437 tasks of which 2309 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============8829147291501062246==
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
DISTRO_VERSION       = "3.3+snapshot-b44642db24e083f10076ab2633d52e2f55adee16"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b44642db24e083f10076ab2633d52e2f55adee16"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 45 Local 7 Network 0 Missed 38 Current 724 (15% match, 95% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 726 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 727 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 767 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1062 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Started
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-src went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dbg went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-staticdev went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dev went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-doc went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-locale went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1321 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_fetch)
NOTE: Running task 1348 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1396 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_fetch)
NOTE: Running task 1443 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_fetch)
NOTE: Running task 1452 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_fetch)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1630 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: recipe liburcu-0.12.2-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: Running task 1680 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_fetch)
NOTE: recipe liburcu-0.12.2-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_fetch: Started
NOTE: Running task 1741 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_unpack)
NOTE: Running task 1742 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1743 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1750 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_fetch: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_fetch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Started
NOTE: Running task 1772 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_unpack)
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_fetch: Succeeded
NOTE: Running task 1873 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_unpack)
NOTE: Running task 1874 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_unpack)
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1929 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: Running task 1930 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-modules-2.12.6-r0: task do_fetch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_fetch: Succeeded
NOTE: Running task 2065 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_unpack)
NOTE: Running task 2066 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.12.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 2169 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2226 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: recipe liburcu-0.12.2-r0: task do_unpack: Succeeded
NOTE: Running task 2227 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_patch)
NOTE: recipe lttng-modules-2.12.6-r0: task do_unpack: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_unpack: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_patch: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_unpack: Succeeded
NOTE: Running task 2228 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_patch)
NOTE: Running task 2229 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_patch)
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Succeeded
NOTE: Running task 2230 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch)
NOTE: recipe liburcu-0.12.2-r0: task do_patch: Succeeded
NOTE: Running task 2231 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_deploy_source_date_epoch)
NOTE: recipe liburcu-0.12.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 2232 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 2233 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-modules-2.12.6-r0: task do_patch: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_patch: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_unpack: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2234 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_patch)
NOTE: recipe lttng-modules-2.12.6-r0: task do_patch: Succeeded
NOTE: Running task 2235 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_deploy_source_date_epoch)
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Succeeded
NOTE: Running task 2236 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch_ptest_path)
NOTE: Running task 2237 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2238 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2239 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe lttng-modules-2.12.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2240 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_configure)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_patch: Succeeded
NOTE: Running task 2241 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-tools-2.12.4-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2242 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2243 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_configure)
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe liburcu-0.12.2-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_patch: Succeeded
NOTE: Running task 2244 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2245 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to a8696e704c99cc59615f43f4ade37486103a54ed0fa00837ab731a5a39076f1c
NOTE: recipe lttng-tools-2.12.4-r0: task do_populate_lic: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_populate_lic: Succeeded
NOTE: Running task 2309 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe lttng-tools-2.12.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_populate_lic unihash changed to 0ce7c550a397184d711fb354be3eece8e39e4a27da4a7b9b62653d6c555bafa1
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f375887b6676e4b3e599da54f7d8296740821993a123d53f1b0a0f328db6805f
NOTE: Setscene tasks completed
NOTE: Running task 2351 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2352 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2353 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2354 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2355 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2356 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liburcu-0.12.2-r0: task do_configure: Succeeded
NOTE: Running task 2357 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_compile)
NOTE: recipe liburcu-0.12.2-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2358 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2359 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2360 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_compile: Succeeded
NOTE: Running task 2361 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_install)
NOTE: recipe liburcu-0.12.2-r0: task do_install: Started
NOTE: recipe liburcu-0.12.2-r0: task do_install: Succeeded
NOTE: Running task 2362 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_populate_sysroot)
NOTE: Running task 2363 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_package)
NOTE: recipe liburcu-0.12.2-r0: task do_populate_sysroot: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package: Started
NOTE: recipe liburcu-0.12.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2364 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2365 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_configure)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_configure: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package: Succeeded
NOTE: Running task 2366 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_packagedata)
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Succeeded
NOTE: Running task 2367 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_compile)
NOTE: recipe liburcu-0.12.2-r0: task do_packagedata: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_compile: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_compile: Succeeded
NOTE: Running task 2368 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_configure)
NOTE: Running task 2369 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_install)
NOTE: recipe lttng-modules-2.12.6-r0: task do_configure: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_install: Started
NOTE: recipe liburcu-0.12.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2370 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_package_write_rpm)
NOTE: recipe make-mod-scripts-1.0-r0: task do_install: Succeeded
NOTE: Running task 2371 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_package)
NOTE: recipe lttng-modules-2.12.6-r0: task do_configure: Succeeded
NOTE: Running task 2372 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_compile)
NOTE: recipe liburcu-0.12.2-r0: task do_package_write_rpm: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_package: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_compile: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_package: Succeeded
NOTE: Running task 2373 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_packagedata)
NOTE: recipe make-mod-scripts-1.0-r0: task do_packagedata: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2374 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_package_write_rpm)
NOTE: recipe make-mod-scripts-1.0-r0: task do_package_write_rpm: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Succeeded
NOTE: Running task 2375 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2376 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_configure: Succeeded
NOTE: Running task 2377 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_compile)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Succeeded
NOTE: Running task 2378 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2379 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install)
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 2380 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install_ptest_base)
NOTE: recipe lttng-modules-2.12.6-r0: task do_compile: Succeeded
NOTE: Running task 2381 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_install)
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_install: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2382 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package)
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_install: Succeeded
NOTE: Running task 2383 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_package)
NOTE: recipe lttng-modules-2.12.6-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_compile: Succeeded
NOTE: Running task 2384 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_install)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_populate_sysroot)
NOTE: Running task 2386 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_package)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_package: Succeeded
NOTE: Running task 2387 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_packagedata)
NOTE: recipe lttng-modules-2.12.6-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2388 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-tools-2.12.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2389 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_configure)
NOTE: recipe lttng-modules-2.12.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2390 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_package_write_rpm)
NOTE: recipe lttng-tools-2.12.4-r0: task do_configure: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_package_write_rpm: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 2391 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_packagedata)
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2392 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package_write_rpm)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_package: Succeeded
NOTE: Running task 2393 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_packagedata)
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2394 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_package_write_rpm)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_configure: Succeeded
NOTE: Running task 2395 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_configure_ptest_base)
NOTE: recipe lttng-tools-2.12.4-r0: task do_configure_ptest_base: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2396 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_compile)
NOTE: recipe lttng-tools-2.12.4-r0: task do_compile: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_compile: Succeeded
NOTE: Running task 2397 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_compile_ptest_base)
NOTE: recipe lttng-tools-2.12.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2398 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_install)
NOTE: recipe lttng-tools-2.12.4-r0: task do_install: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_install: Succeeded
NOTE: Running task 2399 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_install_ptest_base)
NOTE: recipe lttng-tools-2.12.4-r0: task do_install_ptest_base: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2400 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_package)
NOTE: Running task 2401 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_populate_sysroot)
NOTE: recipe lttng-tools-2.12.4-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_package: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_package: Succeeded
NOTE: Running task 2402 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_packagedata)
NOTE: recipe lttng-tools-2.12.4-r0: task do_packagedata: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2403 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_package_write_rpm)
NOTE: Running task 2404 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_package_qa)
NOTE: recipe lttng-tools-2.12.4-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_package_qa: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_package_qa: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2405 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2405 tasks of which 2309 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============8829147291501062246==
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
DISTRO_VERSION       = "3.3+snapshot-b44642db24e083f10076ab2633d52e2f55adee16"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b44642db24e083f10076ab2633d52e2f55adee16"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 45 Local 7 Network 0 Missed 38 Current 724 (15% match, 95% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 726 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 727 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 767 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Started
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-src went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dbg went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-staticdev went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
NOTE: Running task 1062 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dev went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-doc went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-locale went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1321 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_fetch)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1348 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1396 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_fetch)
NOTE: Running task 1443 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_fetch)
NOTE: Running task 1452 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_fetch)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe liburcu-0.12.2-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_fetch: Succeeded
NOTE: Running task 1636 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_unpack)
NOTE: Running task 1637 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_fetch: Started
NOTE: Running task 1657 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1658 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_fetch: Succeeded
NOTE: Running task 1694 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Started
NOTE: Running task 1710 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_unpack)
NOTE: recipe lttng-tools-2.12.4-r0: task do_fetch: Started
NOTE: Running task 1745 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_fetch)
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_fetch: Succeeded
NOTE: Running task 1799 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_unpack)
NOTE: Running task 1800 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_unpack)
NOTE: recipe liburcu-0.12.2-r0: task do_unpack: Started
NOTE: recipe liburcu-0.12.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1990 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: Running task 1991 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_unpack: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 2036 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe lttng-modules-2.12.6-r0: task do_fetch: Succeeded
NOTE: Running task 2082 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_unpack)
NOTE: Running task 2083 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_unpack: Started
NOTE: recipe liburcu-0.12.2-r0: task do_unpack: Succeeded
NOTE: Running task 2197 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2227 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_unpack: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_unpack: Succeeded
NOTE: Running task 2228 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_patch)
NOTE: recipe liburcu-0.12.2-r0: task do_patch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Succeeded
NOTE: Running task 2229 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_unpack: Succeeded
NOTE: Running task 2230 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_patch)
NOTE: recipe liburcu-0.12.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_patch: Succeeded
NOTE: Running task 2231 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 2232 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 2233 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-modules-2.12.6-r0: task do_patch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_unpack: Succeeded
NOTE: Running task 2234 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Succeeded
NOTE: recipe lttng-modules-2.12.6-r0: task do_patch: Succeeded
NOTE: Running task 2235 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch_ptest_path)
NOTE: Running task 2236 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2237 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_deploy_source_date_epoch)
NOTE: recipe liburcu-0.12.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_patch: Succeeded
NOTE: Running task 2238 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_configure)
NOTE: Running task 2239 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-tools-2.12.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2240 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2241 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2242 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-modules-2.12.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2243 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_configure)
NOTE: recipe liburcu-0.12.2-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-modules-2.12.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_patch: Succeeded
NOTE: Running task 2244 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2245 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to af8664518cbc6402031640163c4390c955100a45cde311e8b3b1c7b30b30ef23
NOTE: recipe lttng-tools-2.12.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_populate_lic: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_populate_lic unihash changed to 0ce7c550a397184d711fb354be3eece8e39e4a27da4a7b9b62653d6c555bafa1
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2309 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 93756c671474c35a2671dda5ef84a5d04884ce64292016de139a9612b8f1bfeb
NOTE: Setscene tasks completed
NOTE: Running task 2351 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2352 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2353 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2354 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2355 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe liburcu-0.12.2-r0: task do_configure: Succeeded
NOTE: Running task 2356 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_compile)
NOTE: recipe liburcu-0.12.2-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2357 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2358 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2359 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2360 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_compile: Succeeded
NOTE: Running task 2361 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_install)
NOTE: recipe liburcu-0.12.2-r0: task do_install: Started
NOTE: recipe liburcu-0.12.2-r0: task do_install: Succeeded
NOTE: Running task 2362 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_populate_sysroot)
NOTE: Running task 2363 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_package)
NOTE: recipe liburcu-0.12.2-r0: task do_populate_sysroot: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package: Started
NOTE: recipe liburcu-0.12.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2364 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Succeeded
NOTE: Running task 2365 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_compile)
NOTE: recipe make-mod-scripts-1.0-r0: task do_compile: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_compile: Succeeded
NOTE: Running task 2366 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_configure)
NOTE: Running task 2367 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_install)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2368 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_configure)
NOTE: recipe lttng-modules-2.12.6-r0: task do_configure: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_configure: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_install: Succeeded
NOTE: Running task 2369 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_package)
NOTE: recipe lttng-modules-2.12.6-r0: task do_configure: Succeeded
NOTE: Running task 2370 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_compile)
NOTE: recipe make-mod-scripts-1.0-r0: task do_package: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_compile: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_package: Succeeded
NOTE: Running task 2371 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_packagedata)
NOTE: recipe make-mod-scripts-1.0-r0: task do_packagedata: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2372 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_package_write_rpm)
NOTE: recipe liburcu-0.12.2-r0: task do_package: Succeeded
NOTE: Running task 2373 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_packagedata)
NOTE: recipe make-mod-scripts-1.0-r0: task do_package_write_rpm: Started
NOTE: recipe liburcu-0.12.2-r0: task do_packagedata: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2374 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_package_write_rpm)
NOTE: recipe liburcu-0.12.2-r0: task do_package_write_rpm: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Succeeded
NOTE: Running task 2375 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2376 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_configure: Succeeded
NOTE: Running task 2377 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_compile)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Succeeded
NOTE: Running task 2378 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2379 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install)
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 2380 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_compile: Succeeded
NOTE: Running task 2381 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_install)
NOTE: recipe lttng-modules-2.12.6-r0: task do_install: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2382 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package)
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_compile: Succeeded
NOTE: Running task 2383 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_install)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_install: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_install: Succeeded
NOTE: Running task 2384 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_package)
NOTE: recipe lttng-modules-2.12.6-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_populate_sysroot)
NOTE: Running task 2386 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_package)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2387 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-tools-2.12.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2388 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_configure)
NOTE: recipe lttng-modules-2.12.6-r0: task do_package: Succeeded
NOTE: Running task 2389 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_packagedata)
NOTE: recipe lttng-tools-2.12.4-r0: task do_configure: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_packagedata: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 2390 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_packagedata)
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_package: Succeeded
NOTE: Running task 2391 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_packagedata)
NOTE: recipe lttng-modules-2.12.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2392 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_package_write_rpm)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_packagedata: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_package_write_rpm: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2393 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package_write_rpm)
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2394 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_package_write_rpm)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_configure: Succeeded
NOTE: Running task 2395 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_configure_ptest_base)
NOTE: recipe lttng-tools-2.12.4-r0: task do_configure_ptest_base: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2396 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_compile)
NOTE: recipe lttng-tools-2.12.4-r0: task do_compile: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_compile: Succeeded
NOTE: Running task 2397 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_compile_ptest_base)
NOTE: recipe lttng-tools-2.12.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2398 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_install)
NOTE: recipe lttng-tools-2.12.4-r0: task do_install: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_install: Succeeded
NOTE: Running task 2399 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_install_ptest_base)
NOTE: recipe lttng-tools-2.12.4-r0: task do_install_ptest_base: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2400 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_package)
NOTE: Running task 2401 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_populate_sysroot)
NOTE: recipe lttng-tools-2.12.4-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_package: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_package: Succeeded
NOTE: Running task 2402 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_packagedata)
NOTE: recipe lttng-tools-2.12.4-r0: task do_packagedata: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2403 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_package_write_rpm)
NOTE: Running task 2404 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_package_qa)
NOTE: recipe lttng-tools-2.12.4-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_package_qa: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_package_qa: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2405 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2405 tasks of which 2309 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============8829147291501062246==
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
DISTRO_VERSION       = "3.3+snapshot-b44642db24e083f10076ab2633d52e2f55adee16"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b44642db24e083f10076ab2633d52e2f55adee16"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 45 Local 7 Network 0 Missed 38 Current 724 (15% match, 95% complete)
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 726 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 727 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 767 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_packagedata_setscene)
NOTE: Running task 1062 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Started
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-src went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dbg went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-staticdev went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dev went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-doc went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-locale went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1321 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_fetch)
NOTE: Running task 1348 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1396 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_fetch)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1443 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_fetch)
NOTE: Running task 1452 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_fetch)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe liburcu-0.12.2-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1666 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_unpack)
NOTE: Running task 1667 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1668 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1669 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_fetch: Started
NOTE: Running task 1694 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_fetch: Succeeded
NOTE: Running task 1735 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_unpack)
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Started
NOTE: Running task 1745 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_fetch)
NOTE: recipe lttng-tools-2.12.4-r0: task do_fetch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_fetch: Succeeded
NOTE: Running task 1840 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_unpack)
NOTE: Running task 1870 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_unpack)
NOTE: recipe liburcu-0.12.2-r0: task do_unpack: Started
NOTE: recipe liburcu-0.12.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 2040 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: Running task 2041 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-modules-2.12.6-r0: task do_fetch: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_unpack: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_fetch: Succeeded
NOTE: Running task 2151 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_unpack)
NOTE: Running task 2152 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2225 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: recipe lttng-modules-2.12.6-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe lttng-modules-2.12.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2226 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe liburcu-0.12.2-r0: task do_unpack: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: Running task 2227 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_patch)
NOTE: recipe lttng-modules-2.12.6-r0: task do_unpack: Succeeded
NOTE: Running task 2228 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Succeeded
NOTE: Running task 2229 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_patch)
NOTE: Running task 2230 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch)
NOTE: recipe liburcu-0.12.2-r0: task do_patch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 2231 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-modules-2.12.6-r0: task do_patch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_patch: Succeeded
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_patch: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2232 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_deploy_source_date_epoch)
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 2233 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_patch: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_unpack: Succeeded
NOTE: Running task 2234 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2235 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_patch)
NOTE: recipe liburcu-0.12.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2236 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2237 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe lttng-modules-2.12.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Succeeded
NOTE: Running task 2238 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch_ptest_path)
NOTE: Running task 2239 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2240 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_configure)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_patch: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_patch: Started
NOTE: Running task 2241 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe liburcu-0.12.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2242 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2243 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 18ff1335989c10daf887d231d18248f4253445e601e18dc205b8b6a777f9bd7f
NOTE: recipe lttng-tools-2.12.4-r0: task do_patch: Succeeded
NOTE: Running task 2307 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2308 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_populate_lic)
NOTE: recipe lttng-tools-2.12.4-r0: task do_populate_lic: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2309 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe lttng-tools-2.12.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_populate_lic unihash changed to 0ce7c550a397184d711fb354be3eece8e39e4a27da4a7b9b62653d6c555bafa1
NOTE: recipe lttng-tools-2.12.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b9e21ab3b31a31ce3eb7b137c75c027a08c8977bb36ec7d973653c0701679a8f
NOTE: Setscene tasks completed
NOTE: Running task 2351 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2352 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2353 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2354 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2355 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe liburcu-0.12.2-r0: task do_configure: Succeeded
NOTE: Running task 2356 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2357 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.12.2-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2358 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2359 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2360 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_compile: Succeeded
NOTE: Running task 2361 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_install)
NOTE: recipe liburcu-0.12.2-r0: task do_install: Started
NOTE: recipe liburcu-0.12.2-r0: task do_install: Succeeded
NOTE: Running task 2362 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_populate_sysroot)
NOTE: Running task 2363 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_package)
NOTE: recipe liburcu-0.12.2-r0: task do_populate_sysroot: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package: Started
NOTE: recipe liburcu-0.12.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2364 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2365 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_configure)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_configure: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package: Succeeded
NOTE: Running task 2366 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_packagedata)
NOTE: recipe liburcu-0.12.2-r0: task do_packagedata: Started
NOTE: recipe liburcu-0.12.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2367 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_package_write_rpm)
NOTE: recipe liburcu-0.12.2-r0: task do_package_write_rpm: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Succeeded
NOTE: Running task 2368 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_compile)
NOTE: recipe make-mod-scripts-1.0-r0: task do_compile: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_compile: Succeeded
NOTE: Running task 2369 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_configure)
NOTE: Running task 2370 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_install)
NOTE: recipe lttng-modules-2.12.6-r0: task do_configure: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_install: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_install: Succeeded
NOTE: Running task 2371 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_package)
NOTE: recipe lttng-modules-2.12.6-r0: task do_configure: Succeeded
NOTE: Running task 2372 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_compile)
NOTE: recipe make-mod-scripts-1.0-r0: task do_package: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_compile: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_package: Succeeded
NOTE: Running task 2373 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_packagedata)
NOTE: recipe make-mod-scripts-1.0-r0: task do_packagedata: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2374 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_package_write_rpm)
NOTE: recipe make-mod-scripts-1.0-r0: task do_package_write_rpm: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Succeeded
NOTE: Running task 2375 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2376 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_configure: Succeeded
NOTE: Running task 2377 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_compile)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Succeeded
NOTE: Running task 2378 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2379 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install)
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 2380 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2381 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package)
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_compile: Succeeded
NOTE: Running task 2382 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_install)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_install: Succeeded
NOTE: Running task 2383 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_populate_sysroot)
NOTE: Running task 2384 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_package)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2385 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-tools-2.12.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2386 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_configure)
NOTE: recipe lttng-tools-2.12.4-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_package: Succeeded
NOTE: Running task 2387 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_packagedata)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_packagedata: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 2388 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_packagedata)
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2389 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_package_write_rpm)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_package_write_rpm: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2390 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package_write_rpm)
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-modules-2.12.6-r0: task do_compile: Succeeded
NOTE: Running task 2391 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_install)
NOTE: recipe lttng-modules-2.12.6-r0: task do_install: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_install: Succeeded
NOTE: Running task 2392 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_package)
NOTE: recipe lttng-modules-2.12.6-r0: task do_package: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_package: Succeeded
NOTE: Running task 2393 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_packagedata)
NOTE: recipe lttng-modules-2.12.6-r0: task do_packagedata: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2394 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_package_write_rpm)
NOTE: recipe lttng-modules-2.12.6-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_configure: Succeeded
NOTE: Running task 2395 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_configure_ptest_base)
NOTE: recipe lttng-tools-2.12.4-r0: task do_configure_ptest_base: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2396 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_compile)
NOTE: recipe lttng-tools-2.12.4-r0: task do_compile: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_compile: Succeeded
NOTE: Running task 2397 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_compile_ptest_base)
NOTE: recipe lttng-tools-2.12.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2398 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_install)
NOTE: recipe lttng-tools-2.12.4-r0: task do_install: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_install: Succeeded
NOTE: Running task 2399 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_install_ptest_base)
NOTE: recipe lttng-tools-2.12.4-r0: task do_install_ptest_base: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2400 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_package)
NOTE: Running task 2401 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_populate_sysroot)
NOTE: recipe lttng-tools-2.12.4-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_package: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_package: Succeeded
NOTE: Running task 2402 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_packagedata)
NOTE: recipe lttng-tools-2.12.4-r0: task do_packagedata: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2403 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_package_write_rpm)
NOTE: Running task 2404 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_package_qa)
NOTE: recipe lttng-tools-2.12.4-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_package_qa: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_package_qa: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2405 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2405 tasks of which 2309 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============8829147291501062246==
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
DISTRO_VERSION       = "3.3+snapshot-b44642db24e083f10076ab2633d52e2f55adee16"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b44642db24e083f10076ab2633d52e2f55adee16"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 45 Local 7 Network 0 Missed 38 Current 724 (15% match, 95% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 726 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 727 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 767 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1062 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-src went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dbg went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-staticdev went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dev went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-doc went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-locale went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
ERROR: xorgproto-2021.4.99.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto went backwards which would break package feeds (from 0:2021.4.99.2-r0 to 0:2021.4.99.1-r0) [version-going-backwards]
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 769 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1321 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_fetch)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1348 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1396 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_fetch)
NOTE: Running task 1443 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_fetch)
NOTE: Running task 1452 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_fetch)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe liburcu-0.12.2-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_fetch: Succeeded
NOTE: Running task 1633 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_unpack)
NOTE: Running task 1634 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1648 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_fetch: Started
NOTE: Running task 1649 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_fetch: Succeeded
NOTE: Running task 1694 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: Running task 1712 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_unpack)
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_fetch: Started
NOTE: Running task 1745 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_fetch)
NOTE: recipe lttng-tools-2.12.4-r0: task do_fetch: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_fetch: Succeeded
NOTE: Running task 1815 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_unpack)
NOTE: Running task 1817 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_unpack)
NOTE: recipe liburcu-0.12.2-r0: task do_unpack: Started
NOTE: recipe liburcu-0.12.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1998 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: Running task 1999 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 2034 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe lttng-modules-2.12.6-r0: task do_fetch: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_fetch: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Started
NOTE: Running task 2118 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_unpack)
NOTE: Running task 2119 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-tools-2.12.4-r0: task do_unpack: Started
NOTE: recipe liburcu-0.12.2-r0: task do_unpack: Succeeded
NOTE: Running task 2203 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2227 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_unpack: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_unpack: Succeeded
NOTE: Running task 2228 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_patch)
NOTE: recipe babeltrace-1.5.8-r0: task do_unpack: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_patch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: Running task 2229 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch)
NOTE: recipe liburcu-0.12.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-modules-2.12.6-r0: task do_unpack: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_patch: Succeeded
NOTE: Running task 2230 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_patch)
NOTE: Running task 2231 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2232 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 2233 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-modules-2.12.6-r0: task do_patch: Started
NOTE: recipe liburcu-0.12.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_unpack: Succeeded
NOTE: Running task 2234 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_patch: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_patch: Succeeded
NOTE: Running task 2235 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2236 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_patch_ptest_path)
NOTE: Running task 2237 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_patch: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2238 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2239 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2240 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_patch: Started
NOTE: Running task 2241 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2242 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe lttng-modules-2.12.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2243 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_configure)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe liburcu-0.12.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_patch_ptest_path: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_patch: Succeeded
NOTE: Running task 2244 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2245 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 8e80df8e3c154258d07017b0fffc2fdf741c69e23789e2227ad5fca7b03eec1a
NOTE: recipe lttng-tools-2.12.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_populate_lic: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_populate_lic unihash changed to 0ce7c550a397184d711fb354be3eece8e39e4a27da4a7b9b62653d6c555bafa1
NOTE: recipe lttng-tools-2.12.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2309 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 70976806914b80e0b2d21ca75441b1fe883e77187b4c6b289081eb49492d3b04
NOTE: Setscene tasks completed
NOTE: Running task 2350 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2352 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2353 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2354 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2355 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe liburcu-0.12.2-r0: task do_configure: Succeeded
NOTE: Running task 2356 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_compile)
NOTE: recipe liburcu-0.12.2-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2357 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2358 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2359 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2360 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_compile: Succeeded
NOTE: Running task 2361 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_install)
NOTE: recipe liburcu-0.12.2-r0: task do_install: Started
NOTE: recipe liburcu-0.12.2-r0: task do_install: Succeeded
NOTE: Running task 2362 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_populate_sysroot)
NOTE: Running task 2363 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_package)
NOTE: recipe liburcu-0.12.2-r0: task do_populate_sysroot: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package: Started
NOTE: recipe liburcu-0.12.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2364 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2365 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_configure)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_configure: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Succeeded
NOTE: Running task 2366 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_compile)
NOTE: recipe make-mod-scripts-1.0-r0: task do_compile: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_compile: Succeeded
NOTE: Running task 2367 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_configure)
NOTE: Running task 2368 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_install)
NOTE: recipe lttng-modules-2.12.6-r0: task do_configure: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_install: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_install: Succeeded
NOTE: Running task 2369 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_package)
NOTE: recipe lttng-modules-2.12.6-r0: task do_configure: Succeeded
NOTE: Running task 2370 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_compile)
NOTE: recipe make-mod-scripts-1.0-r0: task do_package: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_compile: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_package: Succeeded
NOTE: Running task 2371 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_packagedata)
NOTE: recipe make-mod-scripts-1.0-r0: task do_packagedata: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package: Succeeded
NOTE: Running task 2372 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_packagedata)
NOTE: recipe liburcu-0.12.2-r0: task do_packagedata: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2373 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_package_write_rpm)
NOTE: recipe liburcu-0.12.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2374 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.12.2.bb:do_package_write_rpm)
NOTE: recipe make-mod-scripts-1.0-r0: task do_package_write_rpm: Started
NOTE: recipe liburcu-0.12.2-r0: task do_package_write_rpm: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liburcu-0.12.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_configure: Succeeded
NOTE: Running task 2375 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_configure_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2376 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_configure: Succeeded
NOTE: Running task 2377 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_compile)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile: Succeeded
NOTE: Running task 2378 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_compile_ptest_base)
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2379 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install)
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 2380 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_install_ptest_base)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_compile: Succeeded
NOTE: Running task 2381 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_install)
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_install: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2382 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package)
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_install: Succeeded
NOTE: Running task 2383 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_populate_sysroot)
NOTE: Running task 2384 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_package)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2385 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-tools-2.12.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2386 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_configure)
NOTE: recipe lttng-tools-2.12.4-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_package: Succeeded
NOTE: Running task 2387 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_packagedata)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2388 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb:do_package_write_rpm)
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_package_write_rpm: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 2389 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_packagedata)
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Started
NOTE: recipe babeltrace-1.5.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2390 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:do_package_write_rpm)
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-ust-2_2.12.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe babeltrace-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-modules-2.12.6-r0: task do_compile: Succeeded
NOTE: Running task 2391 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_install)
NOTE: recipe lttng-modules-2.12.6-r0: task do_install: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_install: Succeeded
NOTE: Running task 2392 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_package)
NOTE: recipe lttng-modules-2.12.6-r0: task do_package: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_package: Succeeded
NOTE: Running task 2393 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_packagedata)
NOTE: recipe lttng-modules-2.12.6-r0: task do_packagedata: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2394 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.12.6.bb:do_package_write_rpm)
NOTE: recipe lttng-modules-2.12.6-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-modules-2.12.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_configure: Succeeded
NOTE: Running task 2395 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_configure_ptest_base)
NOTE: recipe lttng-tools-2.12.4-r0: task do_configure_ptest_base: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2396 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_compile)
NOTE: recipe lttng-tools-2.12.4-r0: task do_compile: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_compile: Succeeded
NOTE: Running task 2397 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_compile_ptest_base)
NOTE: recipe lttng-tools-2.12.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2398 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_install)
NOTE: recipe lttng-tools-2.12.4-r0: task do_install: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_install: Succeeded
NOTE: Running task 2399 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_install_ptest_base)
NOTE: recipe lttng-tools-2.12.4-r0: task do_install_ptest_base: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2400 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_package)
NOTE: Running task 2401 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_populate_sysroot)
NOTE: recipe lttng-tools-2.12.4-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_package: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_package: Succeeded
NOTE: Running task 2402 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_packagedata)
NOTE: recipe lttng-tools-2.12.4-r0: task do_packagedata: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2403 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_package_write_rpm)
NOTE: Running task 2404 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_package_qa)
NOTE: recipe lttng-tools-2.12.4-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_package_qa: Started
NOTE: recipe lttng-tools-2.12.4-r0: task do_package_qa: Succeeded
NOTE: recipe lttng-tools-2.12.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2405 of 2405 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2405 tasks of which 2309 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============8829147291501062246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/lttng-tools: PKGV changed from 2.12.3 [default] to 2.12.4 [default]
packages/core2-32-poky-linux/lttng-tools: PV changed from "2.12.3" to "2.12.4"
packages/core2-32-poky-linux/lttng-tools: SRC_URI changed from "https://lttng.org/files/lttng-tools/lttng-tools-2.12.3.tar.bz2 file://0001-tests-do-not-strip-a-helper-library.patch file://run-ptest file://lttng-sessiond.service file://0001-tests-regression-disable-the-tools-live-tests.patch file://determinism.patch" to "https://lttng.org/files/lttng-tools/lttng-tools-2.12.4.tar.bz2 file://0001-tests-do-not-strip-a-helper-library.patch file://run-ptest file://lttng-sessiond.service file://0001-tests-regression-disable-the-tools-live-tests.patch file://determinism.patch"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dbg: PKGV changed from 2.12.3 [default] to 2.12.4 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dbg: PV changed from "2.12.3" to "2.12.4"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dbg: PKGSIZE changed from 22899588 to 22914608 (+0%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dev: PKGV changed from 2.12.3 [default] to 2.12.4 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dev: PV changed from "2.12.3" to "2.12.4"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-doc: PKGV changed from 2.12.3 [default] to 2.12.4 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-doc: PV changed from "2.12.3" to "2.12.4"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-doc: PKGSIZE changed from 243154 to 244861 (+1%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-locale: PKGV changed from 2.12.3 [default] to 2.12.4 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-locale: PV changed from "2.12.3" to "2.12.4"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: PKGV changed from 2.12.3 [default] to 2.12.4 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: PV changed from "2.12.3" to "2.12.4"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: PKGSIZE changed from 8739011 to 8749548 (+0%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-src: PKGV changed from 2.12.3 [default] to 2.12.4 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-src: PV changed from "2.12.3" to "2.12.4"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-src: PKGSIZE changed from 4354233 to 4357451 (+0%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-staticdev: PKGV changed from 2.12.3 [default] to 2.12.4 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-staticdev: PV changed from "2.12.3" to "2.12.4"
packages/core2-32-poky-linux/lttng-tools/lttng-tools: PKGV changed from 2.12.3 [default] to 2.12.4 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools: PV changed from "2.12.3" to "2.12.4"
packages/core2-32-poky-linux/lttng-tools/lttng-tools: PKGSIZE changed from 3767441 to 3775633 (+0%)

--===============8829147291501062246==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-lttng-tools-upgrade-2.12.3-2.12.4.patch"

From 2e8f12da2b72c7aee40b79f008ef09a1fd2c0821 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 6 Jun 2021 15:10:26 +0000
Subject: [PATCH] lttng-tools: upgrade 2.12.3 -> 2.12.4

---
 .../lttng/{lttng-tools_2.12.3.bb => lttng-tools_2.12.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.12.3.bb => lttng-tools_2.12.4.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb
index 6132daf1a1..147f38741a 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://determinism.patch \
            "
 
-SRC_URI[sha256sum] = "2890da230edd523fcf497e9eb28133b7606d64fa01bcbffadbfcba42104db153"
+SRC_URI[sha256sum] = "d729f8c2373a41194f171aeb0da0a9bb35ac181f31afa7e260786d19a500dea1"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.17.1


--===============8829147291501062246==--
