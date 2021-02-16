Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.5219.1613463848596552830
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 355E838C112E
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:11 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] procps: upgrading to 3.3.17 FAILED
Message-ID: <MADEUP.16642CD30CDC8DB7.20265@lists.openembedded.org>
X-Groupsio-MsgNum: 148129
Content-Type: multipart/mixed; boundary="===============0786135403310436439=="

--===============0786135403310436439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *procps* to *3.3.17* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-procps-upgrade-3.3.16-3.3.17.patch
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

--===============0786135403310436439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1428 targets, 41 skipped, 0 masked, 0 errors.
Removing 90 recipes from the core2-32 sysroot...done.
Removing 94 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-12096b0ede41bf7c8f24102a02e10d2d8116ce6e"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:12096b0ede41bf7c8f24102a02e10d2d8116ce6e"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 469 Found 455 Missed 14 Current 195 (97% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 196 of 664 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 197 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.10.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 199 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 203 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 247 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 248 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 249 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 250 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 251 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.10.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.10.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 252 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.10.0.bb:do_packagedata_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 253 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: Running setscene task 254 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 265 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 266 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 267 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 268 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 269 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 271 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 274 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 275 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 277 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 278 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 279 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 280 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 281 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 283 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 284 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 285 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 286 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 287 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 288 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 289 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 290 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 292 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 293 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 294 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 297 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 298 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 299 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 300 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 301 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 302 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 304 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 305 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 306 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 307 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 308 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 310 of 664 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.36.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 311 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 312 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.47.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 314 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 315 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: Running setscene task 318 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 321 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 322 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 323 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_deploy_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 330 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.47-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 338 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 345 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 349 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.47-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: Running setscene task 362 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 363 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 364 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 366 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 375 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 376 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 710 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_fetch)
NOTE: recipe e2fsprogs-1.45.7-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 387 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_fetch: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_fetch: Succeeded
NOTE: Running task 945 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 407 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 422 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb:do_package_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_packagedata_setscene)
NOTE: Running task 993 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_patch)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_patch: Succeeded
NOTE: Running task 1001 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_deploy_source_date_epoch)
NOTE: Running task 1002 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_populate_lic)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe procps-3.3.17-r0: task do_populate_lic: Started
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_populate_lic unihash changed to d81038d91a67903aab7f742fac367e2c67ccb5f1342c348544aa9009fb1e615c
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.7-r0: task do_package_setscene: Started
NOTE: Running setscene task 438 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 445 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 447 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 454 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 463 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 464 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 467 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 468 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 472 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.47.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.45.7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 482 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.47-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1034 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe e2fsprogs-1.45.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 484 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: Running setscene task 486 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 488 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 490 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 491 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe libcap-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 498 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 500 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 502 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1047 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1049 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 504 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 505 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 509 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 513 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 515 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1081 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 518 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 521 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 522 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 523 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 525 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 526 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 528 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe linux-yocto-5.10.12+gitAUTOINC+5833ca7017_cdca787784-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 533 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1104 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 535 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 537 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 538 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 545 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 548 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running setscene task 553 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1117 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1143 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1157 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 578 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 580 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 584 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 588 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 589 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 590 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 591 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 592 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 594 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 595 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 596 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_package_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1198 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 93e0e7aeb112d08033644aaddf772c7ec1b77e991074c4f3c566762e480becb9
NOTE: Running task 1199 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.36.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 600 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 603 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 615 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 618 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 622 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 624 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 626 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 628 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 631 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 634 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 635 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 638 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 639 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 640 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 642 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 643 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 644 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 646 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 650 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 651 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+85e0e35196-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 658 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 659 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 662 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1556 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 055c4d134f82946839d7026b1c385802d69ba0394ea147e97f2f4e9ae021908c
NOTE: Running task 2070 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2102 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Running task 2103 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
ERROR: procps-3.3.17-r0 do_compile: oe_runmake failed
ERROR: procps-3.3.17-r0 do_compile: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/temp/run.do_compile.24750' failed with exit code 1:
echo 3.3.17 > .version-t && mv .version-t .version
make  all-recursive
make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build'
Making all in include
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/include'
make[2]: Nothing to be done for 'all'.
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/include'
Making all in man-po
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/man-po'
make[2]: Nothing to be done for 'all'.
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/man-po'
Making all in po
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/po'
test ! -f ../../git/po/procps-ng.pot || \
  test -z "../../git/po/de.gmo ../../git/po/fr.gmo ../../git/po/pl.gmo ../../git/po/pt_BR.gmo ../../git/po/sv.gmo ../../git/po/uk.gmo ../../git/po/vi.gmo ../../git/po/zh_CN.gmo" || make ../../git/po/de.gmo ../../git/po/fr.gmo ../../git/po/pl.gmo ../../git/po/pt_BR.gmo ../../git/po/sv.gmo ../../git/po/uk.gmo ../../git/po/vi.gmo ../../git/po/zh_CN.gmo
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/po'
cd ../../git/po && rm -f de.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o de.1po de.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o de.gmo de.1po && rm -f de.1po
cd ../../git/po && rm -f fr.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o fr.1po fr.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o fr.gmo fr.1po && rm -f fr.1po
cd ../../git/po && rm -f pl.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o pl.1po pl.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o pl.gmo pl.1po && rm -f pl.1po
cd ../../git/po && rm -f pt_BR.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o pt_BR.1po pt_BR.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o pt_BR.gmo pt_BR.1po && rm -f pt_BR.1po
cd ../../git/po && rm -f sv.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o sv.1po sv.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o sv.gmo sv.1po && rm -f sv.1po
cd ../../git/po && rm -f uk.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o uk.1po uk.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o uk.gmo uk.1po && rm -f uk.1po
cd ../../git/po && rm -f vi.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o vi.1po vi.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o vi.gmo vi.1po && rm -f vi.1po
cd ../../git/po && rm -f zh_CN.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o zh_CN.1po zh_CN.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o zh_CN.gmo zh_CN.1po && rm -f zh_CN.1po
zh_CN.1po: 170 translated messages.
de.1po: 748 translated messages.
vi.1po: 741 translated messages.
sv.1po: 820 translated messages.
pt_BR.1po: 793 translated messages.
pl.1po: 820 translated messages.
fr.1po: 820 translated messages.
uk.1po: 820 translated messages.
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/po'
touch ../../git/po/stamp-po
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/po'
Making all in testsuite
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/testsuite'
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/testsuite -I..     -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky
 -linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps.test/test-schedbatch.o ../../git/testsuite/ps.test/test-schedbatch.c
../i686-poky-linux-musl-libtool  --tag=CC   --mode=link i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-3
 2-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=   -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now -o test-schedbatch ps.test/test-schedbatch.o  
i686-poky-linux-musl-libtool: link: i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -Wl,-O1 -Wl,--hash-style=gnu
  -Wl,--as-needed -Wl,-z -Wl,relro -Wl,-z -Wl,now -o test-schedbatch ps.test/test-schedbatch.o 
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/testsuite'
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build'
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o free.o ../git/free.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o pgrep.o ../git/pgrep.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o pmap.o ../git/pmap.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o pwdx.o ../git/pwdx.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o tload.o ../git/tload.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o uptime.o ../git/uptime.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o vmstat.o ../git/vmstat.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o w.o ../git/w.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o pidof.o ../git/pidof.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o skill.o ../git/skill.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o slabtop.o ../git/slabtop.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebug-pref
 ix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o watch-watch.o `test -f 'watch.c' || echo '../git/'`watch.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebug-pref
 ix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/watch-strutils.o `test -f 'lib/strutils.c' || echo '../git/'`lib/strutils.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebug-pref
 ix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/watch-fileutils.o `test -f 'lib/fileutils.c' || echo '../git/'`lib/fileutils.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/test_strutils.o ../git/lib/test_strutils.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/test_fileutils.o ../git/lib/test_fileutils.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/test_nsutils.o ../git/lib/test_nsutils.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/test_process.o ../git/lib/test_process.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o sysctl.o ../git/sysctl.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o procio.o ../git/procio.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/display.o ../git/ps/display.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/global.o ../git/ps/global.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/help.o ../git/ps/help.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/output.o ../git/ps/output.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/parser.o ../git/ps/parser.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/select.o ../git/ps/select.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/sortformat.o ../git/ps/sortformat.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/stacktrace.o ../git/ps/stacktrace.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/fileutils.o ../git/lib/fileutils.c
./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/pr
 ocps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/alloc.lo ../git/proc/alloc.c
./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/pr
 ocps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/devname.lo ../git/proc/devname.c
./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/pr
 ocps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/escape.lo ../git/proc/escape.c
./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/pr
 ocps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/numa.lo ../git/proc/numa.c
./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/pr
 ocps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/pwcache.lo ../git/proc/pwcache.c
./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/pr
 ocps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/readproc.lo ../git/proc/readproc.c
