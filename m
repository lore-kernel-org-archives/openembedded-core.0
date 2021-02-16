Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.5211.1613463848578057905
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 335D338C114D
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:08 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 0.17.0 SUCCEEDED
Message-ID: <MADEUP.16642CD271E15EBE.20265@lists.openembedded.org>
X-Groupsio-MsgNum: 148102
Content-Type: multipart/mixed; boundary="===============8481208262343660094=="

--===============8481208262343660094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *createrepo-c* to *0.17.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-createrepo-c-upgrade-0.16.2-0.17.0.patch
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

--===============8481208262343660094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1428 targets, 41 skipped, 0 masked, 0 errors.
Removing 105 recipes from the core2-32 sysroot...done.
Removing 109 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-ddba4314c70ab3a84f6c333c8dc83b736f74cb38"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ddba4314c70ab3a84f6c333c8dc83b736f74cb38"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 523 Found 481 Missed 42 Current 195 (91% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 196 of 718 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 197 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.10.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 199 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 203 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.10.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 262 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 263 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 264 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 265 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 267 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 268 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.10.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 269 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 270 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 271 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 275 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 276 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 277 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 278 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 280 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 281 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 283 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 285 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 286 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 289 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 290 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 292 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 293 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 294 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 295 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 296 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 297 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 298 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 299 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 300 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 302 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.10.0.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 303 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 304 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 305 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 306 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 307 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 308 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 310 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 316 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 317 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 318 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 320 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 321 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 322 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 324 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 325 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 328 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 329 of 718 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.36.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 331 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 332 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 333 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.47.bb:do_package_write_rpm_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 334 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_deploy_setscene: Started
NOTE: Running setscene task 335 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 346 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 347 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 349 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.bb:do_package_write_rpm_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 355 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 358 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 359 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 360 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.47-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
NOTE: recipe gnutls-3.7.0-r0: task do_populate_sysroot_setscene: Started
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36-r0: task do_packagedata_setscene: Started
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe nettle-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 365 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 372 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_deploy_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 377 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 380 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.47-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 383 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 388 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 390 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 398 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 401 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 402 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 403 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 404 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 405 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 406 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 425 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: Running task 670 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_fetch)
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 671 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running task 686 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_fetch)
NOTE: Running task 687 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 702 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_fetch)
NOTE: Running task 703 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_fetch)
NOTE: Running task 718 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_fetch)
NOTE: Running setscene task 431 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_fetch: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_fetch: Succeeded
NOTE: Running task 963 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_unpack)
NOTE: Running task 964 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_unpack)
NOTE: recipe libgpg-error-1.41-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_fetch: Succeeded
NOTE: recipe createrepo-c-0.17.0-r0: task do_fetch: Started
NOTE: Running task 965 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_unpack)
NOTE: Running task 966 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 967 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running setscene task 447 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 968 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_unpack)
NOTE: recipe gnutls-3.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe createrepo-c-0.17.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 453 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 458 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.bb:do_packagedata_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 459 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 969 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_unpack)
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_unpack: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_unpack: Started
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 987 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe e2fsprogs-1.45.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.41-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_unpack: Started
NOTE: recipe nettle-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 468 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 469 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 473 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_unpack: Succeeded
NOTE: Running task 1009 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_patch)
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 479 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1014 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 481 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1015 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 485 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 486 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1024 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_patch)
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 1029 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_patch)
NOTE: recipe nettle-3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1034 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.17.0-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 489 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-7.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 1039 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_patch)
NOTE: recipe libgpg-error-1.41-r0: task do_patch: Succeeded
NOTE: Running task 1040 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-7.74.0-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: Running task 1041 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1042 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_generate_toolchain_file)
NOTE: Running task 1043 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1044 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_populate_lic)
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_patch: Succeeded
NOTE: Running task 1053 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.17.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 495 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 496 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.17.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_populate_lic unihash changed to 73ecd7e67284ee4dc52016f1fffa4117bfbb0e90cb6b286326e7d96cd83e4cb4
NOTE: recipe createrepo-c-0.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 1059 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 500 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 503 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 505 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 507 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 509 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 511 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 513 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1068 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 519 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 522 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 523 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 525 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 527 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 529 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 532 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 534 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 535 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.47.bb:do_populate_sysroot_setscene)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1079 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 538 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 542 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 546 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 549 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 554 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1089 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1090 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1121 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 559 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 562 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 564 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 566 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 568 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 570 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 572 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 573 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 578 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1132 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 581 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 583 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running setscene task 585 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 587 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1141 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 591 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 593 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 594 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 596 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 599 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 600 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1160 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 605 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 607 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 608 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 621 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 631 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 632 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 636 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 641 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 642 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 644 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 646 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 647 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1206 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 650 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 651 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 655 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 656 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 665 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 667 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 668 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 669 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 671 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 677 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1267 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 679 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 681 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 687 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 688 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 93e0e7aeb112d08033644aaddf772c7ec1b77e991074c4f3c566762e480becb9
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1276 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 693 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 694 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 696 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 697 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 700 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 705 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 710 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 712 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 713 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 716 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 718 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 719 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1600 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1817 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1819 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1843 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 1878 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2126 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 055c4d134f82946839d7026b1c385802d69ba0394ea147e97f2f4e9ae021908c
NOTE: recipe curl-7.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2195 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_configure)
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2196 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2197 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe curl-7.74.0-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.41-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2198 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2199 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2200 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2201 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2202 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2203 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2204 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2205 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2206 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2207 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_configure: Succeeded
NOTE: Running task 2208 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2209 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2210 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_compile: Succeeded
NOTE: Running task 2211 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_install)
NOTE: recipe libgpg-error-1.41-r0: task do_install: Started
NOTE: recipe libgpg-error-1.41-r0: task do_install: Succeeded
NOTE: Running task 2212 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_populate_sysroot)
NOTE: Running task 2213 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package)
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Started
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2214 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2215 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Succeeded
NOTE: Running task 2216 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata)
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Succeeded
NOTE: Running task 2217 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 2218 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_compile)
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Started
NOTE: recipe curl-7.74.0-r0: task do_configure: Succeeded
NOTE: Running task 2219 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_compile)
NOTE: recipe curl-7.74.0-r0: task do_compile: Started
NOTE: recipe curl-7.74.0-r0: task do_compile: Succeeded
NOTE: Running task 2220 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_install)
NOTE: recipe curl-7.74.0-r0: task do_install: Started
NOTE: recipe curl-7.74.0-r0: task do_install: Succeeded
NOTE: Running task 2221 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_package)
NOTE: Running task 2222 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_populate_sysroot)
NOTE: recipe curl-7.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.74.0-r0: task do_package: Started
NOTE: recipe curl-7.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2223 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_install)
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 2224 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_populate_sysroot)
NOTE: Running task 2225 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package)
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2226 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.74.0-r0: task do_package: Succeeded
NOTE: Running task 2227 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_packagedata)
NOTE: recipe curl-7.74.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2228 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_configure)
NOTE: recipe curl-7.74.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2229 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_configure: Started
NOTE: recipe curl-7.74.0-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 2230 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2231 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe curl-7.74.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2232 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2233 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_install)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_install: Succeeded
NOTE: Running task 2234 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package)
NOTE: Running task 2235 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2236 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2237 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_configure)
NOTE: recipe createrepo-c-0.17.0-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_configure: Succeeded
NOTE: Running task 2238 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_compile)
NOTE: recipe createrepo-c-0.17.0-r0: task do_compile: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2239 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_install)
NOTE: recipe createrepo-c-0.17.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package: Succeeded
NOTE: Running task 2240 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.0-r0: task do_install: Succeeded
NOTE: Running task 2241 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2242 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_package)
NOTE: Running task 2243 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package_write_rpm)
NOTE: recipe createrepo-c-0.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe createrepo-c-0.17.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.17.0-r0: task do_package: Succeeded
NOTE: Running task 2244 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.0-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2245 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_package_write_rpm)
NOTE: Running task 2246 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_package_qa)
NOTE: recipe createrepo-c-0.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2247 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2247 tasks of which 2148 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============8481208262343660094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.16.2 to libcreaterepo_c.so.0.17.0
  /usr/lib/libcreaterepo_c.so.0.16.2 moved to /usr/lib/libcreaterepo_c.so.0.17.0
  /usr/lib/python3.9/site-packages/createrepo_c-0.16.2-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/createrepo_c-0.17.0-py3.9.egg-info

