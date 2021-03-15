Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.323.1615826520516792893
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 1597538C11C9
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:00 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 247.4 FAILED
Message-ID: <MADEUP.166C91A8D8AB48A7.29771@lists.openembedded.org>
X-Groupsio-MsgNum: 149474
Content-Type: multipart/mixed; boundary="===============7256681520808826173=="

--===============7256681520808826173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *247.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-systemd-boot-upgrade-247.3-247.4.patch
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

--===============7256681520808826173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 41 skipped, 0 masked, 0 errors.
Removing 94 recipes from the core2-32 sysroot...done.
Removing 99 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-2a8800f70fb88f47242463d44fd0b03dd6e97d27"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2a8800f70fb88f47242463d44fd0b03dd6e97d27"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 492 Local 439 Network 0 Missed 53 Current 197 (89% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 199 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 200 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 203 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 205 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 211 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 245 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 255 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 256 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 271 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1j-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 276 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 277 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 279 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 280 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 282 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 285 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 286 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 289 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 290 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 294 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 295 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 296 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 297 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 298 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 299 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 300 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 301 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 302 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 303 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 304 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 305 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssl-1.1.1j-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 307 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 308 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 310 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 311 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 312 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 313 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 314 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 315 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 316 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 317 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 318 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 319 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 320 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 321 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 322 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 323 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 326 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 328 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 329 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 331 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 336 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 338 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 339 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_package_write_rpm_setscene)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 344 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 351 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 352 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 353 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 354 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 364 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 365 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 370 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 371 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 376 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 377 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 381 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 387 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_deploy_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 391 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 392 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 393 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 395 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 396 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 398 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 399 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 400 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 401 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 402 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_package_write_rpm_setscene)
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 403 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 404 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 405 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 406 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 417 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 426 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_deploy_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 429 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 431 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 434 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 438 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 443 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_setscene: Started
NOTE: Running setscene task 453 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 458 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 464 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 469 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 470 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 550 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: Running task 576 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_fetch)
NOTE: Running task 584 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_fetch)
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 593 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_fetch)
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_setscene: Succeeded
NOTE: Running setscene task 476 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 479 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 481 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 483 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 663 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_warn_musl)
NOTE: Running task 664 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_write_config)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: Running task 687 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_write_config)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 722 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_fetch)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 749 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_fetch)
NOTE: Running task 762 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 763 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 774 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_fetch)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 791 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_fetch)
NOTE: Running task 792 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_fetch)
NOTE: Running task 795 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 796 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_fetch)
NOTE: recipe dbus-1.12.20-r0: task do_fetch: Started
NOTE: Running task 814 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_fetch)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_fetch: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_fetch: Started
NOTE: Running task 834 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_unpack)
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 870 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_write_config)
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 496 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_setscene)
NOTE: Running task 935 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 500 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_247.3-r0: task do_warn_musl: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
WARNING: systemd-1_247.3-r0 do_warn_musl: Using systemd with musl is not recommended since it is not supported upstream and some patches are known to be problematic.
NOTE: recipe systemd-1_247.3-r0: task do_warn_musl: Succeeded
NOTE: recipe gnu-efi-3.0.12-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_write_config: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_fetch: Succeeded
NOTE: Running setscene task 502 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 503 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1021 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_unpack)
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_fetch: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_fetch: Succeeded
NOTE: recipe gnu-efi-3.0.12-r0: task do_fetch: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_write_config: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_fetch: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_fetch: Started
NOTE: Running setscene task 506 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 510 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1035 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 513 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 515 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 517 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-boot-247.4-r0: task do_fetch: Started
NOTE: Running task 1044 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_unpack)
NOTE: Running task 1045 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_unpack)
NOTE: Running task 1046 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_unpack)
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_fetch: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_write_config: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 520 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_247.3-r0: task do_write_config: Succeeded
NOTE: recipe systemd-boot-247.4-r0: task do_fetch: Succeeded
NOTE: Running task 1047 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_unpack)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_fetch: Started
NOTE: Running task 1048 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1049 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_unpack)
NOTE: Running task 1050 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_unpack)
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_fetch: Succeeded
NOTE: Running task 1055 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_unpack: Started
NOTE: Running task 1056 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe systemd-boot-247.4-r0: task do_write_config: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_unpack: Started
NOTE: recipe systemd-boot-247.4-r0: task do_write_config: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-boot-247.4-r0: task do_unpack: Started
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_unpack: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1057 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_patch)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_unpack: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1058 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_patch)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_unpack: Started
NOTE: Running setscene task 524 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 526 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 528 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 529 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 530 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 531 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe systemd-1_247.3-r0: task do_unpack: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 1067 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_patch)
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 534 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1068 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_patch)
NOTE: recipe systemd-bootconf-1.00-r0: task do_patch: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1077 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_patch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_unpack: Succeeded
NOTE: Running task 1078 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_patch)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 536 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 538 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnu-efi-3.0.12-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1079 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Started
NOTE: Running setscene task 542 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1089 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running setscene task 544 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 545 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_patch: Started
NOTE: Running setscene task 548 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe procps-3.3.16-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_patch: Succeeded
NOTE: Running task 1090 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 550 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1095 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 554 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 555 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 557 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1110 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_patch: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-boot-247.4-r0: task do_unpack: Succeeded
NOTE: Running task 1121 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnu-efi-3.0.12-r0: task do_patch: Succeeded
NOTE: Running task 1132 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1137 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-boot-247.4-r0: task do_patch: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_patch: Succeeded
NOTE: recipe gnu-efi-3.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 562 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-boot-247.4-r0: task do_patch: Succeeded
NOTE: Running task 1144 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_deploy_source_date_epoch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1145 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_populate_lic)
NOTE: recipe gnu-efi-3.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_unpack: Succeeded
NOTE: Running task 1146 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_patch)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-boot-247.4-r0: task do_populate_lic: Started
NOTE: recipe systemd-boot-247.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1155 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe systemd-boot-247.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_populate_lic unihash changed to ed2f21a0dc6aaac465636cc78369ca53b0294460a51cabff050275d1d8d0afb0
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-boot-247.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-1.1.1j-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 573 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 575 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.9.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 577 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 580 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 581 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 582 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 584 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running task 1156 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_patch)
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1j-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1j-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_patch: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 594 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 595 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.9.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 598 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 600 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 603 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1j-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 604 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-1.1.1j-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 605 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1j-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 606 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1201 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
ERROR: systemd-1_247.3-r0 do_patch: Command Error: 'quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/systemd/1_247.3-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
stdout: Applying patch 0006-Include-netinet-if_ether.h.patch
patching file src/libsystemd-network/sd-dhcp6-client.c
patching file src/libsystemd/sd-netlink/netlink-types.c
patching file src/machine/machine-dbus.c
patching file src/network/netdev/bond.c
patching file src/network/netdev/bridge.c
patching file src/network/netdev/macsec.c
patching file src/network/netdev/netdev-gperf.gperf
patching file src/network/netdev/netdev.c
patching file src/network/networkd-brvlan.c
patching file src/network/networkd-dhcp-common.c
patching file src/network/networkd-dhcp-server.c
patching file src/network/networkd-dhcp4.c
patching file src/network/networkd-dhcp6.c
patching file src/network/networkd-link.c
patching file src/network/networkd-network.c
patching file src/network/networkd-route.c
patching file src/network/test-network-tables.c
patching file src/shared/ethtool-util.c
patching file src/shared/ethtool-util.h
patching file src/udev/net/link-config.c
patching file src/udev/udev-builtin-net_setup_link.c
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file src/udev/udev-builtin-net_setup_link.c
Patch 0006-Include-netinet-if_ether.h.patch does not apply (enforce with -f)