./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/pr
 ocps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/sig.lo ../git/proc/sig.c
./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/pr
 ocps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/slab.lo ../git/proc/slab.c
./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/pr
 ocps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/sysinfo.lo ../git/proc/sysinfo.c
./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/pr
 ocps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/version.lo ../git/proc/version.c
./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/pr
 ocps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/wchan.lo ../git/proc/wchan.c
./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/pr
 ocps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/whattime.lo ../git/proc/whattime.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/strutils.o ../git/lib/strutils.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/nsutils.o ../git/lib/nsutils.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o top/top.o ../git/top/top.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o top/top_nls.o ../git/top/top_nls.c
../git/pmap.c:136:36: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446744073709551615' to '4294967295' [-Woverflow]
  136 | static unsigned KLONG range_high = ~0ull;
      |                                    ^
../git/w.c: In function 'print_from':
../git/w.c:76:22: error: '__UT_HOSTSIZE' undeclared (first use in this function); did you mean 'UT_HOSTSIZE'?
   76 | # define UT_HOSTSIZE __UT_HOSTSIZE
      |                      ^~~~~~~~~~~~~
../git/w.c:236:43: note: in expansion of macro 'UT_HOSTSIZE'
  236 |    print_display_or_interface(u->ut_host, UT_HOSTSIZE, fromlen - len);
      |                                           ^~~~~~~~~~~
../git/w.c:76:22: note: each undeclared identifier is reported only once for each function it appears in
   76 | # define UT_HOSTSIZE __UT_HOSTSIZE
      |                      ^~~~~~~~~~~~~
../git/w.c:236:43: note: in expansion of macro 'UT_HOSTSIZE'
  236 |    print_display_or_interface(u->ut_host, UT_HOSTSIZE, fromlen - len);
      |                                           ^~~~~~~~~~~
In file included from ../git/w.c:29:
../git/w.c: In function 'print_time_ival7':
../git/w.c:260:20: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time_t' {aka 'long long int'} [-Wformat=]
  260 |    fprintf(fout, _(" %2ludays"), t / (24 * 60 * 60));
      |                    ^~~~~~~~~~~
../git/include/nls.h:25:27: note: in definition of macro '_'
   25 | # define _(Text) gettext (Text)
      |                           ^~~~
../git/w.c:260:25: note: format string is defined here
  260 |    fprintf(fout, _(" %2ludays"), t / (24 * 60 * 60));
      |                      ~~~^
      |                         |
      |                         long unsigned int
      |                      %2llu