--===============8481208262343660094==
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
DISTRO_VERSION       = "3.2+snapshot-ddba4314c70ab3a84f6c333c8dc83b736f74cb38"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ddba4314c70ab3a84f6c333c8dc83b736f74cb38"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 46 Found 5 Missed 41 Current 661 (10% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 666 of 707 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 667 of 707 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 705 of 707 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.10-r0: task do_packagedata_setscene: Started
NOTE: Running task 1080 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
NOTE: recipe btrfs-tools-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1351 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_fetch)
NOTE: Running task 1353 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running task 1422 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_fetch)
NOTE: Running task 1423 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1471 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_fetch)
NOTE: Running task 1472 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_fetch)
NOTE: Running task 1527 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_fetch)
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Started
NOTE: Running task 1758 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_unpack)
NOTE: Running task 1759 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: Running task 1772 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1773 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_fetch: Started
NOTE: recipe curl-7.74.0-r0: task do_fetch: Started
NOTE: Running task 1774 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1775 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe createrepo-c-0.17.0-r0: task do_fetch: Started
NOTE: Running task 1791 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_unpack)
NOTE: recipe curl-7.74.0-r0: task do_fetch: Succeeded
NOTE: Running task 1806 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_unpack)
NOTE: Running task 1807 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1843 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_unpack)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1863 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_unpack)
NOTE: recipe libgpg-error-1.41-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_unpack: Started
NOTE: Running task 2084 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe curl-7.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_unpack: Succeeded
NOTE: Running task 2085 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libgpg-error-1.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_patch: Started
NOTE: Running task 2086 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 2087 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe curl-7.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe createrepo-c-0.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 2088 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_patch)
NOTE: recipe libgpg-error-1.41-r0: task do_patch: Succeeded
NOTE: Running task 2089 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2090 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2091 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: Running task 2092 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.17.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2093 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 2094 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_patch)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2095 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2096 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: Running task 2097 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 9be73892817ccae6a1679d6602b61f68cb686db2a571abe1d29b85f617ac1e25
NOTE: recipe createrepo-c-0.17.0-r0: task do_patch: Succeeded
NOTE: Running task 2139 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_generate_toolchain_file)
NOTE: Running task 2140 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2141 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_populate_lic)
NOTE: recipe curl-7.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 2142 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_patch)
NOTE: recipe libgpg-error-1.41-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_populate_lic: Started
NOTE: recipe curl-7.74.0-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_patch: Succeeded
NOTE: Running task 2143 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 2144 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.17.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_populate_lic unihash changed to 73ecd7e67284ee4dc52016f1fffa4117bfbb0e90cb6b286326e7d96cd83e4cb4
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe curl-7.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 2145 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2146 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 34ae1f9d59024cf3248f55464cec110c7b18e0eb3d540ee9ad905def0f031610
NOTE: recipe curl-7.74.0-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: Running task 2169 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_patch: Succeeded
NOTE: Running task 2176 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2177 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2178 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2179 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2180 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2181 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2182 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.41-r0: task do_configure: Succeeded
NOTE: Running task 2183 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2184 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_compile: Started
NOTE: Running task 2185 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2186 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2187 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2188 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2189 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.41-r0: task do_compile: Succeeded
NOTE: Running task 2190 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_install)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.41-r0: task do_install: Started
NOTE: recipe libgpg-error-1.41-r0: task do_install: Succeeded
NOTE: Running task 2191 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_populate_sysroot)
NOTE: Running task 2192 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package)
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Started
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2193 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2194 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Succeeded
NOTE: Running task 2195 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata)
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Succeeded
NOTE: Running task 2196 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 2197 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_compile)
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2198 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_install)
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 2199 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_populate_sysroot)
NOTE: Running task 2200 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package)
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Started
NOTE: recipe curl-7.74.0-r0: task do_configure: Succeeded
NOTE: Running task 2201 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_compile)
NOTE: recipe curl-7.74.0-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2202 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2203 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 2204 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2205 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe curl-7.74.0-r0: task do_compile: Succeeded
NOTE: Running task 2206 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_install)
NOTE: recipe curl-7.74.0-r0: task do_install: Started
NOTE: recipe curl-7.74.0-r0: task do_install: Succeeded
NOTE: Running task 2207 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_package)
NOTE: Running task 2208 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_populate_sysroot)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.74.0-r0: task do_package: Started
NOTE: recipe curl-7.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_package: Succeeded
NOTE: Running task 2209 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_packagedata)
NOTE: recipe curl-7.74.0-r0: task do_packagedata: Started
NOTE: recipe curl-7.74.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2210 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_package_write_rpm)
NOTE: recipe curl-7.74.0-r0: task do_package_write_rpm: Started
NOTE: recipe curl-7.74.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2211 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2212 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_install)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_install: Succeeded
NOTE: Running task 2213 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package)
NOTE: Running task 2214 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2215 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2216 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_configure)
NOTE: recipe createrepo-c-0.17.0-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_configure: Succeeded
NOTE: Running task 2217 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_compile)
NOTE: recipe createrepo-c-0.17.0-r0: task do_compile: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2218 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_install)
NOTE: recipe createrepo-c-0.17.0-r0: task do_install: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_install: Succeeded
NOTE: Running task 2219 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package: Succeeded
NOTE: Running task 2220 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2221 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_package)
NOTE: Running task 2222 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package_write_rpm)
NOTE: recipe createrepo-c-0.17.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_package: Succeeded
NOTE: Running task 2223 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.0-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2224 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_package_write_rpm)
NOTE: Running task 2225 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_package_qa)
NOTE: recipe createrepo-c-0.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_package_qa: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.17.0-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2226 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2226 tasks of which 2133 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============8481208262343660094==
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
DISTRO_VERSION       = "3.2+snapshot-ddba4314c70ab3a84f6c333c8dc83b736f74cb38"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ddba4314c70ab3a84f6c333c8dc83b736f74cb38"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 46 Found 5 Missed 41 Current 661 (10% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 666 of 707 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 667 of 707 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 705 of 707 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.10-r0: task do_packagedata_setscene: Started
NOTE: Running task 1080 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
NOTE: recipe btrfs-tools-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1351 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_fetch)
NOTE: Running task 1353 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running task 1422 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_fetch)
NOTE: Running task 1423 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1471 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_fetch)
NOTE: Running task 1472 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_fetch)
NOTE: Running task 1527 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_fetch)
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_fetch: Succeeded
NOTE: Running task 1703 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_unpack)
NOTE: Running task 1704 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: Running task 1719 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1720 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1721 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.74.0-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Succeeded
NOTE: Running task 1722 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1723 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_unpack)
NOTE: recipe createrepo-c-0.17.0-r0: task do_fetch: Started
NOTE: recipe curl-7.74.0-r0: task do_fetch: Succeeded
NOTE: Running task 1748 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_unpack)
NOTE: Running task 1749 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.17.0-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1763 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_unpack)
NOTE: recipe libgpg-error-1.41-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: Running task 1764 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_unpack)
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Started
NOTE: recipe curl-7.74.0-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 1866 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe createrepo-c-0.17.0-r0: task do_unpack: Started
NOTE: recipe curl-7.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libgpg-error-1.41-r0: task do_unpack: Succeeded
NOTE: Running task 2085 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 2086 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe libgpg-error-1.41-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 2087 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2088 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2089 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 2090 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe curl-7.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: Running task 2091 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libgpg-error-1.41-r0: task do_patch: Succeeded
NOTE: Running task 2092 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.17.0-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 2093 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2094 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2095 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_patch)
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_patch: Started
NOTE: recipe curl-7.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 2096 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_patch)
NOTE: recipe createrepo-c-0.17.0-r0: task do_patch: Succeeded
NOTE: Running task 2097 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_generate_toolchain_file)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2098 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2099 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_populate_lic)
NOTE: Running task 2100 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 947b3f3eeb0dfbbf6b71a2570cf7038cea898c207019c744a3a1ca5df19e8530
NOTE: Running task 2119 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_configure)
NOTE: recipe curl-7.74.0-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_configure: Started
NOTE: recipe curl-7.74.0-r0: task do_patch: Succeeded
NOTE: Running task 2143 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.17.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_populate_lic unihash changed to 73ecd7e67284ee4dc52016f1fffa4117bfbb0e90cb6b286326e7d96cd83e4cb4
NOTE: recipe createrepo-c-0.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2144 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe curl-7.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe curl-7.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2145 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 2146 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.74.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0b1db967e13a1cce76dacb0a93759952734dd0c6028b6c011e72a5e0f26fbaff
NOTE: Setscene tasks completed
NOTE: Running task 2168 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_patch: Succeeded
NOTE: Running task 2176 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2177 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2178 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2179 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2180 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2181 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2182 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2183 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2184 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2185 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2186 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe libgpg-error-1.41-r0: task do_configure: Succeeded
NOTE: Running task 2187 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_compile)
NOTE: recipe libgpg-error-1.41-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2188 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2189 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.41-r0: task do_compile: Succeeded
NOTE: Running task 2190 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_install)
NOTE: recipe libgpg-error-1.41-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_install: Succeeded
NOTE: Running task 2191 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_populate_sysroot)
NOTE: Running task 2192 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package)
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Started
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2193 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2194 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Succeeded
NOTE: Running task 2195 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata)
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Succeeded
NOTE: Running task 2196 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 2197 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_compile)
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Started
NOTE: recipe curl-7.74.0-r0: task do_configure: Succeeded
NOTE: Running task 2198 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_compile)
NOTE: recipe curl-7.74.0-r0: task do_compile: Started
NOTE: recipe curl-7.74.0-r0: task do_compile: Succeeded
NOTE: Running task 2199 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_install)
NOTE: recipe curl-7.74.0-r0: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2200 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_install)
NOTE: recipe curl-7.74.0-r0: task do_install: Succeeded
NOTE: Running task 2201 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_package)
NOTE: Running task 2202 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_populate_sysroot)
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Started
NOTE: recipe curl-7.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.74.0-r0: task do_package: Started
NOTE: recipe curl-7.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 2203 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_populate_sysroot)
NOTE: Running task 2204 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package)
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2205 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2206 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 2207 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Started
NOTE: recipe curl-7.74.0-r0: task do_package: Succeeded
NOTE: Running task 2208 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_packagedata)
NOTE: recipe curl-7.74.0-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2209 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe curl-7.74.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2210 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_package_write_rpm)
NOTE: recipe curl-7.74.0-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2211 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2212 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_install)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_install: Succeeded
NOTE: Running task 2213 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package)
NOTE: Running task 2214 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2215 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2216 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_configure)
NOTE: recipe createrepo-c-0.17.0-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_configure: Succeeded
NOTE: Running task 2217 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_compile)
NOTE: recipe createrepo-c-0.17.0-r0: task do_compile: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2218 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_install)
NOTE: recipe createrepo-c-0.17.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package: Succeeded
NOTE: Running task 2219 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_install: Succeeded
NOTE: Running task 2220 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.17.0-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2221 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_package)
NOTE: Running task 2222 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package_write_rpm)
NOTE: recipe createrepo-c-0.17.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_package: Succeeded
NOTE: Running task 2223 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.0-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2224 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_package_write_rpm)
NOTE: Running task 2225 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_package_qa)
NOTE: recipe createrepo-c-0.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_package_qa: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.17.0-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2226 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2226 tasks of which 2133 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============8481208262343660094==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-0.16.2-0.17.0.patch"