stderr: 
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/systemd/1_247.3-r0/temp/log.do_patch.18354
NOTE: recipe systemd-1_247.3-r0: task do_patch: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_patch) failed with exit code '1'
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_setscene: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_setscene: Succeeded
NOTE: Tasks Summary: Attempted 1201 tasks of which 1150 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_patch
Summary: There was 1 WARNING message shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============7256681520808826173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/systemd-boot: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd-boot: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-dbg: PKGSIZE changed from 61147104 to 61145736 (-0%)
packages/core2-32-poky-linux/systemd/systemd-dev: PKGSIZE changed from 145290 to 145315 (+0%)
packages/core2-32-poky-linux/systemd/systemd-src: PKGSIZE changed from 17899477 to 17898551 (-0%)
packages/core2-32-poky-linux/systemd/systemd: PKGSIZE changed from 9929771 to 9922910 (-0%)
packages/core2-32-poky-linux/systemd/udev: PKGSIZE changed from 1972495 to 1976449 (+0%)

--===============7256681520808826173==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-systemd-boot-upgrade-247.3-247.4.patch"

From 1a67725e9f3ad71e2f1bdd667cbff7bbcd2e9ab6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 03:41:25 +0000
Subject: [PATCH] systemd-boot: upgrade 247.3 -> 247.4