../git/w.c:264:23: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time_t' {aka 'long long int'} [-Wformat=]
  264 |    fprintf(fout, " %2lu:%02u ", t / (60 * 60),
      |                    ~~~^         ~~~~~~~~~~~~~
      |                       |           |
      |                       |           time_t {aka long long int}
      |                       long unsigned int
      |                    %2llu
In file included from ../git/w.c:29:
../git/w.c:269:20: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time_t' {aka 'long long int'} [-Wformat=]
  269 |    fprintf(fout, _(" %2lu:%02um"), t / 60, (unsigned)t % 60);
      |                    ^~~~~~~~~~~~~
../git/include/nls.h:25:27: note: in definition of macro '_'
   25 | # define _(Text) gettext (Text)
      |                           ^~~~
../git/w.c:269:25: note: format string is defined here
  269 |    fprintf(fout, _(" %2lu:%02um"), t / 60, (unsigned)t % 60);
      |                      ~~~^
      |                         |
      |                         long unsigned int
      |                      %2llu
In file included from ../git/w.c:29:
../git/w.c:275:20: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time_t' {aka 'long long int'} [-Wformat=]
  275 |    fprintf(fout, _(" %2ludays"), t / (24 * 60 * 60));
      |                    ^~~~~~~~~~~
../git/include/nls.h:25:27: note: in definition of macro '_'
   25 | # define _(Text) gettext (Text)
      |                           ^~~~
../git/w.c:275:25: note: format string is defined here
  275 |    fprintf(fout, _(" %2ludays"), t / (24 * 60 * 60));
      |                      ~~~^
      |                         |
      |                         long unsigned int
      |                      %2llu
In file included from ../git/w.c:29:
../git/w.c:279:20: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time_t' {aka 'long long int'} [-Wformat=]
  279 |    fprintf(fout, _(" %2lu:%02um"), t / (60 * 60),
      |                    ^~~~~~~~~~~~~
../git/include/nls.h:25:27: note: in definition of macro '_'
   25 | # define _(Text) gettext (Text)
      |                           ^~~~
../git/w.c:279:25: note: format string is defined here
  279 |    fprintf(fout, _(" %2lu:%02um"), t / (60 * 60),
      |                      ~~~^
      |                         |
      |                         long unsigned int
      |                      %2llu
../git/w.c:284:23: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time_t' {aka 'long long int'} [-Wformat=]
  284 |    fprintf(fout, " %2lu:%02u ", t / 60, (unsigned)t % 60);
      |                    ~~~^         ~~~~~~
      |                       |           |
      |                       |           time_t {aka long long int}
      |                       long unsigned int
      |                    %2llu
In file included from ../git/w.c:29:
../git/w.c:287:20: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time_t' {aka 'long long int'} [-Wformat=]
  287 |    fprintf(fout, _(" %2lu.%02us"), t, centi_sec);
      |                    ^~~~~~~~~~~~~
../git/include/nls.h:25:27: note: in definition of macro '_'
   25 | # define _(Text) gettext (Text)
      |                           ^~~~
../git/w.c:287:25: note: format string is defined here
  287 |    fprintf(fout, _(" %2lu.%02us"), t, centi_sec);
      |                      ~~~^
      |                         |
      |                         long unsigned int
      |                      %2llu
../git/w.c: In function 'getproc':
../git/w.c:78:22: error: '__UT_NAMESIZE' undeclared (first use in this function); did you mean 'UT_NAMESIZE'?
   78 | # define UT_NAMESIZE __UT_NAMESIZE
      |                      ^~~~~~~~~~~~~
../git/w.c:357:12: note: in expansion of macro 'UT_NAMESIZE'
  357 |   char buf[UT_NAMESIZE + 1];
      |            ^~~~~~~~~~~
../git/w.c: In function 'showinfo':
../git/w.c:78:22: error: '__UT_NAMESIZE' undeclared (first use in this function); did you mean 'UT_NAMESIZE'?
   78 | # define UT_NAMESIZE __UT_NAMESIZE
      |                      ^~~~~~~~~~~~~
../git/w.c:402:13: note: in expansion of macro 'UT_NAMESIZE'
  402 |  char uname[UT_NAMESIZE + 1] = "", tty[5 + UT_LINESIZE + 1] = "/dev/";
      |             ^~~~~~~~~~~
../git/w.c:77:22: error: '__UT_LINESIZE' undeclared (first use in this function); did you mean 'UT_LINESIZE'?
   77 | # define UT_LINESIZE __UT_LINESIZE
      |                      ^~~~~~~~~~~~~
../git/w.c:402:44: note: in expansion of macro 'UT_LINESIZE'
  402 |  char uname[UT_NAMESIZE + 1] = "", tty[5 + UT_LINESIZE + 1] = "/dev/";
      |                                            ^~~~~~~~~~~
../git/w.c: In function 'main':
../git/w.c:78:22: error: '__UT_NAMESIZE' undeclared (first use in this function); did you mean 'UT_NAMESIZE'?
   78 | # define UT_NAMESIZE __UT_NAMESIZE
      |                      ^~~~~~~~~~~~~
../git/w.c:576:21: note: in expansion of macro 'UT_NAMESIZE'
  576 |   int ut_namesize = UT_NAMESIZE;
      |                     ^~~~~~~~~~~
../git/w.c:76:22: error: '__UT_HOSTSIZE' undeclared (first use in this function); did you mean 'UT_HOSTSIZE'?
   76 | # define UT_HOSTSIZE __UT_HOSTSIZE
      |                      ^~~~~~~~~~~~~
../git/w.c:588:22: note: in expansion of macro 'UT_HOSTSIZE'
  588 |   if (fromlen < 8 || UT_HOSTSIZE < fromlen) {
      |                      ^~~~~~~~~~~
Makefile:1552: recipe for target 'w.o' failed
make[2]: *** [w.o] Error 1
make[2]: *** Waiting for unfinished jobs....
i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuil
 d/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/pwcache.c  -fPIC -DPIC -o proc/.libs/pwcache.o
i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuil
 d/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/sig.c  -fPIC -DPIC -o proc/.libs/sig.o
i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuil
 d/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/whattime.c  -fPIC -DPIC -o proc/.libs/whattime.o
i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuil
 d/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/alloc.c  -fPIC -DPIC -o proc/.libs/alloc.o
i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuil
 d/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/wchan.c  -fPIC -DPIC -o proc/.libs/wchan.o
i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuil
 d/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/readproc.c  -fPIC -DPIC -o proc/.libs/readproc.o
i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuil
 d/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/sysinfo.c  -fPIC -DPIC -o proc/.libs/sysinfo.o
i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuil
 d/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/devname.c  -fPIC -DPIC -o proc/.libs/devname.o
i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuil
 d/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/numa.c  -fPIC -DPIC -o proc/.libs/numa.o
i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuil
 d/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/escape.c  -fPIC -DPIC -o proc/.libs/escape.o
i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuil
 d/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/slab.c  -fPIC -DPIC -o proc/.libs/slab.o
i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuil
 d/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/version.c  -fPIC -DPIC -o proc/.libs/version.o
../git/proc/escape.c: In function 'escaped_copy':
../git/proc/escape.c:237:18: warning: implicit declaration of function 'nl_langinfo' [-Wimplicit-function-declaration]
  237 |      char *enc = nl_langinfo(CODESET);
      |                  ^~~~~~~~~~~
../git/proc/escape.c:237:30: error: 'CODESET' undeclared (first use in this function)
  237 |      char *enc = nl_langinfo(CODESET);
      |                              ^~~~~~~
../git/proc/escape.c:237:30: note: each undeclared identifier is reported only once for each function it appears in
Makefile:1568: recipe for target 'proc/escape.lo' failed
make[2]: *** [proc/escape.lo] Error 1
../git/proc/readproc.c: In function 'simple_nextpid':
../git/proc/readproc.c:1242:38: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size 58 [-Wformat-truncation=]
 1242 |   snprintf(path, PROCPATHLEN, "/proc/%s", ent->d_name);
      |                                      ^~
../git/proc/readproc.c:1242:3: note: 'snprintf' output between 7 and 262 bytes into a destination of size 64
 1242 |   snprintf(path, PROCPATHLEN, "/proc/%s", ent->d_name);
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../git/proc/sysinfo.c: In function 'getstat':
../git/proc/sysinfo.c:491:41: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size 26 [-Wformat-truncation=]
  491 |     snprintf(tbuf, sizeof(tbuf), "/proc/%s/stat", ent->d_name);
      |                                         ^~
../git/proc/sysinfo.c:491:5: note: 'snprintf' output between 12 and 267 bytes into a destination of size 32
  491 |     snprintf(tbuf, sizeof(tbuf), "/proc/%s/stat", ent->d_name);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../git/proc/readproc.c: In function 'simple_nexttid':
../git/proc/readproc.c:1269:46: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 41 and 51 [-Wformat-truncation=]
 1269 |   snprintf(path, PROCPATHLEN, "/proc/%d/task/%s", p->tgid, ent->d_name);
      |                                              ^~
../git/proc/readproc.c:1269:3: note: 'snprintf' output between 14 and 279 bytes into a destination of size 64
 1269 |   snprintf(path, PROCPATHLEN, "/proc/%d/task/%s", p->tgid, ent->d_name);
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../git/top/top.c: In function 'capsmk.part.0':
../git/top/top.c:839:55: warning: '%s' directive output may be truncated writing up to 31 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
  839 |       snprintf(Caps_endline, sizeof(Caps_endline), "%s%s", Caps_off, Cap_clr_eol);
      |                                                       ^~             ~~~~~~~~~~~
../git/top/top.c:839:7: note: 'snprintf' output between 1 and 63 bytes into a destination of size 32
  839 |       snprintf(Caps_endline, sizeof(Caps_endline), "%s%s", Caps_off, Cap_clr_eol);
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../git/top/top.c:872:62: warning: '%s' directive output may be truncated writing up to 31 bytes into a region of size between 1 and 64 [-Wformat-truncation=]
  872 |    snprintf(q->capclr_rowhigh, sizeof(q->capclr_rowhigh), "%s%s"
      |                                                              ^~
../git/top/top.c:872:4: note: 'snprintf' output between 1 and 95 bytes into a destination of size 64
  872 |    snprintf(q->capclr_rowhigh, sizeof(q->capclr_rowhigh), "%s%s"
      |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  873 |       , q->capclr_rownorm, CHKw(q, Show_HIBOLD) ? q->cap_bold : Cap_reverse);
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../git/top/top.c: In function 'keys_window':
../git/top/top.c:4423:55: warning: '%s' directive output may be truncated writing up to 127 bytes into a region of size 4 [-Wformat-truncation=]
 4423 |       snprintf(q->rc.winname, sizeof(q->rc.winname), "%s", name);
      |                                                       ^~
......
 5578 |             if (tmp[0] && tmp[0] != kbd_ESC) win_names(w, tmp);
      |                                                           ~~~
../git/top/top.c:4423:7: note: 'snprintf' output between 1 and 128 bytes into a destination of size 4
 4423 |       snprintf(q->rc.winname, sizeof(q->rc.winname), "%s", name);
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../git/top/top.c:4424:49: warning: '%s' directive output may be truncated writing up to 127 bytes into a region of size between 0 and 4 [-Wformat-truncation=]
 4424 |    snprintf(q->grpname, sizeof(q->grpname), "%d:%s", q->winnum, name);
      |                                                 ^~
......
 5578 |             if (tmp[0] && tmp[0] != kbd_ESC) win_names(w, tmp);
      |                                                           ~~~
../git/top/top.c:4424:4: note: 'snprintf' output between 3 and 140 bytes into a destination of size 6
 4424 |    snprintf(q->grpname, sizeof(q->grpname), "%d:%s", q->winnum, name);
      |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build'
Makefile:1888: recipe for target 'all-recursive' failed
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build'
Makefile:1056: recipe for target 'all' failed
make: *** [all] Error 2
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/temp/log.do_compile.24750
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-musl', 'i686-linux-musl', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 48
| echo 3.3.17 > .version-t && mv .version-t .version
| make  all-recursive
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build'
| Making all in include
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/include'
| make[2]: Nothing to be done for 'all'.
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/include'
| Making all in man-po
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/man-po'
| make[2]: Nothing to be done for 'all'.
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/man-po'
| Making all in po
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/po'
| test ! -f ../../git/po/procps-ng.pot || \
|   test -z "../../git/po/de.gmo ../../git/po/fr.gmo ../../git/po/pl.gmo ../../git/po/pt_BR.gmo ../../git/po/sv.gmo ../../git/po/uk.gmo ../../git/po/vi.gmo ../../git/po/zh_CN.gmo" || make ../../git/po/de.gmo ../../git/po/fr.gmo ../../git/po/pl.gmo ../../git/po/pt_BR.gmo ../../git/po/sv.gmo ../../git/po/uk.gmo ../../git/po/vi.gmo ../../git/po/zh_CN.gmo
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/po'
| cd ../../git/po && rm -f de.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o de.1po de.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o de.gmo de.1po && rm -f de.1po
| cd ../../git/po && rm -f fr.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o fr.1po fr.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o fr.gmo fr.1po && rm -f fr.1po
| cd ../../git/po && rm -f pl.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o pl.1po pl.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o pl.gmo pl.1po && rm -f pl.1po
| cd ../../git/po && rm -f pt_BR.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o pt_BR.1po pt_BR.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o pt_BR.gmo pt_BR.1po && rm -f pt_BR.1po
| cd ../../git/po && rm -f sv.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o sv.1po sv.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o sv.gmo sv.1po && rm -f sv.1po
| cd ../../git/po && rm -f uk.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o uk.1po uk.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o uk.gmo uk.1po && rm -f uk.1po
| cd ../../git/po && rm -f vi.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o vi.1po vi.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o vi.gmo vi.1po && rm -f vi.1po
| cd ../../git/po && rm -f zh_CN.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o zh_CN.1po zh_CN.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o zh_CN.gmo zh_CN.1po && rm -f zh_CN.1po
| zh_CN.1po: 170 translated messages.
| de.1po: 748 translated messages.
| vi.1po: 741 translated messages.
| sv.1po: 820 translated messages.
| pt_BR.1po: 793 translated messages.
| pl.1po: 820 translated messages.
| fr.1po: 820 translated messages.
| uk.1po: 820 translated messages.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/po'
| touch ../../git/po/stamp-po
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/po'
| Making all in testsuite
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/testsuite'
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/testsuite -I..     -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po
 ky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps.test/test-schedbatch.o ../../git/testsuite/ps.test/test-schedbatch.c
| ../i686-poky-linux-musl-libtool  --tag=CC   --mode=link i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2
 -32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=   -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now -o test-schedbatch ps.test/test-schedbatch.o
| i686-poky-linux-musl-libtool: link: i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -Wl,-O1 -Wl,--hash-style=g
 nu -Wl,--as-needed -Wl,-z -Wl,relro -Wl,-z -Wl,now -o test-schedbatch ps.test/test-schedbatch.o
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/testsuite'
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build'
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o free.o ../git/free.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o pgrep.o ../git/pgrep.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o pmap.o ../git/pmap.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o pwdx.o ../git/pwdx.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o tload.o ../git/tload.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o uptime.o ../git/uptime.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o vmstat.o ../git/vmstat.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o w.o ../git/w.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o pidof.o ../git/pidof.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o skill.o ../git/skill.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o slabtop.o ../git/slabtop.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebug-pr
 efix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o watch-watch.o `test -f 'watch.c' || echo '../git/'`watch.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebug-pr
 efix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/watch-strutils.o `test -f 'lib/strutils.c' || echo '../git/'`lib/strutils.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebug-pr
 efix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/watch-fileutils.o `test -f 'lib/fileutils.c' || echo '../git/'`lib/fileutils.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/test_strutils.o ../git/lib/test_strutils.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/test_fileutils.o ../git/lib/test_fileutils.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/test_nsutils.o ../git/lib/test_nsutils.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/test_process.o ../git/lib/test_process.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o sysctl.o ../git/sysctl.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o procio.o ../git/procio.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/display.o ../git/ps/display.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/global.o ../git/ps/global.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/help.o ../git/ps/help.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/output.o ../git/ps/output.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/parser.o ../git/ps/parser.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/select.o ../git/ps/select.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/sortformat.o ../git/ps/sortformat.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/stacktrace.o ../git/ps/stacktrace.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/fileutils.o ../git/lib/fileutils.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/alloc.lo ../git/proc/alloc.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/devname.lo ../git/proc/devname.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/escape.lo ../git/proc/escape.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/numa.lo ../git/proc/numa.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/pwcache.lo ../git/proc/pwcache.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/readproc.lo ../git/proc/readproc.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/sig.lo ../git/proc/sig.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/slab.lo ../git/proc/slab.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/sysinfo.lo ../git/proc/sysinfo.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/version.lo ../git/proc/version.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/wchan.lo ../git/proc/wchan.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/whattime.lo ../git/proc/whattime.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/strutils.o ../git/lib/strutils.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/nsutils.o ../git/lib/nsutils.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o top/top.o ../git/top/top.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o top/top_nls.o ../git/top/top_nls.c
| ../git/pmap.c:136:36: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446744073709551615' to '4294967295' [-Woverflow]
|   136 | static unsigned KLONG range_high = ~0ull;
|       |                                    ^
| ../git/w.c: In function 'print_from':
| ../git/w.c:76:22: error: '__UT_HOSTSIZE' undeclared (first use in this function); did you mean 'UT_HOSTSIZE'?
|    76 | # define UT_HOSTSIZE __UT_HOSTSIZE
|       |                      ^~~~~~~~~~~~~
| ../git/w.c:236:43: note: in expansion of macro 'UT_HOSTSIZE'
|   236 |    print_display_or_interface(u->ut_host, UT_HOSTSIZE, fromlen - len);
|       |                                           ^~~~~~~~~~~
| ../git/w.c:76:22: note: each undeclared identifier is reported only once for each function it appears in
|    76 | # define UT_HOSTSIZE __UT_HOSTSIZE
|       |                      ^~~~~~~~~~~~~
| ../git/w.c:236:43: note: in expansion of macro 'UT_HOSTSIZE'
|   236 |    print_display_or_interface(u->ut_host, UT_HOSTSIZE, fromlen - len);
|       |                                           ^~~~~~~~~~~
| In file included from ../git/w.c:29:
| ../git/w.c: In function 'print_time_ival7':
| ../git/w.c:260:20: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time_t' {aka 'long long int'} [-Wformat=]
|   260 |    fprintf(fout, _(" %2ludays"), t / (24 * 60 * 60));
|       |                    ^~~~~~~~~~~
| ../git/include/nls.h:25:27: note: in definition of macro '_'
|    25 | # define _(Text) gettext (Text)
|       |                           ^~~~
| ../git/w.c:260:25: note: format string is defined here
|   260 |    fprintf(fout, _(" %2ludays"), t / (24 * 60 * 60));
|       |                      ~~~^
|       |                         |
|       |                         long unsigned int
|       |                      %2llu
| ../git/w.c:264:23: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time_t' {aka 'long long int'} [-Wformat=]
|   264 |    fprintf(fout, " %2lu:%02u ", t / (60 * 60),
|       |                    ~~~^         ~~~~~~~~~~~~~
|       |                       |           |
|       |                       |           time_t {aka long long int}
|       |                       long unsigned int
|       |                    %2llu
| In file included from ../git/w.c:29:
| ../git/w.c:269:20: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time_t' {aka 'long long int'} [-Wformat=]
|   269 |    fprintf(fout, _(" %2lu:%02um"), t / 60, (unsigned)t % 60);
|       |                    ^~~~~~~~~~~~~
| ../git/include/nls.h:25:27: note: in definition of macro '_'
|    25 | # define _(Text) gettext (Text)
|       |                           ^~~~
| ../git/w.c:269:25: note: format string is defined here
|   269 |    fprintf(fout, _(" %2lu:%02um"), t / 60, (unsigned)t % 60);
|       |                      ~~~^
|       |                         |
|       |                         long unsigned int
|       |                      %2llu
| In file included from ../git/w.c:29:
| ../git/w.c:275:20: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time_t' {aka 'long long int'} [-Wformat=]
|   275 |    fprintf(fout, _(" %2ludays"), t / (24 * 60 * 60));
|       |                    ^~~~~~~~~~~
| ../git/include/nls.h:25:27: note: in definition of macro '_'
|    25 | # define _(Text) gettext (Text)
|       |                           ^~~~
| ../git/w.c:275:25: note: format string is defined here
|   275 |    fprintf(fout, _(" %2ludays"), t / (24 * 60 * 60));
|       |                      ~~~^
|       |                         |
|       |                         long unsigned int
|       |                      %2llu
| In file included from ../git/w.c:29:
| ../git/w.c:279:20: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time_t' {aka 'long long int'} [-Wformat=]
|   279 |    fprintf(fout, _(" %2lu:%02um"), t / (60 * 60),
|       |                    ^~~~~~~~~~~~~
| ../git/include/nls.h:25:27: note: in definition of macro '_'
|    25 | # define _(Text) gettext (Text)
|       |                           ^~~~
| ../git/w.c:279:25: note: format string is defined here
|   279 |    fprintf(fout, _(" %2lu:%02um"), t / (60 * 60),
|       |                      ~~~^
|       |                         |
|       |                         long unsigned int
|       |                      %2llu
| ../git/w.c:284:23: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time_t' {aka 'long long int'} [-Wformat=]
|   284 |    fprintf(fout, " %2lu:%02u ", t / 60, (unsigned)t % 60);
|       |                    ~~~^         ~~~~~~
|       |                       |           |
|       |                       |           time_t {aka long long int}
|       |                       long unsigned int
|       |                    %2llu
| In file included from ../git/w.c:29:
| ../git/w.c:287:20: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time_t' {aka 'long long int'} [-Wformat=]
|   287 |    fprintf(fout, _(" %2lu.%02us"), t, centi_sec);
|       |                    ^~~~~~~~~~~~~
| ../git/include/nls.h:25:27: note: in definition of macro '_'
|    25 | # define _(Text) gettext (Text)
|       |                           ^~~~
| ../git/w.c:287:25: note: format string is defined here
|   287 |    fprintf(fout, _(" %2lu.%02us"), t, centi_sec);
|       |                      ~~~^
|       |                         |
|       |                         long unsigned int
|       |                      %2llu
| ../git/w.c: In function 'getproc':
| ../git/w.c:78:22: error: '__UT_NAMESIZE' undeclared (first use in this function); did you mean 'UT_NAMESIZE'?
|    78 | # define UT_NAMESIZE __UT_NAMESIZE
|       |                      ^~~~~~~~~~~~~
| ../git/w.c:357:12: note: in expansion of macro 'UT_NAMESIZE'
|   357 |   char buf[UT_NAMESIZE + 1];
|       |            ^~~~~~~~~~~
| ../git/w.c: In function 'showinfo':
| ../git/w.c:78:22: error: '__UT_NAMESIZE' undeclared (first use in this function); did you mean 'UT_NAMESIZE'?
|    78 | # define UT_NAMESIZE __UT_NAMESIZE
|       |                      ^~~~~~~~~~~~~
| ../git/w.c:402:13: note: in expansion of macro 'UT_NAMESIZE'
|   402 |  char uname[UT_NAMESIZE + 1] = "", tty[5 + UT_LINESIZE + 1] = "/dev/";
|       |             ^~~~~~~~~~~
| ../git/w.c:77:22: error: '__UT_LINESIZE' undeclared (first use in this function); did you mean 'UT_LINESIZE'?
|    77 | # define UT_LINESIZE __UT_LINESIZE
|       |                      ^~~~~~~~~~~~~
| ../git/w.c:402:44: note: in expansion of macro 'UT_LINESIZE'
|   402 |  char uname[UT_NAMESIZE + 1] = "", tty[5 + UT_LINESIZE + 1] = "/dev/";
|       |                                            ^~~~~~~~~~~
| ../git/w.c: In function 'main':
| ../git/w.c:78:22: error: '__UT_NAMESIZE' undeclared (first use in this function); did you mean 'UT_NAMESIZE'?
|    78 | # define UT_NAMESIZE __UT_NAMESIZE
|       |                      ^~~~~~~~~~~~~
| ../git/w.c:576:21: note: in expansion of macro 'UT_NAMESIZE'
|   576 |   int ut_namesize = UT_NAMESIZE;
|       |                     ^~~~~~~~~~~
| ../git/w.c:76:22: error: '__UT_HOSTSIZE' undeclared (first use in this function); did you mean 'UT_HOSTSIZE'?
|    76 | # define UT_HOSTSIZE __UT_HOSTSIZE
|       |                      ^~~~~~~~~~~~~
| ../git/w.c:588:22: note: in expansion of macro 'UT_HOSTSIZE'
|   588 |   if (fromlen < 8 || UT_HOSTSIZE < fromlen) {
|       |                      ^~~~~~~~~~~
| Makefile:1552: recipe for target 'w.o' failed
| make[2]: *** [w.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/pwcache.c  -fPIC -DPIC -o proc/.libs/pwcache.o
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/sig.c  -fPIC -DPIC -o proc/.libs/sig.o
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/whattime.c  -fPIC -DPIC -o proc/.libs/whattime.o
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/alloc.c  -fPIC -DPIC -o proc/.libs/alloc.o
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/wchan.c  -fPIC -DPIC -o proc/.libs/wchan.o
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/readproc.c  -fPIC -DPIC -o proc/.libs/readproc.o
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/sysinfo.c  -fPIC -DPIC -o proc/.libs/sysinfo.o
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/devname.c  -fPIC -DPIC -o proc/.libs/devname.o
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/numa.c  -fPIC -DPIC -o proc/.libs/numa.o
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/escape.c  -fPIC -DPIC -o proc/.libs/escape.o
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/slab.c  -fPIC -DPIC -o proc/.libs/slab.o
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/version.c  -fPIC -DPIC -o proc/.libs/version.o
| ../git/proc/escape.c: In function 'escaped_copy':
| ../git/proc/escape.c:237:18: warning: implicit declaration of function 'nl_langinfo' [-Wimplicit-function-declaration]
|   237 |      char *enc = nl_langinfo(CODESET);
|       |                  ^~~~~~~~~~~
| ../git/proc/escape.c:237:30: error: 'CODESET' undeclared (first use in this function)
|   237 |      char *enc = nl_langinfo(CODESET);
|       |                              ^~~~~~~
| ../git/proc/escape.c:237:30: note: each undeclared identifier is reported only once for each function it appears in
| Makefile:1568: recipe for target 'proc/escape.lo' failed
| make[2]: *** [proc/escape.lo] Error 1
| ../git/proc/readproc.c: In function 'simple_nextpid':
| ../git/proc/readproc.c:1242:38: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size 58 [-Wformat-truncation=]
|  1242 |   snprintf(path, PROCPATHLEN, "/proc/%s", ent->d_name);
|       |                                      ^~
| ../git/proc/readproc.c:1242:3: note: 'snprintf' output between 7 and 262 bytes into a destination of size 64
|  1242 |   snprintf(path, PROCPATHLEN, "/proc/%s", ent->d_name);
|       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../git/proc/sysinfo.c: In function 'getstat':
| ../git/proc/sysinfo.c:491:41: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size 26 [-Wformat-truncation=]
|   491 |     snprintf(tbuf, sizeof(tbuf), "/proc/%s/stat", ent->d_name);
|       |                                         ^~
| ../git/proc/sysinfo.c:491:5: note: 'snprintf' output between 12 and 267 bytes into a destination of size 32
|   491 |     snprintf(tbuf, sizeof(tbuf), "/proc/%s/stat", ent->d_name);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../git/proc/readproc.c: In function 'simple_nexttid':
| ../git/proc/readproc.c:1269:46: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 41 and 51 [-Wformat-truncation=]
|  1269 |   snprintf(path, PROCPATHLEN, "/proc/%d/task/%s", p->tgid, ent->d_name);
|       |                                              ^~
| ../git/proc/readproc.c:1269:3: note: 'snprintf' output between 14 and 279 bytes into a destination of size 64
|  1269 |   snprintf(path, PROCPATHLEN, "/proc/%d/task/%s", p->tgid, ent->d_name);
|       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../git/top/top.c: In function 'capsmk.part.0':
| ../git/top/top.c:839:55: warning: '%s' directive output may be truncated writing up to 31 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
|   839 |       snprintf(Caps_endline, sizeof(Caps_endline), "%s%s", Caps_off, Cap_clr_eol);
|       |                                                       ^~             ~~~~~~~~~~~
| ../git/top/top.c:839:7: note: 'snprintf' output between 1 and 63 bytes into a destination of size 32
|   839 |       snprintf(Caps_endline, sizeof(Caps_endline), "%s%s", Caps_off, Cap_clr_eol);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../git/top/top.c:872:62: warning: '%s' directive output may be truncated writing up to 31 bytes into a region of size between 1 and 64 [-Wformat-truncation=]
|   872 |    snprintf(q->capclr_rowhigh, sizeof(q->capclr_rowhigh), "%s%s"
|       |                                                              ^~
| ../git/top/top.c:872:4: note: 'snprintf' output between 1 and 95 bytes into a destination of size 64
|   872 |    snprintf(q->capclr_rowhigh, sizeof(q->capclr_rowhigh), "%s%s"
|       |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|   873 |       , q->capclr_rownorm, CHKw(q, Show_HIBOLD) ? q->cap_bold : Cap_reverse);
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../git/top/top.c: In function 'keys_window':
| ../git/top/top.c:4423:55: warning: '%s' directive output may be truncated writing up to 127 bytes into a region of size 4 [-Wformat-truncation=]
|  4423 |       snprintf(q->rc.winname, sizeof(q->rc.winname), "%s", name);
|       |                                                       ^~
| ......
|  5578 |             if (tmp[0] && tmp[0] != kbd_ESC) win_names(w, tmp);
|       |                                                           ~~~
| ../git/top/top.c:4423:7: note: 'snprintf' output between 1 and 128 bytes into a destination of size 4
|  4423 |       snprintf(q->rc.winname, sizeof(q->rc.winname), "%s", name);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../git/top/top.c:4424:49: warning: '%s' directive output may be truncated writing up to 127 bytes into a region of size between 0 and 4 [-Wformat-truncation=]
|  4424 |    snprintf(q->grpname, sizeof(q->grpname), "%d:%s", q->winnum, name);
|       |                                                 ^~
| ......
|  5578 |             if (tmp[0] && tmp[0] != kbd_ESC) win_names(w, tmp);
|       |                                                           ~~~
| ../git/top/top.c:4424:4: note: 'snprintf' output between 3 and 140 bytes into a destination of size 6
|  4424 |    snprintf(q->grpname, sizeof(q->grpname), "%d:%s", q->winnum, name);
|       |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build'
| Makefile:1888: recipe for target 'all-recursive' failed
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build'
| Makefile:1056: recipe for target 'all' failed
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/temp/run.do_compile.24750' failed with exit code 1:
| echo 3.3.17 > .version-t && mv .version-t .version
| make  all-recursive
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build'
| Making all in include
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/include'
| make[2]: Nothing to be done for 'all'.
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/include'
| Making all in man-po
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/man-po'
| make[2]: Nothing to be done for 'all'.
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/man-po'
| Making all in po
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/po'
| test ! -f ../../git/po/procps-ng.pot || \
|   test -z "../../git/po/de.gmo ../../git/po/fr.gmo ../../git/po/pl.gmo ../../git/po/pt_BR.gmo ../../git/po/sv.gmo ../../git/po/uk.gmo ../../git/po/vi.gmo ../../git/po/zh_CN.gmo" || make ../../git/po/de.gmo ../../git/po/fr.gmo ../../git/po/pl.gmo ../../git/po/pt_BR.gmo ../../git/po/sv.gmo ../../git/po/uk.gmo ../../git/po/vi.gmo ../../git/po/zh_CN.gmo
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/po'
| cd ../../git/po && rm -f de.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o de.1po de.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o de.gmo de.1po && rm -f de.1po
| cd ../../git/po && rm -f fr.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o fr.1po fr.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o fr.gmo fr.1po && rm -f fr.1po
| cd ../../git/po && rm -f pl.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o pl.1po pl.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o pl.gmo pl.1po && rm -f pl.1po
| cd ../../git/po && rm -f pt_BR.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o pt_BR.1po pt_BR.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o pt_BR.gmo pt_BR.1po && rm -f pt_BR.1po
| cd ../../git/po && rm -f sv.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o sv.1po sv.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o sv.gmo sv.1po && rm -f sv.1po
| cd ../../git/po && rm -f uk.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o uk.1po uk.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o uk.gmo uk.1po && rm -f uk.1po
| cd ../../git/po && rm -f vi.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o vi.1po vi.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o vi.gmo vi.1po && rm -f vi.1po
| cd ../../git/po && rm -f zh_CN.gmo && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o zh_CN.1po zh_CN.po procps-ng.pot && /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o zh_CN.gmo zh_CN.1po && rm -f zh_CN.1po
| zh_CN.1po: 170 translated messages.
| de.1po: 748 translated messages.
| vi.1po: 741 translated messages.
| sv.1po: 820 translated messages.
| pt_BR.1po: 793 translated messages.
| pl.1po: 820 translated messages.
| fr.1po: 820 translated messages.
| uk.1po: 820 translated messages.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/po'
| touch ../../git/po/stamp-po
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/po'
| Making all in testsuite
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/testsuite'
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/testsuite -I..     -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po
 ky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps.test/test-schedbatch.o ../../git/testsuite/ps.test/test-schedbatch.c
| ../i686-poky-linux-musl-libtool  --tag=CC   --mode=link i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2
 -32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=   -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now -o test-schedbatch ps.test/test-schedbatch.o
| i686-poky-linux-musl-libtool: link: i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -Wl,-O1 -Wl,--hash-style=g
 nu -Wl,--as-needed -Wl,-z -Wl,relro -Wl,-z -Wl,now -o test-schedbatch ps.test/test-schedbatch.o
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build/testsuite'
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build'
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o free.o ../git/free.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o pgrep.o ../git/pgrep.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o pmap.o ../git/pmap.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o pwdx.o ../git/pwdx.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o tload.o ../git/tload.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o uptime.o ../git/uptime.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o vmstat.o ../git/vmstat.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o w.o ../git/w.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o pidof.o ../git/pidof.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o skill.o ../git/skill.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o slabtop.o ../git/slabtop.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebug-pr
 efix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o watch-watch.o `test -f 'watch.c' || echo '../git/'`watch.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebug-pr
 efix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/watch-strutils.o `test -f 'lib/strutils.c' || echo '../git/'`lib/strutils.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fdebug-pr
 efix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/watch-fileutils.o `test -f 'lib/fileutils.c' || echo '../git/'`lib/fileutils.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/test_strutils.o ../git/lib/test_strutils.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/test_fileutils.o ../git/lib/test_fileutils.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/test_nsutils.o ../git/lib/test_nsutils.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/test_process.o ../git/lib/test_process.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o sysctl.o ../git/sysctl.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o procio.o ../git/procio.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/display.o ../git/ps/display.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/global.o ../git/ps/global.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/help.o ../git/ps/help.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/output.o ../git/ps/output.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/parser.o ../git/ps/parser.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/select.o ../git/ps/select.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/sortformat.o ../git/ps/sortformat.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o ps/stacktrace.o ../git/ps/stacktrace.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/fileutils.o ../git/lib/fileutils.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/alloc.lo ../git/proc/alloc.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/devname.lo ../git/proc/devname.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/escape.lo ../git/proc/escape.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/numa.lo ../git/proc/numa.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/pwcache.lo ../git/proc/pwcache.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/readproc.lo ../git/proc/readproc.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/sig.lo ../git/proc/sig.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/slab.lo ../git/proc/slab.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/sysinfo.lo ../git/proc/sysinfo.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/version.lo ../git/proc/version.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/wchan.lo ../git/proc/wchan.c
| ./i686-poky-linux-musl-libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/
 procps/3.3.17-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o proc/whattime.lo ../git/proc/whattime.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/strutils.o ../git/lib/strutils.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o lib/nsutils.o ../git/lib/nsutils.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o top/top.o ../git/top/top.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git  -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\"  -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot=                      -fde
 bug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native=  -c -o top/top_nls.o ../git/top/top_nls.c
| ../git/pmap.c:136:36: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446744073709551615' to '4294967295' [-Woverflow]
|   136 | static unsigned KLONG range_high = ~0ull;
|       |                                    ^
| ../git/w.c: In function 'print_from':
| ../git/w.c:76:22: error: '__UT_HOSTSIZE' undeclared (first use in this function); did you mean 'UT_HOSTSIZE'?
|    76 | # define UT_HOSTSIZE __UT_HOSTSIZE
|       |                      ^~~~~~~~~~~~~
| ../git/w.c:236:43: note: in expansion of macro 'UT_HOSTSIZE'
|   236 |    print_display_or_interface(u->ut_host, UT_HOSTSIZE, fromlen - len);
|       |                                           ^~~~~~~~~~~
| ../git/w.c:76:22: note: each undeclared identifier is reported only once for each function it appears in
|    76 | # define UT_HOSTSIZE __UT_HOSTSIZE
|       |                      ^~~~~~~~~~~~~
| ../git/w.c:236:43: note: in expansion of macro 'UT_HOSTSIZE'
|   236 |    print_display_or_interface(u->ut_host, UT_HOSTSIZE, fromlen - len);
|       |                                           ^~~~~~~~~~~
| In file included from ../git/w.c:29:
| ../git/w.c: In function 'print_time_ival7':
| ../git/w.c:260:20: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time_t' {aka 'long long int'} [-Wformat=]
|   260 |    fprintf(fout, _(" %2ludays"), t / (24 * 60 * 60));
|       |                    ^~~~~~~~~~~
| ../git/include/nls.h:25:27: note: in definition of macro '_'
|    25 | # define _(Text) gettext (Text)
|       |                           ^~~~
| ../git/w.c:260:25: note: format string is defined here
|   260 |    fprintf(fout, _(" %2ludays"), t / (24 * 60 * 60));
|       |                      ~~~^
|       |                         |
|       |                         long unsigned int
|       |                      %2llu
| ../git/w.c:264:23: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time_t' {aka 'long long int'} [-Wformat=]
|   264 |    fprintf(fout, " %2lu:%02u ", t / (60 * 60),
|       |                    ~~~^         ~~~~~~~~~~~~~
|       |                       |           |
|       |                       |           time_t {aka long long int}
|       |                       long unsigned int
|       |                    %2llu
| In file included from ../git/w.c:29:
| ../git/w.c:269:20: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time_t' {aka 'long long int'} [-Wformat=]
|   269 |    fprintf(fout, _(" %2lu:%02um"), t / 60, (unsigned)t % 60);
|       |                    ^~~~~~~~~~~~~
| ../git/include/nls.h:25:27: note: in definition of macro '_'
|    25 | # define _(Text) gettext (Text)
|       |                           ^~~~
| ../git/w.c:269:25: note: format string is defined here
|   269 |    fprintf(fout, _(" %2lu:%02um"), t / 60, (unsigned)t % 60);
|       |                      ~~~^
|       |                         |
|       |                         long unsigned int
|       |                      %2llu
| In file included from ../git/w.c:29:
| ../git/w.c:275:20: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time_t' {aka 'long long int'} [-Wformat=]
|   275 |    fprintf(fout, _(" %2ludays"), t / (24 * 60 * 60));
|       |                    ^~~~~~~~~~~
| ../git/include/nls.h:25:27: note: in definition of macro '_'
|    25 | # define _(Text) gettext (Text)
|       |                           ^~~~
| ../git/w.c:275:25: note: format string is defined here
|   275 |    fprintf(fout, _(" %2ludays"), t / (24 * 60 * 60));
|       |                      ~~~^
|       |                         |
|       |                         long unsigned int
|       |                      %2llu
| In file included from ../git/w.c:29:
| ../git/w.c:279:20: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time_t' {aka 'long long int'} [-Wformat=]
|   279 |    fprintf(fout, _(" %2lu:%02um"), t / (60 * 60),
|       |                    ^~~~~~~~~~~~~
| ../git/include/nls.h:25:27: note: in definition of macro '_'
|    25 | # define _(Text) gettext (Text)
|       |                           ^~~~
| ../git/w.c:279:25: note: format string is defined here
|   279 |    fprintf(fout, _(" %2lu:%02um"), t / (60 * 60),
|       |                      ~~~^
|       |                         |
|       |                         long unsigned int
|       |                      %2llu
| ../git/w.c:284:23: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time_t' {aka 'long long int'} [-Wformat=]
|   284 |    fprintf(fout, " %2lu:%02u ", t / 60, (unsigned)t % 60);
|       |                    ~~~^         ~~~~~~
|       |                       |           |
|       |                       |           time_t {aka long long int}
|       |                       long unsigned int
|       |                    %2llu
| In file included from ../git/w.c:29:
| ../git/w.c:287:20: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time_t' {aka 'long long int'} [-Wformat=]
|   287 |    fprintf(fout, _(" %2lu.%02us"), t, centi_sec);
|       |                    ^~~~~~~~~~~~~
| ../git/include/nls.h:25:27: note: in definition of macro '_'
|    25 | # define _(Text) gettext (Text)
|       |                           ^~~~
| ../git/w.c:287:25: note: format string is defined here
|   287 |    fprintf(fout, _(" %2lu.%02us"), t, centi_sec);
|       |                      ~~~^
|       |                         |
|       |                         long unsigned int
|       |                      %2llu
| ../git/w.c: In function 'getproc':
| ../git/w.c:78:22: error: '__UT_NAMESIZE' undeclared (first use in this function); did you mean 'UT_NAMESIZE'?
|    78 | # define UT_NAMESIZE __UT_NAMESIZE
|       |                      ^~~~~~~~~~~~~
| ../git/w.c:357:12: note: in expansion of macro 'UT_NAMESIZE'
|   357 |   char buf[UT_NAMESIZE + 1];
|       |            ^~~~~~~~~~~
| ../git/w.c: In function 'showinfo':
| ../git/w.c:78:22: error: '__UT_NAMESIZE' undeclared (first use in this function); did you mean 'UT_NAMESIZE'?
|    78 | # define UT_NAMESIZE __UT_NAMESIZE
|       |                      ^~~~~~~~~~~~~
| ../git/w.c:402:13: note: in expansion of macro 'UT_NAMESIZE'
|   402 |  char uname[UT_NAMESIZE + 1] = "", tty[5 + UT_LINESIZE + 1] = "/dev/";
|       |             ^~~~~~~~~~~
| ../git/w.c:77:22: error: '__UT_LINESIZE' undeclared (first use in this function); did you mean 'UT_LINESIZE'?
|    77 | # define UT_LINESIZE __UT_LINESIZE
|       |                      ^~~~~~~~~~~~~
| ../git/w.c:402:44: note: in expansion of macro 'UT_LINESIZE'
|   402 |  char uname[UT_NAMESIZE + 1] = "", tty[5 + UT_LINESIZE + 1] = "/dev/";
|       |                                            ^~~~~~~~~~~
| ../git/w.c: In function 'main':
| ../git/w.c:78:22: error: '__UT_NAMESIZE' undeclared (first use in this function); did you mean 'UT_NAMESIZE'?
|    78 | # define UT_NAMESIZE __UT_NAMESIZE
|       |                      ^~~~~~~~~~~~~
| ../git/w.c:576:21: note: in expansion of macro 'UT_NAMESIZE'
|   576 |   int ut_namesize = UT_NAMESIZE;
|       |                     ^~~~~~~~~~~
| ../git/w.c:76:22: error: '__UT_HOSTSIZE' undeclared (first use in this function); did you mean 'UT_HOSTSIZE'?
|    76 | # define UT_HOSTSIZE __UT_HOSTSIZE
|       |                      ^~~~~~~~~~~~~
| ../git/w.c:588:22: note: in expansion of macro 'UT_HOSTSIZE'
|   588 |   if (fromlen < 8 || UT_HOSTSIZE < fromlen) {
|       |                      ^~~~~~~~~~~
| Makefile:1552: recipe for target 'w.o' failed
| make[2]: *** [w.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/pwcache.c  -fPIC -DPIC -o proc/.libs/pwcache.o
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/sig.c  -fPIC -DPIC -o proc/.libs/sig.o
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/whattime.c  -fPIC -DPIC -o proc/.libs/whattime.o
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/alloc.c  -fPIC -DPIC -o proc/.libs/alloc.o
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/wchan.c  -fPIC -DPIC -o proc/.libs/wchan.o
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/readproc.c  -fPIC -DPIC -o proc/.libs/readproc.o
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/sysinfo.c  -fPIC -DPIC -o proc/.libs/sysinfo.o
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/devname.c  -fPIC -DPIC -o proc/.libs/devname.o
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/numa.c  -fPIC -DPIC -o proc/.libs/numa.o
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/escape.c  -fPIC -DPIC -o proc/.libs/escape.o
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/slab.c  -fPIC -DPIC -o proc/.libs/slab.o
| i686-poky-linux-musl-libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -include ./config.h -I../git -I../git/include -Wno-unused-result -DLOCALEDIR=\"/usr/share/locale\" -Iproc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0=/usr/src/debug/procps/3.3.17-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybu
 ild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/recipe-sysroot-native= -c ../git/proc/version.c  -fPIC -DPIC -o proc/.libs/version.o
| ../git/proc/escape.c: In function 'escaped_copy':
| ../git/proc/escape.c:237:18: warning: implicit declaration of function 'nl_langinfo' [-Wimplicit-function-declaration]
|   237 |      char *enc = nl_langinfo(CODESET);
|       |                  ^~~~~~~~~~~
| ../git/proc/escape.c:237:30: error: 'CODESET' undeclared (first use in this function)
|   237 |      char *enc = nl_langinfo(CODESET);
|       |                              ^~~~~~~
| ../git/proc/escape.c:237:30: note: each undeclared identifier is reported only once for each function it appears in
| Makefile:1568: recipe for target 'proc/escape.lo' failed
| make[2]: *** [proc/escape.lo] Error 1
| ../git/proc/readproc.c: In function 'simple_nextpid':
| ../git/proc/readproc.c:1242:38: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size 58 [-Wformat-truncation=]
|  1242 |   snprintf(path, PROCPATHLEN, "/proc/%s", ent->d_name);
|       |                                      ^~
| ../git/proc/readproc.c:1242:3: note: 'snprintf' output between 7 and 262 bytes into a destination of size 64
|  1242 |   snprintf(path, PROCPATHLEN, "/proc/%s", ent->d_name);
|       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../git/proc/sysinfo.c: In function 'getstat':
| ../git/proc/sysinfo.c:491:41: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size 26 [-Wformat-truncation=]
|   491 |     snprintf(tbuf, sizeof(tbuf), "/proc/%s/stat", ent->d_name);
|       |                                         ^~
| ../git/proc/sysinfo.c:491:5: note: 'snprintf' output between 12 and 267 bytes into a destination of size 32
|   491 |     snprintf(tbuf, sizeof(tbuf), "/proc/%s/stat", ent->d_name);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../git/proc/readproc.c: In function 'simple_nexttid':
| ../git/proc/readproc.c:1269:46: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 41 and 51 [-Wformat-truncation=]
|  1269 |   snprintf(path, PROCPATHLEN, "/proc/%d/task/%s", p->tgid, ent->d_name);
|       |                                              ^~
| ../git/proc/readproc.c:1269:3: note: 'snprintf' output between 14 and 279 bytes into a destination of size 64
|  1269 |   snprintf(path, PROCPATHLEN, "/proc/%d/task/%s", p->tgid, ent->d_name);
|       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../git/top/top.c: In function 'capsmk.part.0':
| ../git/top/top.c:839:55: warning: '%s' directive output may be truncated writing up to 31 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
|   839 |       snprintf(Caps_endline, sizeof(Caps_endline), "%s%s", Caps_off, Cap_clr_eol);
|       |                                                       ^~             ~~~~~~~~~~~
| ../git/top/top.c:839:7: note: 'snprintf' output between 1 and 63 bytes into a destination of size 32
|   839 |       snprintf(Caps_endline, sizeof(Caps_endline), "%s%s", Caps_off, Cap_clr_eol);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../git/top/top.c:872:62: warning: '%s' directive output may be truncated writing up to 31 bytes into a region of size between 1 and 64 [-Wformat-truncation=]
|   872 |    snprintf(q->capclr_rowhigh, sizeof(q->capclr_rowhigh), "%s%s"
|       |                                                              ^~
| ../git/top/top.c:872:4: note: 'snprintf' output between 1 and 95 bytes into a destination of size 64
|   872 |    snprintf(q->capclr_rowhigh, sizeof(q->capclr_rowhigh), "%s%s"
|       |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|   873 |       , q->capclr_rownorm, CHKw(q, Show_HIBOLD) ? q->cap_bold : Cap_reverse);
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../git/top/top.c: In function 'keys_window':
| ../git/top/top.c:4423:55: warning: '%s' directive output may be truncated writing up to 127 bytes into a region of size 4 [-Wformat-truncation=]
|  4423 |       snprintf(q->rc.winname, sizeof(q->rc.winname), "%s", name);
|       |                                                       ^~
| ......
|  5578 |             if (tmp[0] && tmp[0] != kbd_ESC) win_names(w, tmp);
|       |                                                           ~~~
| ../git/top/top.c:4423:7: note: 'snprintf' output between 1 and 128 bytes into a destination of size 4
|  4423 |       snprintf(q->rc.winname, sizeof(q->rc.winname), "%s", name);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../git/top/top.c:4424:49: warning: '%s' directive output may be truncated writing up to 127 bytes into a region of size between 0 and 4 [-Wformat-truncation=]
|  4424 |    snprintf(q->grpname, sizeof(q->grpname), "%d:%s", q->winnum, name);
|       |                                                 ^~
| ......
|  5578 |             if (tmp[0] && tmp[0] != kbd_ESC) win_names(w, tmp);
|       |                                                           ~~~
| ../git/top/top.c:4424:4: note: 'snprintf' output between 3 and 140 bytes into a destination of size 6
|  4424 |    snprintf(q->grpname, sizeof(q->grpname), "%d:%s", q->winnum, name);
|       |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build'
| Makefile:1888: recipe for target 'all-recursive' failed
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/procps/3.3.17-r0/build'
| Makefile:1056: recipe for target 'all' failed
| make: *** [all] Error 2
| WARNING: exit code 1 from a shell command.
| 
NOTE: recipe procps-3.3.17-r0: task do_compile: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2103 tasks of which 2084 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============0786135403310436439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/procps/procps-locale-zh-cn: PKGSIZE changed from 4220 to 13746 (+226%)
Changes to packages/core2-32-poky-linux/procps (sysroot):
  /usr/lib/libprocps.so.8 changed symlink target from libprocps.so.8.0.2 to libprocps.so.8.0.3
  /usr/lib/libprocps.so changed symlink target from libprocps.so.8.0.2 to libprocps.so.8.0.3
  /usr/lib/libprocps.so.8.0.2 moved to /usr/lib/libprocps.so.8.0.3

--===============0786135403310436439==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-procps-upgrade-3.3.16-3.3.17.patch"

From a158b9b46fd72c135f1f690fe037f68cf2245c75 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 23:22:32 +0000
Subject: [PATCH] procps: upgrade 3.3.16 -> 3.3.17

---
 .../procps/{procps_3.3.16.bb => procps_3.3.17.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/procps/{procps_3.3.16.bb => procps_3.3.17.bb} (97%)

diff --git a/meta/recipes-extended/procps/procps_3.3.16.bb b/meta/recipes-extended/procps/procps_3.3.17.bb
similarity index 97%
rename from meta/recipes-extended/procps/procps_3.3.16.bb
rename to meta/recipes-extended/procps/procps_3.3.17.bb
index ef3ac86e97..6e6b932ee3 100644
--- a/meta/recipes-extended/procps/procps_3.3.16.bb
+++ b/meta/recipes-extended/procps/procps_3.3.17.bb
@@ -15,7 +15,7 @@ inherit autotools gettext pkgconfig update-alternatives
 SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https \
            file://sysctl.conf \
            "
-SRCREV = "59c88e18f29000ceaf7e5f98181b07be443cf12f"
+SRCREV = "19a508ea121c0c4ac6d0224575a036de745eaaf8"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


--===============0786135403310436439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/procps: PV changed from "3.3.16" to "3.3.17"
packages/core2-32-poky-linux/procps: PKGV changed from 3.3.16 [default] to 3.3.17 [default]
packages/core2-32-poky-linux/procps/procps-dbg: PV changed from "3.3.16" to "3.3.17"
packages/core2-32-poky-linux/procps/procps-dbg: PKGV changed from 3.3.16 [default] to 3.3.17 [default]
packages/core2-32-poky-linux/procps/procps-dbg: PKGSIZE changed from 1449176 to 1556664 (+7%)
packages/core2-32-poky-linux/procps/procps-dev: PV changed from "3.3.16" to "3.3.17"
packages/core2-32-poky-linux/procps/procps-dev: PKGV changed from 3.3.16 [default] to 3.3.17 [default]
packages/core2-32-poky-linux/procps/procps-dev: PKGSIZE changed from 31092 to 31098 (+0%)
packages/core2-32-poky-linux/procps/procps-doc: PV changed from "3.3.16" to "3.3.17"
packages/core2-32-poky-linux/procps/procps-doc: PKGV changed from 3.3.16 [default] to 3.3.17 [default]
packages/core2-32-poky-linux/procps/procps-doc: PKGSIZE changed from 249322 to 253603 (+2%)
packages/core2-32-poky-linux/procps/procps-lib: PV changed from "3.3.16" to "3.3.17"
packages/core2-32-poky-linux/procps/procps-lib: PKGV changed from 3.3.16 [default] to 3.3.17 [default]
packages/core2-32-poky-linux/procps/procps-locale-de: PV changed from "3.3.16" to "3.3.17"
packages/core2-32-poky-linux/procps/procps-locale-de: PKGV changed from 3.3.16 [default] to 3.3.17 [default]
packages/core2-32-poky-linux/procps/procps-locale-de: PKGSIZE changed from 72289 to 74256 (+3%)
packages/core2-32-poky-linux/procps/procps-locale-fr: PV changed from "3.3.16" to "3.3.17"
packages/core2-32-poky-linux/procps/procps-locale-fr: PKGV changed from 3.3.16 [default] to 3.3.17 [default]
packages/core2-32-poky-linux/procps/procps-locale-fr: PKGSIZE changed from 90669 to 92408 (+2%)
packages/core2-32-poky-linux/procps/procps-locale-pl: PV changed from "3.3.16" to "3.3.17"
packages/core2-32-poky-linux/procps/procps-locale-pl: PKGV changed from 3.3.16 [default] to 3.3.17 [default]
packages/core2-32-poky-linux/procps/procps-locale-pl: PKGSIZE changed from 89382 to 91217 (+2%)
packages/core2-32-poky-linux/procps/procps-locale-pt-br: PV changed from "3.3.16" to "3.3.17"
packages/core2-32-poky-linux/procps/procps-locale-pt-br: PKGV changed from 3.3.16 [default] to 3.3.17 [default]
packages/core2-32-poky-linux/procps/procps-locale-pt-br: PKGSIZE changed from 88182 to 83236 (-6%)
packages/core2-32-poky-linux/procps/procps-locale-sv: PV changed from "3.3.16" to "3.3.17"
packages/core2-32-poky-linux/procps/procps-locale-sv: PKGV changed from 3.3.16 [default] to 3.3.17 [default]
packages/core2-32-poky-linux/procps/procps-locale-sv: PKGSIZE changed from 87151 to 88888 (+2%)
packages/core2-32-poky-linux/procps/procps-locale-uk: PV changed from "3.3.16" to "3.3.17"
packages/core2-32-poky-linux/procps/procps-locale-uk: PKGV changed from 3.3.16 [default] to 3.3.17 [default]
packages/core2-32-poky-linux/procps/procps-locale-uk: PKGSIZE changed from 114779 to 117160 (+2%)
packages/core2-32-poky-linux/procps/procps-locale-vi: PV changed from "3.3.16" to "3.3.17"
packages/core2-32-poky-linux/procps/procps-locale-vi: PKGV changed from 3.3.16 [default] to 3.3.17 [default]
packages/core2-32-poky-linux/procps/procps-locale-vi: PKGSIZE changed from 83335 to 81598 (-2%)
packages/core2-32-poky-linux/procps/procps-locale-zh-cn: PV changed from "3.3.16" to "3.3.17"
packages/core2-32-poky-linux/procps/procps-locale-zh-cn: PKGV changed from 3.3.16 [default] to 3.3.17 [default]
packages/core2-32-poky-linux/procps/procps-locale-zh-cn: PKGSIZE changed from 4220 to 13746 (+226%)
packages/core2-32-poky-linux/procps/procps-ps: PV changed from "3.3.16" to "3.3.17"
packages/core2-32-poky-linux/procps/procps-ps: PKGV changed from 3.3.16 [default] to 3.3.17 [default]
packages/core2-32-poky-linux/procps/procps-src: PV changed from "3.3.16" to "3.3.17"
packages/core2-32-poky-linux/procps/procps-src: PKGV changed from 3.3.16 [default] to 3.3.17 [default]
packages/core2-32-poky-linux/procps/procps-src: PKGSIZE changed from 939494 to 956917 (+2%)
packages/core2-32-poky-linux/procps/procps-staticdev: PV changed from "3.3.16" to "3.3.17"
packages/core2-32-poky-linux/procps/procps-staticdev: PKGV changed from 3.3.16 [default] to 3.3.17 [default]
packages/core2-32-poky-linux/procps/procps-sysctl: PV changed from "3.3.16" to "3.3.17"
packages/core2-32-poky-linux/procps/procps-sysctl: PKGV changed from 3.3.16 [default] to 3.3.17 [default]
packages/core2-32-poky-linux/procps/procps: PV changed from "3.3.16" to "3.3.17"
packages/core2-32-poky-linux/procps/procps: PKGV changed from 3.3.16 [default] to 3.3.17 [default]
packages/core2-32-poky-linux/procps/procps: PKGSIZE changed from 481176 to 511364 (+6%)
Changes to packages/core2-32-poky-linux/procps (sysroot):
  /usr/lib/libprocps.so.8 changed symlink target from libprocps.so.8.0.2 to libprocps.so.8.0.3
  /usr/lib/libprocps.so changed symlink target from libprocps.so.8.0.2 to libprocps.so.8.0.3
  /usr/lib/libprocps.so.8.0.2 moved to /usr/lib/libprocps.so.8.0.3

--===============0786135403310436439==--