From 574d086d969615a569de855cd44ba5138b701731 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 19:27:06 +0000
Subject: [PATCH] createrepo-c: upgrade 0.16.2 -> 0.17.0

---
 ...-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 8 ++++----
 .../{createrepo-c_0.16.2.bb => createrepo-c_0.17.0.bb}    | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.16.2.bb => createrepo-c_0.17.0.bb} (95%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index c0f07fe2ca..d675af4f8b 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From 4644d18157296257284bedd857f4610f1037d50e Mon Sep 17 00:00:00 2001
+From 218a4760945be7a404df6515ffbc769c92791f9b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:31:02 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
@@ -11,11 +11,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/python/CMakeLists.txt b/src/python/CMakeLists.txt
-index 3d873f7..e977b2f 100644
+index 855127f..dff1d97 100644
 --- a/src/python/CMakeLists.txt
 +++ b/src/python/CMakeLists.txt
-@@ -21,7 +21,7 @@ if (NOT SKBUILD)
-     endif ()
+@@ -14,7 +14,7 @@ if (NOT SKBUILD)
+     FIND_PACKAGE(PythonInterp 3 EXACT REQUIRED)
  endif (NOT SKBUILD)
  
 -EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
similarity index 95%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
index 2b552a4cdf..350b183542 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "031f0524905c2a64a2faae555ca9d91281448d1b"
+SRCREV = "909a0636665ed96f97babc3b887f9badc88875c3"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


--===============8481208262343660094==
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
DISTRO_VERSION       = "3.2+snapshot-ddba4314c70ab3a84f6c333c8dc83b736f74cb38"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ddba4314c70ab3a84f6c333c8dc83b736f74cb38"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 46 Found 5 Missed 41 Current 661 (10% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 666 of 707 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 667 of 707 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 705 of 707 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.10-r0: task do_packagedata_setscene: Started
NOTE: Running task 1080 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
NOTE: recipe btrfs-tools-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1351 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_fetch)
NOTE: Running task 1353 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running task 1421 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1422 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_fetch)
NOTE: Running task 1471 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_fetch)
NOTE: Running task 1472 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_fetch)
NOTE: Running task 1527 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_fetch)
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_fetch: Succeeded
NOTE: Running task 1757 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_unpack)
NOTE: Running task 1758 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1759 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1760 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_fetch: Started
NOTE: Running task 1761 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: Running task 1762 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.74.0-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Succeeded
NOTE: Running task 1777 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_unpack)
NOTE: recipe createrepo-c-0.17.0-r0: task do_fetch: Started
NOTE: recipe curl-7.74.0-r0: task do_fetch: Succeeded
NOTE: Running task 1804 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_unpack)
NOTE: Running task 1805 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1842 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_unpack)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1869 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_unpack)
NOTE: recipe libgpg-error-1.41-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_unpack: Started
NOTE: Running task 2084 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe curl-7.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_unpack: Succeeded
NOTE: Running task 2085 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 2086 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe createrepo-c-0.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 2087 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_patch)
NOTE: recipe libgpg-error-1.41-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe curl-7.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe createrepo-c-0.17.0-r0: task do_patch: Started
NOTE: Running task 2088 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 2089 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 2090 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2091 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2092 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: Running task 2093 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.41-r0: task do_patch: Succeeded
NOTE: Running task 2094 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_patch: Succeeded
NOTE: Running task 2095 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_generate_toolchain_file)
NOTE: Running task 2096 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2097 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_populate_lic)
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 2098 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2099 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe createrepo-c-0.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_populate_lic: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2100 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe createrepo-c-0.17.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2101 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_configure)
NOTE: recipe curl-7.74.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 517200faa79489c03aaee74d243275f29de67290a89364e59cd5fcf52c63e1e4
NOTE: recipe createrepo-c-0.17.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_populate_lic unihash changed to 73ecd7e67284ee4dc52016f1fffa4117bfbb0e90cb6b286326e7d96cd83e4cb4
NOTE: recipe createrepo-c-0.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe curl-7.74.0-r0: task do_patch: Succeeded
NOTE: Running task 2143 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.41-r0: task do_configure: Started
NOTE: recipe curl-7.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2144 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe curl-7.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 2145 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_configure)
NOTE: Running task 2146 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.74.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_patch: Succeeded
NOTE: Running task 2147 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 4d36386f84f1f8a6eeadb3b159bce7be17a46afff77c0a8da00b9ade299130f5
NOTE: Setscene tasks completed
NOTE: Running task 2169 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2177 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2178 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2179 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2180 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2181 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2182 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2183 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2184 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2185 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2186 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_configure: Succeeded
NOTE: Running task 2187 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_compile)
NOTE: recipe libgpg-error-1.41-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2188 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2189 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_compile: Succeeded
NOTE: Running task 2190 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_install)
NOTE: recipe libgpg-error-1.41-r0: task do_install: Started
NOTE: recipe libgpg-error-1.41-r0: task do_install: Succeeded
NOTE: Running task 2191 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_populate_sysroot)
NOTE: Running task 2192 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package)
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Started
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2193 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2194 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Succeeded
NOTE: Running task 2195 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata)
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Succeeded
NOTE: Running task 2196 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 2197 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_compile)
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Started
NOTE: recipe curl-7.74.0-r0: task do_configure: Succeeded
NOTE: Running task 2198 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_compile)
NOTE: recipe curl-7.74.0-r0: task do_compile: Started
NOTE: recipe curl-7.74.0-r0: task do_compile: Succeeded
NOTE: Running task 2199 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_install)
NOTE: recipe curl-7.74.0-r0: task do_install: Started
NOTE: recipe curl-7.74.0-r0: task do_install: Succeeded
NOTE: Running task 2200 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_package)
NOTE: Running task 2201 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_populate_sysroot)
NOTE: recipe curl-7.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.74.0-r0: task do_package: Started
NOTE: recipe curl-7.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2202 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_install)
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 2203 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_populate_sysroot)
NOTE: Running task 2204 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package)
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2205 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.74.0-r0: task do_package: Succeeded
NOTE: Running task 2206 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_packagedata)
NOTE: recipe curl-7.74.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2207 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_configure)
NOTE: recipe curl-7.74.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2208 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_configure: Started
NOTE: recipe curl-7.74.0-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 2209 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2210 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe curl-7.74.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2211 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2212 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_install)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_install: Succeeded
NOTE: Running task 2213 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package)
NOTE: Running task 2214 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2215 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2216 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_configure)
NOTE: recipe createrepo-c-0.17.0-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_configure: Succeeded
NOTE: Running task 2217 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_compile)
NOTE: recipe createrepo-c-0.17.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package: Succeeded
NOTE: Running task 2218 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2219 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_install)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_install: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_install: Succeeded
NOTE: Running task 2220 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.17.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2221 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_package)
NOTE: Running task 2222 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package_write_rpm)
NOTE: recipe createrepo-c-0.17.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe createrepo-c-0.17.0-r0: task do_package: Succeeded
NOTE: Running task 2223 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.0-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2224 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_package_write_rpm)
NOTE: Running task 2225 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_package_qa)
NOTE: recipe createrepo-c-0.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_package_qa: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.17.0-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2226 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2226 tasks of which 2133 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============8481208262343660094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1430 entries from dependency cache.
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
DISTRO_VERSION       = "3.2+snapshot-ddba4314c70ab3a84f6c333c8dc83b736f74cb38"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ddba4314c70ab3a84f6c333c8dc83b736f74cb38"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 46 Found 5 Missed 41 Current 661 (10% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 666 of 707 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 667 of 707 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 705 of 707 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.10-r0: task do_packagedata_setscene: Started
NOTE: Running task 1080 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:5.10.1-r0 to 0:5.10-r0) [version-going-backwards]
NOTE: recipe btrfs-tools-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1351 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_fetch)
NOTE: Running task 1353 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running task 1421 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1422 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_fetch)
NOTE: Running task 1471 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_fetch)
NOTE: Running task 1472 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_fetch)
NOTE: Running task 1527 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_fetch)
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_fetch: Succeeded
NOTE: Running task 1727 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_unpack)
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: Running task 1728 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1729 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: Running task 1730 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1731 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1732 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_fetch: Started
NOTE: recipe curl-7.74.0-r0: task do_fetch: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_fetch: Started
NOTE: Running task 1747 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_unpack)
NOTE: recipe curl-7.74.0-r0: task do_fetch: Succeeded
NOTE: Running task 1761 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_unpack)
NOTE: Running task 1762 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1811 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_unpack)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1825 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_unpack)
NOTE: recipe libgpg-error-1.41-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Started
NOTE: recipe curl-7.74.0-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 2079 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe curl-7.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_unpack: Succeeded
NOTE: Running task 2085 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libgpg-error-1.41-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 2086 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe libgpg-error-1.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 2087 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 2088 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_patch)
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 2089 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_patch)
NOTE: recipe libgpg-error-1.41-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2090 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2091 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: Running task 2092 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2093 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: Running task 2094 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_patch)
NOTE: recipe createrepo-c-0.17.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2095 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe curl-7.74.0-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2096 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_patch)
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: Running task 2097 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_configure)
NOTE: recipe curl-7.74.0-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_patch: Succeeded
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2098 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_generate_toolchain_file)
NOTE: Running task 2099 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: Running task 2100 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2101 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_populate_lic)
NOTE: recipe libgpg-error-1.41-r0: task do_configure: Started
NOTE: recipe curl-7.74.0-r0: task do_patch: Succeeded
NOTE: Running task 2102 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 2e06541ff4c1e71ad371a85f393c3f35ed840fa219ee311f9a83df5e15081efc
NOTE: recipe createrepo-c-0.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_populate_lic unihash changed to 73ecd7e67284ee4dc52016f1fffa4117bfbb0e90cb6b286326e7d96cd83e4cb4
NOTE: recipe createrepo-c-0.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2144 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2145 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 2146 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.74.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 664e107f7e4384d7a71270232afba85e211fe63f8509de7e39ef4650d4c4d829
NOTE: Setscene tasks completed
NOTE: Running task 2168 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_patch: Succeeded
NOTE: Running task 2176 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2177 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2178 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2179 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2180 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2181 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2182 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2183 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2184 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2185 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2186 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.41-r0: task do_configure: Succeeded
NOTE: Running task 2187 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe libgpg-error-1.41-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2188 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2189 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.41-r0: task do_compile: Succeeded
NOTE: Running task 2190 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_install)
NOTE: recipe libgpg-error-1.41-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_install: Succeeded
NOTE: Running task 2191 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_populate_sysroot)
NOTE: Running task 2192 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package)
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Started
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2193 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2194 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Succeeded
NOTE: Running task 2195 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata)
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Succeeded
NOTE: Running task 2196 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 2197 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_compile)
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2198 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_install)
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 2199 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_populate_sysroot)
NOTE: Running task 2200 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package)
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2201 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2202 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 2203 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2204 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_configure: Succeeded
NOTE: Running task 2205 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_compile)
NOTE: recipe curl-7.74.0-r0: task do_compile: Started
NOTE: recipe curl-7.74.0-r0: task do_compile: Succeeded
NOTE: Running task 2206 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_install)
NOTE: recipe curl-7.74.0-r0: task do_install: Started
NOTE: recipe curl-7.74.0-r0: task do_install: Succeeded
NOTE: Running task 2207 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_package)
NOTE: Running task 2208 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_populate_sysroot)
NOTE: recipe curl-7.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.74.0-r0: task do_package: Started
NOTE: recipe curl-7.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_package: Succeeded
NOTE: Running task 2209 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_packagedata)
NOTE: recipe curl-7.74.0-r0: task do_packagedata: Started
NOTE: recipe curl-7.74.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2210 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_package_write_rpm)
NOTE: recipe curl-7.74.0-r0: task do_package_write_rpm: Started
NOTE: recipe curl-7.74.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2211 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2212 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_install)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_install: Succeeded
NOTE: Running task 2213 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package)
NOTE: Running task 2214 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2215 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2216 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_configure)
NOTE: recipe createrepo-c-0.17.0-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_configure: Succeeded
NOTE: Running task 2217 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_compile)
NOTE: recipe createrepo-c-0.17.0-r0: task do_compile: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2218 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_install)
NOTE: recipe createrepo-c-0.17.0-r0: task do_install: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_install: Succeeded
NOTE: Running task 2219 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.17.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package: Succeeded
NOTE: Running task 2220 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2221 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_package)
NOTE: Running task 2222 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package_write_rpm)
NOTE: recipe createrepo-c-0.17.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_package: Succeeded
NOTE: Running task 2223 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.0-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2224 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_package_write_rpm)
NOTE: Running task 2225 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_package_qa)
NOTE: recipe createrepo-c-0.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.0-r0: task do_package_qa: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.17.0-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2226 of 2226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2226 tasks of which 2133 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============8481208262343660094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "0.16.2" to "0.17.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 0.16.2 [default] to 0.17.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "0.16.2" to "0.17.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 0.16.2 [default] to 0.17.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1185040 to 1185060 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "0.16.2" to "0.17.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 0.16.2 [default] to 0.17.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGSIZE changed from 137168 to 137162 (-0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "0.16.2" to "0.17.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 0.16.2 [default] to 0.17.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "0.16.2" to "0.17.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 0.16.2 [default] to 0.17.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PV changed from "0.16.2" to "0.17.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 0.16.2 [default] to 0.17.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGSIZE changed from 1177899 to 1176001 (-0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "0.16.2" to "0.17.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 0.16.2 [default] to 0.17.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PV changed from "0.16.2" to "0.17.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGV changed from 0.16.2 [default] to 0.17.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGSIZE changed from 514099 to 514009 (-0%)
packages/core2-32-poky-linux/createrepo-c: PV changed from "0.16.2" to "0.17.0"
packages/core2-32-poky-linux/createrepo-c: PKGV changed from 0.16.2 [default] to 0.17.0 [default]
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.16.2 to libcreaterepo_c.so.0.17.0
  /usr/lib/libcreaterepo_c.so.0.16.2 moved to /usr/lib/libcreaterepo_c.so.0.17.0
  /usr/lib/python3.9/site-packages/createrepo_c-0.16.2-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/createrepo_c-0.17.0-py3.9.egg-info

--===============8481208262343660094==--