---
 .../systemd/{systemd-boot_247.3.bb => systemd-boot_247.4.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_247.3.bb => systemd-boot_247.4.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_247.3.bb b/meta/recipes-core/systemd/systemd-boot_247.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_247.3.bb
rename to meta/recipes-core/systemd/systemd-boot_247.4.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index ccff8c8b9e..098bca98f1 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "551dd873b0bdfb9e7e47431b2933c8b910228f0c"
+SRCREV = "069525e84a67375e27429cb490e8d28af78e673a"
 SRCBRANCH = "v247-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
-- 
2.17.1


--===============7256681520808826173==
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
DISTRO_VERSION       = "3.2+snapshot-2a8800f70fb88f47242463d44fd0b03dd6e97d27"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2a8800f70fb88f47242463d44fd0b03dd6e97d27"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 52 Local 0 Network 0 Missed 52 Current 626 (0% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1001 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_fetch)
NOTE: Running task 1099 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe systemd-1_247.3-r0: task do_fetch: Started
NOTE: recipe systemd-1_247.3-r0: task do_fetch: Succeeded
NOTE: Running task 1101 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_unpack)
NOTE: Running task 1437 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_fetch)
NOTE: Running task 1512 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_fetch)
NOTE: Running task 1564 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_fetch)
NOTE: Running task 1682 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_write_config)
NOTE: recipe systemd-1_247.3-r0: task do_unpack: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_fetch: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_fetch: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_fetch: Started
NOTE: Running task 1944 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_unpack)
NOTE: Running task 1945 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-boot-247.4-r0: task do_fetch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_fetch: Succeeded
NOTE: Running task 1963 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_unpack)
NOTE: Running task 1964 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-boot-247.4-r0: task do_write_config: Started
NOTE: recipe systemd-boot-247.4-r0: task do_write_config: Succeeded
NOTE: recipe gnu-efi-3.0.12-r0: task do_unpack: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_unpack: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_unpack: Succeeded
NOTE: Running task 2053 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_patch)
NOTE: recipe gnu-efi-3.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 2054 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_patch)
NOTE: recipe systemd-bootconf-1.00-r0: task do_patch: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_patch: Succeeded
NOTE: Running task 2055 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_deploy_source_date_epoch)
NOTE: recipe gnu-efi-3.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_patch: Succeeded
NOTE: Running task 2056 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2057 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2058 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe systemd-boot-247.4-r0: task do_fetch: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2059 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_unpack)
NOTE: Running task 2060 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_configure)
NOTE: recipe systemd-1_247.3-r0: task do_unpack: Succeeded
NOTE: recipe gnu-efi-3.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2061 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe systemd-boot-247.4-r0: task do_unpack: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_configure: Succeeded
NOTE: Running task 2062 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_compile)
NOTE: recipe gnu-efi-3.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2063 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_configure)
NOTE: recipe systemd-1_247.3-r0: task do_patch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_compile: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_configure: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_compile: Succeeded
NOTE: Running task 2064 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 81a8fc4714d5e3078725ea52621d5cb3338ee3fac13e562738f12dc54f636770
NOTE: Running task 2065 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnu-efi-3.0.12-r0: task do_configure: Succeeded
NOTE: Running task 2066 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_compile)
NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_compile: Started
NOTE: recipe systemd-1_247.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Succeeded
NOTE: Running task 2067 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_package)
WARNING: systemd-1_247.3-r0 do_patch: Fuzz detected:

Applying patch 0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
patching file src/core/systemd.pc.in
Hunk #1 succeeded at 65 with fuzz 1.


The context lines in the patches can be updated with devtool:

    devtool modify systemd
    devtool finish --force-patch-refresh systemd <layer_path>

Don't forget to review changes done by devtool!

WARNING: systemd-1_247.3-r0 do_patch: QA Issue: Patch log indicates that patches do not apply cleanly. [patch-fuzz]
NOTE: recipe systemd-1_247.3-r0: task do_patch: Succeeded
NOTE: Running task 2068 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2069 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe systemd-boot-247.4-r0: task do_unpack: Succeeded
NOTE: Running task 2070 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_patch)
NOTE: recipe systemd-bootconf-1.00-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe systemd-1_247.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-boot-247.4-r0: task do_patch: Started
NOTE: recipe systemd-1_247.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2071 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_configure)
NOTE: recipe systemd-boot-247.4-r0: task do_patch: Succeeded
NOTE: Running task 2072 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2073 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_populate_lic)
NOTE: recipe gnu-efi-3.0.12-r0: task do_compile: Succeeded
NOTE: Running task 2074 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0035619123a81c38302d981de40f05297df401876f3fad665b331ce08c59cb24
NOTE: Setscene tasks completed
NOTE: Running task 2075 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe systemd-boot-247.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-boot-247.4-r0: task do_populate_lic: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_install: Started
NOTE: recipe systemd-1_247.3-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe systemd-boot-247.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_populate_lic unihash changed to ed2f21a0dc6aaac465636cc78369ca53b0294460a51cabff050275d1d8d0afb0
NOTE: recipe systemd-boot-247.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gnu-efi-3.0.12-r0: task do_install: Succeeded
NOTE: Running task 2077 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_populate_sysroot)
NOTE: Running task 2078 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_package)
NOTE: recipe systemd-bootconf-1.00-r0: task do_package: Succeeded
NOTE: Running task 2079 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_packagedata)
NOTE: recipe gnu-efi-3.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_package: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_packagedata: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2080 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-bootconf-1.00-r0: task do_packagedata: Succeeded
NOTE: Running task 2081 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_package_write_rpm)
NOTE: recipe systemd-boot-247.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-boot-247.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2082 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_configure)
NOTE: recipe systemd-bootconf-1.00-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-boot-247.4-r0: task do_configure: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_package: Succeeded
NOTE: Running task 2083 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_packagedata)
NOTE: recipe gnu-efi-3.0.12-r0: task do_packagedata: Started
ERROR: gnu-efi-3.0.12-r0 do_packagedata: QA Issue: Package version for package gnu-efi-src went backwards which would break package feeds (from 0:3.0.13-r0 to 0:3.0.12-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.12-r0 do_packagedata: QA Issue: Package version for package gnu-efi-dbg went backwards which would break package feeds (from 0:3.0.13-r0 to 0:3.0.12-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.12-r0 do_packagedata: QA Issue: Package version for package gnu-efi-staticdev went backwards which would break package feeds (from 0:3.0.13-r0 to 0:3.0.12-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.12-r0 do_packagedata: QA Issue: Package version for package gnu-efi-dev went backwards which would break package feeds (from 0:3.0.13-r0 to 0:3.0.12-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.12-r0 do_packagedata: QA Issue: Package version for package gnu-efi-doc went backwards which would break package feeds (from 0:3.0.13-r0 to 0:3.0.12-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.12-r0 do_packagedata: QA Issue: Package version for package gnu-efi-locale went backwards which would break package feeds (from 0:3.0.13-r0 to 0:3.0.12-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.12-r0 do_packagedata: QA Issue: Package version for package gnu-efi went backwards which would break package feeds (from 0:3.0.13-r0 to 0:3.0.12-r0) [version-going-backwards]
NOTE: recipe gnu-efi-3.0.12-r0: task do_packagedata: Succeeded
NOTE: Running task 2084 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_package_write_rpm)
NOTE: recipe gnu-efi-3.0.12-r0: task do_package_write_rpm: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_configure: Succeeded
NOTE: Running task 2085 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_compile)
NOTE: recipe systemd-1_247.3-r0: task do_compile: Started
NOTE: recipe systemd-boot-247.4-r0: task do_configure: Succeeded
NOTE: Running task 2086 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_compile)
NOTE: recipe systemd-boot-247.4-r0: task do_compile: Started
NOTE: recipe systemd-boot-247.4-r0: task do_compile: Succeeded
NOTE: Running task 2087 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_install)
NOTE: Running task 2088 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_deploy)
NOTE: recipe systemd-boot-247.4-r0: task do_deploy: Started
NOTE: recipe systemd-boot-247.4-r0: task do_install: Started
NOTE: recipe systemd-boot-247.4-r0: task do_install: Succeeded
NOTE: Running task 2089 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_package)
NOTE: Running task 2090 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_populate_sysroot)
NOTE: recipe systemd-boot-247.4-r0: task do_deploy: Succeeded
NOTE: recipe systemd-boot-247.4-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-boot-247.4-r0: task do_package: Started
NOTE: recipe systemd-boot-247.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-boot-247.4-r0: task do_package: Succeeded
NOTE: Running task 2091 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_packagedata)
NOTE: recipe systemd-boot-247.4-r0: task do_packagedata: Started
NOTE: recipe systemd-boot-247.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2092 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_package_write_rpm)
NOTE: Running task 2093 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_package_qa)
NOTE: recipe systemd-boot-247.4-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-boot-247.4-r0: task do_package_qa: Started
NOTE: recipe systemd-boot-247.4-r0: task do_package_qa: Succeeded
NOTE: recipe systemd-boot-247.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_compile: Succeeded
NOTE: Running task 2094 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_install)
NOTE: recipe systemd-1_247.3-r0: task do_install: Started
NOTE: recipe systemd-1_247.3-r0: task do_install: Succeeded
NOTE: Running task 2095 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_populate_sysroot)
NOTE: Running task 2096 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_package)
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_247.3-r0: task do_package: Started
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2097 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2098 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2099 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.12.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2100 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_configure)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2101 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_configure)
NOTE: recipe dbus-1.12.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2102 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_configure)
NOTE: recipe procps-3.3.16-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_configure: Started
NOTE: recipe dbus-1.12.20-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_configure: Succeeded
NOTE: Running task 2103 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_compile: Succeeded
NOTE: Running task 2104 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_install)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_install: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_install: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_package: Succeeded
NOTE: Running task 2105 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_packagedata)
NOTE: recipe systemd-1_247.3-r0: task do_packagedata: Started
NOTE: recipe systemd-1_247.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2106 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package)
NOTE: Running task 2107 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm unihash changed to 612839a7b79a329204e7cc3482ad0e0527b83dac8e1415cecdf2149b1c2b57d2
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package: Succeeded
NOTE: Running task 2108 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata unihash changed to da6fb855a5f699eb3a9892c668991e2dfb8e824b5aba328daa44e6ade9342112
NOTE: Setscene tasks completed
NOTE: Running task 2109 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm: Started
NOTE: recipe procps-3.3.16-r0: task do_configure: Succeeded
NOTE: Running task 2110 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_compile)
NOTE: recipe procps-3.3.16-r0: task do_compile: Started
NOTE: recipe procps-3.3.16-r0: task do_compile: Succeeded
NOTE: Running task 2111 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_install)
NOTE: recipe procps-3.3.16-r0: task do_install: Started
NOTE: recipe procps-3.3.16-r0: task do_install: Succeeded
NOTE: Running task 2112 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package)
NOTE: recipe procps-3.3.16-r0: task do_package: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm unihash changed to 536dc79c934a354644fd8435b0ac2e3bd1ed846b420a498de5a0659bf8466b60
NOTE: recipe procps-3.3.16-r0: task do_package: Succeeded
NOTE: Running task 2113 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata)
NOTE: recipe procps-3.3.16-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata unihash changed to 12a13009572f99dcccd80865a06a9ebc352e134859a615f02f4b26d775669a16
NOTE: Setscene tasks completed
NOTE: Running task 2115 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm unihash changed to 35040b26da7778fd48f89dc0bd3bd443b39d1eed740c03deffdb264ba4daed25
NOTE: recipe dbus-1.12.20-r0: task do_configure: Succeeded
NOTE: Running task 2117 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_compile)
NOTE: recipe dbus-1.12.20-r0: task do_compile: Started
NOTE: recipe dbus-1.12.20-r0: task do_compile: Succeeded
NOTE: Running task 2118 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_install)
NOTE: recipe dbus-1.12.20-r0: task do_install: Started
NOTE: recipe dbus-1.12.20-r0: task do_install: Succeeded
NOTE: Running task 2119 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot)
NOTE: Running task 2120 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.12.20-r0: task do_package: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2121 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2122 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_configure)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_configure: Started
NOTE: recipe dbus-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2123 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata unihash changed to 40c3bf9ffc25ec4a46f3a6c3c5a31f0f30e57b66a589879579ea80241d3b175b
NOTE: Setscene tasks completed
NOTE: Running task 2124 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_package_write_rpm)
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2125 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2126 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_compile)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_compile: Succeeded
NOTE: Running task 2127 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2128 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_install)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_install: Succeeded
NOTE: Running task 2129 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2130 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_populate_sysroot)
NOTE: Running task 2131 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_populate_sysroot unihash changed to 27f8575a76a40af119cf1d60f57ad55db02a892678bb9f3778964291721628c2
NOTE: Setscene tasks completed
NOTE: Running task 2132 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2134 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-test-1.12.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2138 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2139 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_configure)
NOTE: recipe dbus-test-1.12.20-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_configure: Succeeded
NOTE: Running task 2140 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_compile: Succeeded
NOTE: Running task 2141 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_install: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package: Succeeded
NOTE: Running task 2142 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2143 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: Running task 2144 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Succeeded
NOTE: Running task 2145 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata unihash changed to 69486db948540e3d37ac4f0f1e4ce8d9b70a2b780d089767f24ac08892fda340
NOTE: Setscene tasks completed
NOTE: Running task 2146 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm unihash changed to 7a5948873b2130a57380d36b81feaefb26bcd041a84b5fe4d596dd736c1ca359
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Succeeded
NOTE: Running task 2147 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata unihash changed to 4d5123d132171094d099a7df04e625d7965b421fc3c436234b1d367c28ca1d50
NOTE: Setscene tasks completed
NOTE: Running task 2148 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: Running task 2149 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_configure: Succeeded
NOTE: Running task 2150 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_configure_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2151 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_compile)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm unihash changed to d5bf5a7da01fb90534c6fb862482776525a455346c98427f5a91e78863d1bc68
NOTE: recipe dbus-test-1.12.20-r0: task do_compile: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_compile: Succeeded
NOTE: Running task 2152 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_compile_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2153 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_install)
NOTE: recipe dbus-test-1.12.20-r0: task do_install: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_install: Succeeded
NOTE: Running task 2154 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_install_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2155 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package)
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2156 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata unihash changed to ea6523564b4bd180055fe48d69550be6a1a497e5efe215ff8a89835b14e6c966
NOTE: Setscene tasks completed
NOTE: Running task 2157 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm)
NOTE: Running task 2158 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm unihash changed to da535b5c1d52c60fcd00e457c1e49333b3fd7f57ee8a41cd70acccb6328f2721
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm unihash changed to 1c92f2bc123f88b2a61d2e6df40b88dc6bdf453ad70b7754fe8665413c95e6fa
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm unihash changed to 8ccfc007c4540b56cb61d3604bdd526553094bba821edbfb82fb0a4ee9cd5823
NOTE: Running noexec task 2159 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2159 tasks of which 2048 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 2 WARNING messages shown.
Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============7256681520808826173==
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
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============7256681520808826173==
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
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============7256681520808826173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1438 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (812 cached, 2 parsed). 1438 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-2a8800f70fb88f47242463d44fd0b03dd6e97d27"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2a8800f70fb88f47242463d44fd0b03dd6e97d27"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 52 Local 0 Network 0 Missed 52 Current 626 (0% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1001 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_fetch)
NOTE: Running task 1099 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe systemd-1_247.3-r0: task do_fetch: Started
NOTE: recipe systemd-1_247.3-r0: task do_fetch: Succeeded
NOTE: Running task 1193 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_unpack)
NOTE: Running task 1437 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_fetch)
NOTE: Running task 1512 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_fetch)
NOTE: Running task 1564 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_fetch)
NOTE: Running task 1682 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_write_config)
NOTE: recipe systemd-1_247.3-r0: task do_unpack: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_fetch: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_fetch: Succeeded
NOTE: Running task 1842 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_unpack)
NOTE: Running task 1843 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-bootconf-1.00-r0: task do_fetch: Started
NOTE: recipe systemd-boot-247.4-r0: task do_fetch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_fetch: Succeeded
NOTE: Running task 1883 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_unpack)
NOTE: Running task 1884 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-boot-247.4-r0: task do_fetch: Succeeded
NOTE: Running task 1953 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_unpack)
NOTE: recipe systemd-boot-247.4-r0: task do_write_config: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_unpack: Started
NOTE: recipe systemd-boot-247.4-r0: task do_write_config: Succeeded
NOTE: recipe gnu-efi-3.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_unpack: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_unpack: Succeeded
NOTE: Running task 2054 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_patch)
NOTE: recipe systemd-boot-247.4-r0: task do_unpack: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 2055 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_patch)
NOTE: recipe systemd-bootconf-1.00-r0: task do_patch: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_patch: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_patch: Succeeded
NOTE: Running task 2056 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_patch: Succeeded
NOTE: Running task 2057 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-bootconf-1.00-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2058 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2059 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2060 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe systemd-1_247.3-r0: task do_unpack: Succeeded
NOTE: recipe gnu-efi-3.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2061 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_patch)
NOTE: recipe systemd-bootconf-1.00-r0: task do_configure: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_configure: Succeeded
NOTE: Running task 2062 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_compile: Started
NOTE: Running task 2063 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_configure)
NOTE: recipe systemd-1_247.3-r0: task do_patch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_compile: Succeeded
NOTE: Running task 2064 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_install)
NOTE: recipe gnu-efi-3.0.12-r0: task do_configure: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2065 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_compile)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to e8780c5889ba218f01b6e7f1a683b93d66d11d7ae1a19eb56e4c075f0c14297a
NOTE: Running task 2066 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Succeeded
NOTE: recipe gnu-efi-3.0.12-r0: task do_compile: Started
NOTE: Running task 2067 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_package)
NOTE: recipe systemd-boot-247.4-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2068 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_patch)
NOTE: recipe systemd-bootconf-1.00-r0: task do_package: Started
WARNING: systemd-1_247.3-r0 do_patch: Fuzz detected:

Applying patch 0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
patching file src/core/systemd.pc.in
Hunk #1 succeeded at 65 with fuzz 1.


The context lines in the patches can be updated with devtool:

    devtool modify systemd
    devtool finish --force-patch-refresh systemd <layer_path>

Don't forget to review changes done by devtool!

WARNING: systemd-1_247.3-r0 do_patch: QA Issue: Patch log indicates that patches do not apply cleanly. [patch-fuzz]
NOTE: recipe systemd-1_247.3-r0: task do_patch: Succeeded
NOTE: Running task 2069 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-boot-247.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2070 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe systemd-1_247.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-boot-247.4-r0: task do_patch: Succeeded
NOTE: Running task 2071 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2072 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe systemd-1_247.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-boot-247.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-boot-247.4-r0: task do_populate_lic: Started
NOTE: recipe systemd-1_247.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2073 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_configure)
NOTE: recipe gnu-efi-3.0.12-r0: task do_compile: Succeeded
NOTE: Running task 2074 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_install)
NOTE: recipe systemd-boot-247.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_populate_lic unihash changed to ed2f21a0dc6aaac465636cc78369ca53b0294460a51cabff050275d1d8d0afb0
NOTE: recipe systemd-boot-247.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to dccf08ffa08447c2c6f24a0c783d4967a30a6c9e85ab4a1f5c27fef61560210e
NOTE: Setscene tasks completed
NOTE: Running task 2075 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe gnu-efi-3.0.12-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_package: Succeeded
NOTE: Running task 2077 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_packagedata: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_packagedata: Succeeded
NOTE: Running task 2078 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_package_write_rpm)
NOTE: recipe gnu-efi-3.0.12-r0: task do_install: Succeeded
NOTE: Running task 2079 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_populate_sysroot)
NOTE: Running task 2080 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_package)
NOTE: recipe systemd-bootconf-1.00-r0: task do_package_write_rpm: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_package: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2081 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-bootconf-1.00-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-boot-247.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-boot-247.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2082 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_configure)
NOTE: recipe systemd-boot-247.4-r0: task do_configure: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_package: Succeeded
NOTE: Running task 2083 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_packagedata)
NOTE: recipe gnu-efi-3.0.12-r0: task do_packagedata: Started
ERROR: gnu-efi-3.0.12-r0 do_packagedata: QA Issue: Package version for package gnu-efi-src went backwards which would break package feeds (from 0:3.0.13-r0 to 0:3.0.12-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.12-r0 do_packagedata: QA Issue: Package version for package gnu-efi-dbg went backwards which would break package feeds (from 0:3.0.13-r0 to 0:3.0.12-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.12-r0 do_packagedata: QA Issue: Package version for package gnu-efi-staticdev went backwards which would break package feeds (from 0:3.0.13-r0 to 0:3.0.12-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.12-r0 do_packagedata: QA Issue: Package version for package gnu-efi-dev went backwards which would break package feeds (from 0:3.0.13-r0 to 0:3.0.12-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.12-r0 do_packagedata: QA Issue: Package version for package gnu-efi-doc went backwards which would break package feeds (from 0:3.0.13-r0 to 0:3.0.12-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.12-r0 do_packagedata: QA Issue: Package version for package gnu-efi-locale went backwards which would break package feeds (from 0:3.0.13-r0 to 0:3.0.12-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.12-r0 do_packagedata: QA Issue: Package version for package gnu-efi went backwards which would break package feeds (from 0:3.0.13-r0 to 0:3.0.12-r0) [version-going-backwards]
NOTE: recipe gnu-efi-3.0.12-r0: task do_packagedata: Succeeded
NOTE: Running task 2084 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb:do_package_write_rpm)
NOTE: recipe gnu-efi-3.0.12-r0: task do_package_write_rpm: Started
NOTE: recipe gnu-efi-3.0.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_configure: Succeeded
NOTE: Running task 2085 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_compile)
NOTE: recipe systemd-1_247.3-r0: task do_compile: Started
NOTE: recipe systemd-boot-247.4-r0: task do_configure: Succeeded
NOTE: Running task 2086 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_compile)
NOTE: recipe systemd-boot-247.4-r0: task do_compile: Started
NOTE: recipe systemd-boot-247.4-r0: task do_compile: Succeeded
NOTE: Running task 2087 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_install)
NOTE: Running task 2088 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_deploy)
NOTE: recipe systemd-boot-247.4-r0: task do_install: Started
NOTE: recipe systemd-boot-247.4-r0: task do_deploy: Started
NOTE: recipe systemd-boot-247.4-r0: task do_install: Succeeded
NOTE: Running task 2089 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_package)
NOTE: Running task 2090 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_populate_sysroot)
NOTE: recipe systemd-boot-247.4-r0: task do_deploy: Succeeded
NOTE: recipe systemd-boot-247.4-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-boot-247.4-r0: task do_package: Started
NOTE: recipe systemd-boot-247.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-boot-247.4-r0: task do_package: Succeeded
NOTE: Running task 2091 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_packagedata)
NOTE: recipe systemd-boot-247.4-r0: task do_packagedata: Started
NOTE: recipe systemd-boot-247.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2092 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_package_write_rpm)
NOTE: Running task 2093 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_package_qa)
NOTE: recipe systemd-boot-247.4-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-boot-247.4-r0: task do_package_qa: Started
NOTE: recipe systemd-boot-247.4-r0: task do_package_qa: Succeeded
NOTE: recipe systemd-boot-247.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_compile: Succeeded
NOTE: Running task 2094 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_install)
NOTE: recipe systemd-1_247.3-r0: task do_install: Started
NOTE: recipe systemd-1_247.3-r0: task do_install: Succeeded
NOTE: Running task 2095 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_populate_sysroot)
NOTE: Running task 2096 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_package)
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_247.3-r0: task do_package: Started
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2097 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2098 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2099 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-3.3.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.12.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2100 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_configure)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2101 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_configure)
NOTE: recipe dbus-1.12.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2102 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_configure)
NOTE: recipe procps-3.3.16-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_configure: Started
NOTE: recipe dbus-1.12.20-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_configure: Succeeded
NOTE: Running task 2103 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_compile: Succeeded
NOTE: Running task 2104 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_install)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_install: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_install: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_package: Succeeded
NOTE: Running task 2105 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_packagedata)
NOTE: recipe systemd-1_247.3-r0: task do_packagedata: Started
NOTE: recipe systemd-1_247.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2106 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package)
NOTE: Running task 2107 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm unihash changed to 4ae59565fd7c3eeb36c2214605c9df063ca716b90183f07b926575965bd2d10a
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package: Succeeded
NOTE: Running task 2108 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata unihash changed to a7fe510bbb9fc6f397c5b19a025656c3c8e142b706632deaecf096331d8c876a
NOTE: Setscene tasks completed
NOTE: Running task 2109 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm: Started
NOTE: recipe procps-3.3.16-r0: task do_configure: Succeeded
NOTE: Running task 2110 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_compile)
NOTE: recipe procps-3.3.16-r0: task do_compile: Started
NOTE: recipe procps-3.3.16-r0: task do_compile: Succeeded
NOTE: Running task 2111 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_install)
NOTE: recipe procps-3.3.16-r0: task do_install: Started
NOTE: recipe procps-3.3.16-r0: task do_install: Succeeded
NOTE: Running task 2112 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package)
NOTE: recipe procps-3.3.16-r0: task do_package: Started
NOTE: recipe procps-3.3.16-r0: task do_package: Succeeded
NOTE: Running task 2113 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata)
NOTE: recipe procps-3.3.16-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata unihash changed to 5c0e95d398de808f043078c9e228f128cb8fe8d7fa02edd70bf025695912b29a
NOTE: Setscene tasks completed
NOTE: Running task 2115 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm unihash changed to 28c1c678e4b168dde4913bcee1b3b9ab11e55ea054e86db144f410376a46e0ad
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm unihash changed to e1b5f84c684734f79cf5eb3b38be699a314aad33ae5fecbde5e3e3eb19d4a3ff
NOTE: recipe dbus-1.12.20-r0: task do_configure: Succeeded
NOTE: Running task 2117 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_compile)
NOTE: recipe dbus-1.12.20-r0: task do_compile: Started
NOTE: recipe dbus-1.12.20-r0: task do_compile: Succeeded
NOTE: Running task 2118 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_install)
NOTE: recipe dbus-1.12.20-r0: task do_install: Started
NOTE: recipe dbus-1.12.20-r0: task do_install: Succeeded
NOTE: Running task 2119 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot)
NOTE: Running task 2120 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.12.20-r0: task do_package: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2121 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2122 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_configure)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_configure: Started
NOTE: recipe dbus-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2123 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata unihash changed to c8d7d99835acc45d23413e1525ac155bf1d6ea4cf2d82cd2517510b664b237e7
NOTE: Setscene tasks completed
NOTE: Running task 2124 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_package_write_rpm)
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2125 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2126 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_compile)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_compile: Started
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_compile: Succeeded
NOTE: Running task 2127 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2128 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_install)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_install: Succeeded
NOTE: Running task 2129 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2130 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_populate_sysroot)
NOTE: Running task 2131 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_populate_sysroot unihash changed to 7dccbf5776b20d7d90e8acd4bd05bef7b655055fc743cd993fee9b9da5a7559d
NOTE: Setscene tasks completed
NOTE: Running task 2132 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2133 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-test-1.12.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2138 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2139 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_configure)
NOTE: recipe dbus-test-1.12.20-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_configure: Succeeded
NOTE: Running task 2140 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_compile: Succeeded
NOTE: Running task 2141 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_install: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package: Succeeded
NOTE: Running task 2142 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata unihash changed to d4a98c8ab7e372ac125ad49b130a441d9187801bd192ce50aefc1e45ddc0f246
NOTE: Setscene tasks completed
NOTE: Running task 2143 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Succeeded
NOTE: Running task 2147 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata unihash changed to b8cdcad3a128bc6be4b14caab26dba5589c9f375ca1f88237808634a20ca0598
NOTE: Setscene tasks completed
NOTE: Running task 2148 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm)
NOTE: Running task 2149 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm unihash changed to f16c60688a0f73d6997299e7b47c55d1cf177d764a49044607873c089c87e06d
NOTE: recipe dbus-test-1.12.20-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2150 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_configure_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2151 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_compile)
NOTE: recipe dbus-test-1.12.20-r0: task do_compile: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_compile: Succeeded
NOTE: Running task 2152 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_compile_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2153 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_install)
NOTE: recipe dbus-test-1.12.20-r0: task do_install: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_install: Succeeded
NOTE: Running task 2154 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_install_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2155 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package)
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm unihash changed to 6e725a7cc672dbe162b3492745b210978913b78b3c7cd7852d1a01c56f5c3d5e
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2156 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata unihash changed to 93eb306c599aa701d1fa985b6d70e13583737910994118db61c3b005942645c4
NOTE: Setscene tasks completed
NOTE: Running task 2157 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm)
NOTE: Running task 2158 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm unihash changed to 3a010decc897b25b850e8b0bf49c529b569b780ba3834a78f2a33da89c8b13f4
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm unihash changed to e6e887d2558a19537998d79c7c0d8c33b31b3166c29c91cd29755bcb2236f480
NOTE: Running noexec task 2159 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_247.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2159 tasks of which 2051 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 2 WARNING messages shown.
Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============7256681520808826173==--
