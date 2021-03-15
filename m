Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.282.1615826520499884909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 251D438C11DF
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:00 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd: upgrading to 247.4 FAILED
Message-ID: <MADEUP.166C91A8D7D2840F.2480@lists.openembedded.org>
X-Groupsio-MsgNum: 149473
Content-Type: multipart/mixed; boundary="===============4302456622928466050=="

--===============4302456622928466050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd* to *247.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-systemd-upgrade-247.3-247.4.patch
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

--===============4302456622928466050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 41 skipped, 0 masked, 0 errors.
Removing 92 recipes from the core2-32 sysroot...done.
Removing 96 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-ad719fa742ed58828b966344bec1322584283610"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ad719fa742ed58828b966344bec1322584283610"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 477 Local 439 Network 0 Missed 38 Current 197 (92% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 198 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 199 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 200 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 203 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 204 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 210 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 230 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 240 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 241 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1j-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 261 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 262 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 263 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 264 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 265 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 266 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 270 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 272 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 277 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 280 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 281 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 282 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 283 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 284 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 285 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 286 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 288 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 291 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 292 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 293 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 294 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 295 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 296 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 297 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 298 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 299 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 300 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 301 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 302 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 303 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 304 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssl-1.1.1j-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 305 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 306 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 307 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 308 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 311 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 312 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 313 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 314 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 315 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 316 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 317 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 323 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 324 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 329 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 338 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 356 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 357 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 358 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 359 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 360 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 370 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 371 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 376 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 377 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 381 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 383 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 390 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_deploy_setscene: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 393 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 394 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 396 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 397 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 398 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 399 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 406 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 415 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 418 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 422 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 425 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 428 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 430 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 432 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 441 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 445 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 449 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 455 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 458 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 547 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 569 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_fetch)
NOTE: Running task 577 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_fetch)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 591 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_fetch)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 463 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_setscene: Started
NOTE: Running setscene task 467 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 674 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_warn_musl)
NOTE: Running task 675 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 699 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_write_config)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 470 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 737 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_fetch)
NOTE: Running task 791 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_fetch)
NOTE: Running task 799 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_fetch)
NOTE: Running task 800 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 812 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 843 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_fetch: Started
NOTE: Running task 844 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_setscene: Succeeded
NOTE: Running setscene task 475 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_fetch: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 479 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 481 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_fetch: Succeeded
NOTE: Running setscene task 487 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 488 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 907 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_unpack)
NOTE: recipe systemd-1_247.4-r0: task do_fetch: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 947 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 495 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 497 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 502 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 972 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 507 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_247.4-r0: task do_warn_musl: Started
WARNING: systemd-1_247.4-r0 do_warn_musl: Using systemd with musl is not recommended since it is not supported upstream and some patches are known to be problematic.
NOTE: recipe systemd-1_247.4-r0: task do_write_config: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 509 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_247.4-r0: task do_warn_musl: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_write_config: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_setscene: Started
NOTE: Running task 1025 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe systemd-1_247.4-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 512 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 517 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_populate_sysroot_setscene)
NOTE: Running task 1026 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_unpack)
NOTE: recipe systemd-compat-units-1.0-r29: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_fetch: Started
NOTE: recipe procps-3.3.16-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1031 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_unpack)
NOTE: Running task 1032 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_unpack)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: Running task 1033 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_unpack)
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_write_config: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_fetch: Succeeded
NOTE: Running task 1034 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_unpack)
NOTE: recipe systemd-1_247.4-r0: task do_write_config: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1035 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe dbus-1.12.20-r0: task do_unpack: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Started
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_unpack: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Started
NOTE: recipe procps-3.3.16-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_unpack: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_unpack: Started
NOTE: recipe dbus-1.12.20-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_unpack: Started
NOTE: Running task 1062 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_patch)
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 523 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 525 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1075 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_patch)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 527 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 528 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 531 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 533 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 534 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 536 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1076 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_patch)
NOTE: Running task 1077 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe procps-3.3.16-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1078 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_patch)
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 541 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1084 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1085 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_patch)
NOTE: Running setscene task 545 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Started
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Started
NOTE: recipe procps-3.3.16-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_patch: Started
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1111 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 548 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 549 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe dbus-1.12.20-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1128 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 551 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_packagedata_setscene)
NOTE: Running task 1140 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_patch)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_unpack: Succeeded
NOTE: Running task 1141 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1142 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 558 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 560 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1j-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_patch: Started
NOTE: recipe systemd-1_247.4-r0: task do_patch: Started
NOTE: recipe python3-3.9.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 562 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 563 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 564 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 565 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 566 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 567 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 568 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 569 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 570 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 572 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1j-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1j-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 579 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 580 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.9.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 581 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 583 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 584 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 585 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 586 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 587 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1j-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 589 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 590 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1j-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1j-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
ERROR: systemd-1_247.4-r0 do_patch: Command Error: 'quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/systemd/1_247.4-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
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
NOTE: Running setscene task 591 of 674 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_setscene)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/systemd/1_247.4-r0/temp/log.do_patch.32724
NOTE: recipe systemd-1_247.4-r0: task do_patch: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_patch) failed with exit code '1'
NOTE: recipe util-linux-2.36.2-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_setscene: Succeeded
NOTE: Tasks Summary: Attempted 1186 tasks of which 1150 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_patch
Summary: There was 1 WARNING message shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============4302456622928466050==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-systemd-upgrade-247.3-247.4.patch"

From 6b8c201e0f3925a8354fa02b254d91d3fdd2cced Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 03:58:51 +0000
Subject: [PATCH] systemd: upgrade 247.3 -> 247.4

---
 meta/recipes-core/systemd/systemd.inc         |   2 +-
 ...se-ROOTPREFIX-without-suffixed-slash.patch |   9 +-
 ...002-don-t-use-glibc-specific-qsort_r.patch |   8 +-
 ...dd-__compare_fn_t-and-comparison_fn_.patch |   8 +-
 ...k-parse_printf_format-implementation.patch |  10 +-
 ...missing.h-check-for-missing-strndupa.patch | 130 ++++++++++++++++--
 .../0006-Include-netinet-if_ether.h.patch     |  26 ++--
 ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |   9 +-
 ...008-add-missing-FTW_-macros-for-musl.patch |   8 +-
 ..._register_atfork-for-non-glibc-build.patch |   8 +-
 ...10-Use-uintmax_t-for-handling-rlim_t.patch |   8 +-
 ...sable-tests-for-missing-typedefs-in-.patch |   9 +-
 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |   8 +-
 ...patible-basename-for-non-glibc-syste.patch |   9 +-
 ...uffering-when-writing-to-oom_score_a.patch |   8 +-
 ...compliant-strerror_r-from-GNU-specif.patch |   8 +-
 ...S_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch |   8 +-
 ...ype.h-add-__compar_d_fn_t-definition.patch |   8 +-
 ...definition-of-prctl_mm_map-structure.patch |   8 +-
 .../systemd/0019-Handle-missing-LOCK_EX.patch |   8 +-
 ...ible-pointer-type-struct-sockaddr_un.patch |  12 +-
 .../0021-test-json.c-define-M_PIl.patch       |   8 +-
 ...-not-disable-buffer-in-writing-files.patch |  14 +-
 .../0025-Handle-__cpu_mask-usage.patch        |   8 +-
 .../systemd/0026-Handle-missing-gshadow.patch |   8 +-
 .../{systemd_247.3.bb => systemd_247.4.bb}    |   0
 26 files changed, 206 insertions(+), 144 deletions(-)
 rename meta/recipes-core/systemd/{systemd_247.3.bb => systemd_247.4.bb} (100%)

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
 
diff --git a/meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch b/meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
index e49e06672e..0466d71eae 100644
--- a/meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
+++ b/meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
@@ -1,4 +1,4 @@
-From 58860e0f248576a80ff2af256ba42713c186ae93 Mon Sep 17 00:00:00 2001
+From 9167726a93ae55e5408a9d11ed34347aef3bb001 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 29 Sep 2020 18:01:41 -0700
 Subject: [PATCH] systemd.pc.in: use ROOTPREFIX without suffixed slash
@@ -8,14 +8,17 @@ https://github.com/poettering/systemd/commit/b612c26ceb9f56af0271fc9f07c1724d2d2
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/core/systemd.pc.in | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
+diff --git a/src/core/systemd.pc.in b/src/core/systemd.pc.in
+index b5cc8f94a5..21dbf3089d 100644
 --- a/src/core/systemd.pc.in
 +++ b/src/core/systemd.pc.in
 @@ -65,16 +65,16 @@ systemdshutdowndir=${systemd_shutdown_dir}
- tmpfiles_dir=/usr/lib/tmpfiles.d
+ tmpfiles_dir=${prefix}/lib/tmpfiles.d
  tmpfilesdir=${tmpfiles_dir}
  
 -sysusers_dir=${rootprefix}/lib/sysusers.d
@@ -34,4 +37,4 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +modules_load_dir=${prefix}/lib/modules-load.d
  modulesloaddir=${modules_load_dir}
  
- catalog_dir=/usr/lib/systemd/catalog
+ catalog_dir=${prefix}/lib/systemd/catalog
diff --git a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
index d856bcb583..a6fe978fe4 100644
--- a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
+++ b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
@@ -1,7 +1,7 @@
-From 66ece0b870b3a34fdabc48b88437e6cc354e9fce Mon Sep 17 00:00:00 2001
+From 4a305d3d112aac813d145aa2ed0e72d1aea11fc2 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:41:41 +0800
-Subject: [PATCH 02/26] don't use glibc-specific qsort_r
+Subject: [PATCH] don't use glibc-specific qsort_r
 
 Upstream-Status: Inappropriate [musl specific]
 
@@ -12,6 +12,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 [Rebased for v247]
 Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
+
 ---
  src/basic/sort-util.h              | 14 ------------
  src/libsystemd/sd-hwdb/hwdb-util.c | 19 +++++++++++-----
@@ -159,6 +160,3 @@ index a13a198b7a..bce10bc607 100644
          }
  
          if (t->display_map)
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
index f43a22aa8b..4cbbb1e5ac 100644
--- a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
+++ b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
@@ -1,7 +1,7 @@
-From 9f0d5996bbb2db3679a4075fa8301750b786c03b Mon Sep 17 00:00:00 2001
+From 90e3f375c08bb2c84d0a1eba04c551a88b107915 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:55:12 +0800
-Subject: [PATCH 03/26] missing_type.h: add __compare_fn_t and comparison_fn_t
+Subject: [PATCH] missing_type.h: add __compare_fn_t and comparison_fn_t
 
 Make it work with musl where comparison_fn_t and __compare_fn_t
 is not provided.
@@ -13,6 +13,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [Rebased for v242]
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+
 ---
  src/basic/missing_type.h | 9 +++++++++
  src/basic/sort-util.h    | 1 +
@@ -73,6 +74,3 @@ index 0f6ad8a29e..4e1077ade4 100644
  
  const char * const catalog_file_dirs[] = {
          "/usr/local/lib/systemd/catalog/",
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
index bdd64a0252..f068172f8a 100644
--- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
@@ -1,7 +1,7 @@
-From f3dbe29f7620a063af4d8eb3ea7c48ecd410200d Mon Sep 17 00:00:00 2001
+From 524a7ca1743d85bc01e2fa82fd479a7003ef27d5 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:04:21 +0800
-Subject: [PATCH 04/26] add fallback parse_printf_format implementation
+Subject: [PATCH] add fallback parse_printf_format implementation
 
 Upstream-Status: Inappropriate [musl specific]
 
@@ -10,6 +10,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [rebased for systemd 243]
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
 ---
  meson.build                     |   1 +
  src/basic/meson.build           |   5 +
@@ -22,7 +23,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  create mode 100644 src/basic/parse-printf-format.h
 
 diff --git a/meson.build b/meson.build
-index f406d595e6..6aa47fc755 100644
+index 580964c3fa..bb77783226 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -646,6 +646,7 @@ endif
@@ -430,6 +431,3 @@ index fd3fd7ef9c..e8e6ad555b 100644
  
  #define SNDBUF_SIZE (8*1024*1024)
  
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index d63e3c0d09..9c2d0e1732 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -1,7 +1,7 @@
-From 5aeae0ea89f5af74ed5d95bed1d87a03b3801ff0 Mon Sep 17 00:00:00 2001
+From 27de22015ef3f306c7b0291edc0941e0b20a235e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:18:21 +0800
-Subject: [PATCH 05/26] src/basic/missing.h: check for missing strndupa
+Subject: [PATCH] src/basic/missing.h: check for missing strndupa
 
 include missing.h  for definition of strndupa
 
@@ -17,6 +17,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 [rebased for systemd 244]
 [Rebased for v247]
 Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
+
 ---
  meson.build                                |  1 +
  src/backlight/backlight.c                  |  1 +
@@ -25,6 +26,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/basic/log.c                            |  1 +
  src/basic/missing_stdlib.h                 | 12 ++++++++++++
  src/basic/mkdir.c                          |  1 +
+ src/basic/mountpoint-util.c                |  1 +
  src/basic/parse-util.c                     |  1 +
  src/basic/path-lookup.c                    |  1 +
  src/basic/proc-cmdline.c                   |  1 +
@@ -68,8 +70,10 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/udev/udev-builtin-path_id.c            |  1 +
  src/udev/udev-event.c                      |  1 +
  src/udev/udev-rules.c                      |  1 +
- 50 files changed, 61 insertions(+)
+ 51 files changed, 62 insertions(+)
 
+diff --git a/meson.build b/meson.build
+index bb77783226..e023677ff1 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -535,6 +535,7 @@ foreach ident : [
@@ -80,6 +84,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  ]
  
          have = cc.has_function(ident[0], prefix : ident[1], args : '-D_GNU_SOURCE')
+diff --git a/src/backlight/backlight.c b/src/backlight/backlight.c
+index d1b6a81e33..38b7008371 100644
 --- a/src/backlight/backlight.c
 +++ b/src/backlight/backlight.c
 @@ -19,6 +19,7 @@
@@ -90,6 +96,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static int help(void) {
          _cleanup_free_ char *link = NULL;
+diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
+index f28bf1866a..bb960f183c 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
 @@ -38,6 +38,7 @@
@@ -100,6 +108,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static int cg_enumerate_items(const char *controller, const char *path, FILE **_f, const char *item) {
          _cleanup_free_ char *fs = NULL;
+diff --git a/src/basic/env-util.c b/src/basic/env-util.c
+index b2483af530..72499430af 100644
 --- a/src/basic/env-util.c
 +++ b/src/basic/env-util.c
 @@ -15,6 +15,7 @@
@@ -110,6 +120,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  /* We follow bash for the character set. Different shells have different rules. */
  #define VALID_BASH_ENV_NAME_CHARS               \
+diff --git a/src/basic/log.c b/src/basic/log.c
+index d4054cf46a..b608863e45 100644
 --- a/src/basic/log.c
 +++ b/src/basic/log.c
 @@ -36,6 +36,7 @@
@@ -120,6 +132,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define SNDBUF_SIZE (8*1024*1024)
  
+diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
+index 8c76f93eb2..9068bfb4f0 100644
 --- a/src/basic/missing_stdlib.h
 +++ b/src/basic/missing_stdlib.h
 @@ -11,3 +11,15 @@
@@ -138,6 +152,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
 +    (char *)memcpy(__new, __old, __len); \
 +  })
 +#endif
+diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
+index f91f8f7a08..fb31596216 100644
 --- a/src/basic/mkdir.c
 +++ b/src/basic/mkdir.c
 @@ -14,6 +14,7 @@
@@ -148,6 +164,20 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int mkdir_safe_internal(
                  const char *path,
+diff --git a/src/basic/mountpoint-util.c b/src/basic/mountpoint-util.c
+index a6602ad539..2c48647f29 100644
+--- a/src/basic/mountpoint-util.c
++++ b/src/basic/mountpoint-util.c
+@@ -10,6 +10,7 @@
+ #include "fs-util.h"
+ #include "missing_stat.h"
+ #include "missing_syscall.h"
++#include "missing_stdlib.h"
+ #include "mountpoint-util.h"
+ #include "parse-util.h"
+ #include "path-util.h"
+diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
+index 5d4dafe3a5..70749750d4 100644
 --- a/src/basic/parse-util.c
 +++ b/src/basic/parse-util.c
 @@ -22,6 +22,7 @@
@@ -158,6 +188,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int parse_boolean(const char *v) {
          if (!v)
+diff --git a/src/basic/path-lookup.c b/src/basic/path-lookup.c
+index 96b82170d0..71342b46af 100644
 --- a/src/basic/path-lookup.c
 +++ b/src/basic/path-lookup.c
 @@ -15,6 +15,7 @@
@@ -168,6 +200,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int xdg_user_runtime_dir(char **ret, const char *suffix) {
          const char *e;
+diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c
+index 0b6fb137bd..e8e8c7b270 100644
 --- a/src/basic/proc-cmdline.c
 +++ b/src/basic/proc-cmdline.c
 @@ -15,6 +15,7 @@
@@ -178,6 +212,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int proc_cmdline(char **ret) {
          const char *e;
+diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
+index ccab71f7d2..8f9eee8d36 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
 @@ -11,6 +11,7 @@
@@ -188,6 +224,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int procfs_tasks_get_limit(uint64_t *ret) {
          _cleanup_free_ char *value = NULL;
+diff --git a/src/basic/selinux-util.c b/src/basic/selinux-util.c
+index 4989f4f37c..ca00bf99d8 100644
 --- a/src/basic/selinux-util.c
 +++ b/src/basic/selinux-util.c
 @@ -27,6 +27,7 @@
@@ -198,6 +236,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #if HAVE_SELINUX
  DEFINE_TRIVIAL_CLEANUP_FUNC(context_t, context_free);
+diff --git a/src/basic/time-util.c b/src/basic/time-util.c
+index 5318d6378d..23c2f77675 100644
 --- a/src/basic/time-util.c
 +++ b/src/basic/time-util.c
 @@ -27,6 +27,7 @@
@@ -208,6 +248,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static clockid_t map_clock_id(clockid_t c) {
  
+diff --git a/src/boot/bless-boot.c b/src/boot/bless-boot.c
+index cd34f88bb9..3a77b6f2ca 100644
 --- a/src/boot/bless-boot.c
 +++ b/src/boot/bless-boot.c
 @@ -18,6 +18,7 @@
@@ -218,6 +260,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static char **arg_path = NULL;
  
+diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
+index 37c581fb22..e02789d689 100644
 --- a/src/core/dbus-cgroup.c
 +++ b/src/core/dbus-cgroup.c
 @@ -16,6 +16,7 @@
@@ -228,6 +272,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", TasksMax, tasks_max_resolve);
  
+diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
+index 04735354a3..b1b88206ec 100644
 --- a/src/core/dbus-execute.c
 +++ b/src/core/dbus-execute.c
 @@ -41,6 +41,7 @@
@@ -238,6 +284,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  BUS_DEFINE_PROPERTY_GET_ENUM(bus_property_get_exec_output, exec_output, ExecOutput);
  static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_exec_input, exec_input, ExecInput);
+diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c
+index d6223db305..3654c344ee 100644
 --- a/src/core/dbus-util.c
 +++ b/src/core/dbus-util.c
 @@ -7,6 +7,7 @@
@@ -248,6 +296,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int bus_property_get_triggered_unit(
                  sd_bus *bus,
+diff --git a/src/core/execute.c b/src/core/execute.c
+index c992b8d5d3..89632e0582 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
 @@ -96,6 +96,7 @@
@@ -258,6 +308,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define IDLE_TIMEOUT_USEC (5*USEC_PER_SEC)
  #define IDLE_TIMEOUT2_USEC (1*USEC_PER_SEC)
+diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
+index a56f12f47f..6b8729ef67 100644
 --- a/src/core/kmod-setup.c
 +++ b/src/core/kmod-setup.c
 @@ -11,6 +11,7 @@
@@ -268,6 +320,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #if HAVE_KMOD
  #include "module-util.h"
+diff --git a/src/core/service.c b/src/core/service.c
+index d7bdeb7cca..bfd483b2c0 100644
 --- a/src/core/service.c
 +++ b/src/core/service.c
 @@ -41,6 +41,7 @@
@@ -278,6 +332,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static const UnitActiveState state_translation_table[_SERVICE_STATE_MAX] = {
          [SERVICE_DEAD] = UNIT_INACTIVE,
+diff --git a/src/coredump/coredump-vacuum.c b/src/coredump/coredump-vacuum.c
+index 30c67ffe7c..595bc30726 100644
 --- a/src/coredump/coredump-vacuum.c
 +++ b/src/coredump/coredump-vacuum.c
 @@ -16,6 +16,7 @@
@@ -288,6 +344,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define DEFAULT_MAX_USE_LOWER (uint64_t) (1ULL*1024ULL*1024ULL)           /* 1 MiB */
  #define DEFAULT_MAX_USE_UPPER (uint64_t) (4ULL*1024ULL*1024ULL*1024ULL)   /* 4 GiB */
+diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
+index d2aa1815c2..a851aa203f 100644
 --- a/src/journal-remote/journal-remote-main.c
 +++ b/src/journal-remote/journal-remote-main.c
 @@ -22,6 +22,7 @@
@@ -298,6 +356,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
  #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
+diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
+index bcf2e01d5c..5394d1dc01 100644
 --- a/src/journal/journalctl.c
 +++ b/src/journal/journalctl.c
 @@ -73,6 +73,7 @@
@@ -308,6 +368,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
  #define PROCESS_INOTIFY_INTERVAL 1024   /* Every 1,024 messages processed */
+diff --git a/src/journal/sd-journal.c b/src/journal/sd-journal.c
+index 346970d1f7..d471dd0d2e 100644
 --- a/src/journal/sd-journal.c
 +++ b/src/journal/sd-journal.c
 @@ -40,6 +40,7 @@
@@ -318,6 +380,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define JOURNAL_FILES_MAX 7168
  
+diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus/bus-message.c
+index 86ff5bdfa2..3fd053a358 100644
 --- a/src/libsystemd/sd-bus/bus-message.c
 +++ b/src/libsystemd/sd-bus/bus-message.c
 @@ -21,6 +21,7 @@
@@ -328,6 +392,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static int message_append_basic(sd_bus_message *m, char type, const void *p, const void **stored);
  
+diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
+index 275c4318a1..5ffee59d17 100644
 --- a/src/libsystemd/sd-bus/bus-objects.c
 +++ b/src/libsystemd/sd-bus/bus-objects.c
 @@ -13,6 +13,7 @@
@@ -338,6 +404,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static int node_vtable_get_userdata(
                  sd_bus *bus,
+diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystemd/sd-bus/bus-socket.c
+index 4881fd0d32..c865f1133b 100644
 --- a/src/libsystemd/sd-bus/bus-socket.c
 +++ b/src/libsystemd/sd-bus/bus-socket.c
 @@ -28,6 +28,7 @@
@@ -348,6 +416,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define SNDBUF_SIZE (8*1024*1024)
  
+diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-bus.c
+index b8d4dc8d95..a8bac2665d 100644
 --- a/src/libsystemd/sd-bus/sd-bus.c
 +++ b/src/libsystemd/sd-bus/sd-bus.c
 @@ -41,6 +41,7 @@
@@ -358,6 +428,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define log_debug_bus_message(m)                                         \
          do {                                                             \
+diff --git a/src/libsystemd/sd-bus/test-bus-benchmark.c b/src/libsystemd/sd-bus/test-bus-benchmark.c
+index 8c6711797a..fac178823a 100644
 --- a/src/libsystemd/sd-bus/test-bus-benchmark.c
 +++ b/src/libsystemd/sd-bus/test-bus-benchmark.c
 @@ -14,6 +14,7 @@
@@ -368,6 +440,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define MAX_SIZE (2*1024*1024)
  
+diff --git a/src/locale/keymap-util.c b/src/locale/keymap-util.c
+index cb8153f4fe..d52a56019d 100644
 --- a/src/locale/keymap-util.c
 +++ b/src/locale/keymap-util.c
 @@ -21,6 +21,7 @@
@@ -378,6 +452,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static bool startswith_comma(const char *s, const char *prefix) {
          s = startswith(s, prefix);
+diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c
+index 8e7a94db55..b5c368c6d1 100644
 --- a/src/login/pam_systemd.c
 +++ b/src/login/pam_systemd.c
 @@ -31,6 +31,7 @@
@@ -388,6 +464,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "pam-util.h"
  #include "parse-util.h"
  #include "path-util.h"
+diff --git a/src/network/generator/network-generator.c b/src/network/generator/network-generator.c
+index 2fa21a067a..2e9995aa62 100644
 --- a/src/network/generator/network-generator.c
 +++ b/src/network/generator/network-generator.c
 @@ -13,6 +13,7 @@
@@ -398,6 +476,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  /*
    # .network
+diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-settings.c
+index 92bb5120ab..eeca905c75 100644
 --- a/src/nspawn/nspawn-settings.c
 +++ b/src/nspawn/nspawn-settings.c
 @@ -16,6 +16,7 @@
@@ -408,6 +488,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  Settings *settings_new(void) {
          Settings *s;
+diff --git a/src/nss-mymachines/nss-mymachines.c b/src/nss-mymachines/nss-mymachines.c
+index 53f0492116..c71941fdd7 100644
 --- a/src/nss-mymachines/nss-mymachines.c
 +++ b/src/nss-mymachines/nss-mymachines.c
 @@ -19,6 +19,7 @@
@@ -418,6 +500,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  NSS_GETHOSTBYNAME_PROTOTYPES(mymachines);
  NSS_GETPW_PROTOTYPES(mymachines);
+diff --git a/src/portable/portable.c b/src/portable/portable.c
+index ed7eac0291..78986977f8 100644
 --- a/src/portable/portable.c
 +++ b/src/portable/portable.c
 @@ -31,6 +31,7 @@
@@ -428,6 +512,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static const char profile_dirs[] = CONF_PATHS_NULSTR("systemd/portable/profile");
  
+diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
+index b479335769..212d0bed20 100644
 --- a/src/resolve/resolvectl.c
 +++ b/src/resolve/resolvectl.c
 @@ -37,6 +37,7 @@
@@ -438,6 +524,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static int arg_family = AF_UNSPEC;
  static int arg_ifindex = 0;
+diff --git a/src/shared/bus-get-properties.c b/src/shared/bus-get-properties.c
+index 32f68d5e6a..bda1e1ef4f 100644
 --- a/src/shared/bus-get-properties.c
 +++ b/src/shared/bus-get-properties.c
 @@ -4,6 +4,7 @@
@@ -448,6 +536,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int bus_property_get_bool(
                  sd_bus *bus,
+diff --git a/src/shared/bus-unit-procs.c b/src/shared/bus-unit-procs.c
+index 3e97be9671..2b8ca838f7 100644
 --- a/src/shared/bus-unit-procs.c
 +++ b/src/shared/bus-unit-procs.c
 @@ -10,6 +10,7 @@
@@ -458,6 +548,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  struct CGroupInfo {
          char *cgroup_path;
+diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-util.c
+index 2bab2299fb..62afdc7973 100644
 --- a/src/shared/bus-unit-util.c
 +++ b/src/shared/bus-unit-util.c
 @@ -44,6 +44,7 @@
@@ -468,6 +560,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int bus_parse_unit_info(sd_bus_message *message, UnitInfo *u) {
          assert(message);
+diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
+index fbda218b3b..aae0be75c6 100644
 --- a/src/shared/bus-util.c
 +++ b/src/shared/bus-util.c
 @@ -21,6 +21,7 @@
@@ -478,6 +572,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static int name_owner_change_callback(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
          sd_event *e = userdata;
+diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c
+index ec42b29d03..74de69496d 100644
 --- a/src/shared/dns-domain.c
 +++ b/src/shared/dns-domain.c
 @@ -17,6 +17,7 @@
@@ -488,6 +584,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  int dns_label_unescape(const char **name, char *dest, size_t sz, DNSLabelFlags flags) {
          const char *n;
+diff --git a/src/shared/journal-importer.c b/src/shared/journal-importer.c
+index b2785f0552..5f00902882 100644
 --- a/src/shared/journal-importer.c
 +++ b/src/shared/journal-importer.c
 @@ -14,6 +14,7 @@
@@ -498,6 +596,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  enum {
          IMPORTER_STATE_LINE = 0,    /* waiting to read, or reading line */
+diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
+index 840f221fff..5e697981e7 100644
 --- a/src/shared/logs-show.c
 +++ b/src/shared/logs-show.c
 @@ -41,6 +41,7 @@
@@ -508,6 +608,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  /* up to three lines (each up to 100 characters) or 300 characters, whichever is less */
  #define PRINT_LINE_THRESHOLD 3
+diff --git a/src/shared/pager.c b/src/shared/pager.c
+index f689d9f28f..aae3957c2f 100644
 --- a/src/shared/pager.c
 +++ b/src/shared/pager.c
 @@ -26,6 +26,7 @@
@@ -518,6 +620,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static pid_t pager_pid = 0;
  
+diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c
+index 5d5bf7f21d..f1002ffa6c 100644
 --- a/src/shared/uid-range.c
 +++ b/src/shared/uid-range.c
 @@ -9,6 +9,7 @@
@@ -528,6 +632,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static bool uid_range_intersect(UidRange *range, uid_t start, uid_t nr) {
          assert(range);
+diff --git a/src/socket-proxy/socket-proxyd.c b/src/socket-proxy/socket-proxyd.c
+index 4391d9f1f5..9b73cd0aeb 100644
 --- a/src/socket-proxy/socket-proxyd.c
 +++ b/src/socket-proxy/socket-proxyd.c
 @@ -26,6 +26,7 @@
@@ -538,6 +644,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define BUFFER_SIZE (256 * 1024)
  
+diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
+index f0f9679769..128fc164da 100644
 --- a/src/test/test-hexdecoct.c
 +++ b/src/test/test-hexdecoct.c
 @@ -6,6 +6,7 @@
@@ -548,6 +656,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  static void test_hexchar(void) {
          assert_se(hexchar(0xa) == 'a');
+diff --git a/src/udev/udev-builtin-path_id.c b/src/udev/udev-builtin-path_id.c
+index 0da59e2c75..66da3741ee 100644
 --- a/src/udev/udev-builtin-path_id.c
 +++ b/src/udev/udev-builtin-path_id.c
 @@ -22,6 +22,7 @@
@@ -558,6 +668,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  _printf_(2,3)
  static void path_prepend(char **path, const char *fmt, ...) {
+diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
+index 5159d19a38..0ed5b65844 100644
 --- a/src/udev/udev-event.c
 +++ b/src/udev/udev-event.c
 @@ -34,6 +34,7 @@
@@ -568,6 +680,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  typedef struct Spawn {
          sd_device *device;
+diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
+index ef6a0c112c..422fc19127 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
 @@ -30,6 +30,7 @@
@@ -578,13 +692,3 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #define RULES_DIRS (const char* const*) CONF_PATHS_STRV("udev/rules.d")
  
---- a/src/basic/mountpoint-util.c
-+++ b/src/basic/mountpoint-util.c
-@@ -10,6 +10,7 @@
- #include "fs-util.h"
- #include "missing_stat.h"
- #include "missing_syscall.h"
-+#include "missing_stdlib.h"
- #include "mountpoint-util.h"
- #include "parse-util.h"
- #include "path-util.h"
diff --git a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
index b689cf1297..d8b48d4103 100644
--- a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
+++ b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
@@ -1,7 +1,7 @@
-From d3ed0da271738fd0fc3d3e4d82d6f5810334b05e Mon Sep 17 00:00:00 2001
+From 611e76aec2515565a6a38fc29583d02b42092220 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 26 Oct 2017 22:10:42 -0700
-Subject: [PATCH 06/26] Include netinet/if_ether.h
+Subject: [PATCH] Include netinet/if_ether.h
 
 Fixes
 /path/to/systemd/recipe-sysroot/usr/include/netinet/if_ether.h:101:8: error: redefinition of 'struct ethhdr'
@@ -31,6 +31,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 [rebased for systemd 247]
 Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
+
 ---
  src/libsystemd-network/sd-dhcp6-client.c  | 1 -
  src/libsystemd/sd-netlink/netlink-types.c | 1 +
@@ -41,20 +42,22 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/network/netdev/netdev-gperf.gperf     | 1 +
  src/network/netdev/netdev.c               | 1 +
  src/network/networkd-brvlan.c             | 1 +
- src/network/networkd-dhcp-common.c        | 1 +
+ src/network/networkd-dhcp-common.c        | 4 +++-
+ src/network/networkd-dhcp-server.c        | 4 ++--
  src/network/networkd-dhcp4.c              | 2 +-
  src/network/networkd-dhcp6.c              | 2 +-
  src/network/networkd-link.c               | 2 +-
  src/network/networkd-network.c            | 1 +
+ src/network/networkd-route.c              | 5 ++++-
  src/network/test-network-tables.c         | 1 +
  src/shared/ethtool-util.c                 | 1 +
  src/shared/ethtool-util.h                 | 1 +
  src/udev/net/link-config.c                | 1 +
  src/udev/udev-builtin-net_setup_link.c    | 1 +
- 19 files changed, 18 insertions(+), 4 deletions(-)
+ 21 files changed, 26 insertions(+), 8 deletions(-)
 
 diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/src/libsystemd-network/sd-dhcp6-client.c
-index 30ac526fc9..126077e13c 100644
+index d5020519cd..06d818148b 100644
 --- a/src/libsystemd-network/sd-dhcp6-client.c
 +++ b/src/libsystemd-network/sd-dhcp6-client.c
 @@ -5,7 +5,6 @@
@@ -158,7 +161,7 @@ index e53c73c30c..9bf0771b84 100644
  #include <stdbool.h>
  
 diff --git a/src/network/networkd-dhcp-common.c b/src/network/networkd-dhcp-common.c
-index c338c775a7..ab35d65c53 100644
+index 9f58121350..554d006cb8 100644
 --- a/src/network/networkd-dhcp-common.c
 +++ b/src/network/networkd-dhcp-common.c
 @@ -1,7 +1,8 @@
@@ -171,7 +174,7 @@ index c338c775a7..ab35d65c53 100644
  
  #include "dhcp-internal.h"
  #include "dhcp6-internal.h"
-@@ -10,6 +10,7 @@
+@@ -10,6 +11,7 @@
  #include "networkd-dhcp-common.h"
  #include "networkd-link.h"
  #include "networkd-manager.h"
@@ -195,7 +198,7 @@ index cf279c640d..bae541029b 100644
  #include "sd-dhcp-server.h"
  
 diff --git a/src/network/networkd-dhcp4.c b/src/network/networkd-dhcp4.c
-index 02d33841b6..a30d8dd82c 100644
+index f3c1e5f609..e4ef6eca63 100644
 --- a/src/network/networkd-dhcp4.c
 +++ b/src/network/networkd-dhcp4.c
 @@ -1,9 +1,9 @@
@@ -225,7 +228,7 @@ index d4d4182ee5..635d08f7d5 100644
  #include "sd-dhcp6-client.h"
  
 diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
-index ced18de425..07b43770de 100644
+index 8120343612..99b847db4a 100644
 --- a/src/network/networkd-link.c
 +++ b/src/network/networkd-link.c
 @@ -1,8 +1,8 @@
@@ -250,7 +253,7 @@ index 3254641461..f0ada419fd 100644
  #include <netinet/in.h>
  #include <linux/netdevice.h>
 diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
-index 10f30c1a7e..579885726c 100644
+index 0ed89584ef..e7e157c201 100644
 --- a/src/network/networkd-route.c
 +++ b/src/network/networkd-route.c
 @@ -1,7 +1,10 @@
@@ -321,6 +324,3 @@ index cb12b943fe..5a28c8b563 100644
  #include "device-util.h"
  #include "alloc-util.h"
  #include "link-config.h"
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
index 6865421586..b17e181f41 100644
--- a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
+++ b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
@@ -1,8 +1,7 @@
-From 87a14dde13c8fa68239a4ab62914a093062b3b29 Mon Sep 17 00:00:00 2001
+From 89e50e621b0dfc2279e4f4b126bc07a1b6107089 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:56:21 +0800
-Subject: [PATCH 07/26] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not
- defined
+Subject: [PATCH] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not defined
 
 If the standard library doesn't provide brace
 expansion users just won't get it.
@@ -17,6 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [rebased for systemd 243]
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
 ---
  src/basic/glob-util.c     | 12 ++++++++++++
  src/test/test-glob-util.c | 16 ++++++++++++++++
@@ -151,6 +151,3 @@ index 9906c70eef..5eb63b1d57 100644
          };
          int r = 0, k;
          char **fn;
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
index 94cdc2efde..7e8445c533 100644
--- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
@@ -1,7 +1,7 @@
-From 8caea3fe87d55fd16de7d1b8266239fa954cb498 Mon Sep 17 00:00:00 2001
+From a9b27197fa6aedbbe5c7057a66ad7534dc0e138a Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:00:06 +0800
-Subject: [PATCH 08/26] add missing FTW_ macros for musl
+Subject: [PATCH] add missing FTW_ macros for musl
 
 This is to avoid build failures like below for musl.
 
@@ -10,6 +10,7 @@ This is to avoid build failures like below for musl.
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/basic/missing_type.h | 20 ++++++++++++++++++++
  1 file changed, 20 insertions(+)
@@ -42,6 +43,3 @@ index aeaf6ad5ec..3df1084ef2 100644
 +#ifndef FTW_SKIP_SIBLINGS
 +#define FTW_SKIP_SIBLINGS 3
 +#endif
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
index 76cc75cf6a..21ed01daa8 100644
--- a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
+++ b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
@@ -1,11 +1,12 @@
-From d8e4f0aa1760e4c7bb8476beecd35025c9cbb95a Mon Sep 17 00:00:00 2001
+From 1800c19e0543af28d52a53b3407e7070d6f4259b Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:03:47 +0800
-Subject: [PATCH 09/26] fix missing of __register_atfork for non-glibc builds
+Subject: [PATCH] fix missing of __register_atfork for non-glibc builds
 
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/basic/process-util.c | 7 +++++++
  1 file changed, 7 insertions(+)
@@ -40,6 +41,3 @@ index 0851613fc9..4417101569 100644
  
  pid_t getpid_cached(void) {
          static bool installed = false;
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
index aeacd865ae..1b1f280cdb 100644
--- a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
@@ -1,7 +1,7 @@
-From e45bb02174812e4935214f42a18725be320770d5 Mon Sep 17 00:00:00 2001
+From 3cae638f8feb560bf8137d6a725d0d1eef56be2b Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:12:41 +0800
-Subject: [PATCH 10/26] Use uintmax_t for handling rlim_t
+Subject: [PATCH] Use uintmax_t for handling rlim_t
 
 PRIu{32,64} is not right format to represent rlim_t type
 therefore use %ju and typecast the rlim_t variables to
@@ -20,6 +20,7 @@ Upstream-Status: Denied [https://github.com/systemd/systemd/pull/7199]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 [Rebased for v241]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/basic/format-util.h |  8 +-------
  src/basic/rlimit-util.c | 10 +++++-----
@@ -92,6 +93,3 @@ index 89632e0582..335283776c 100644
                  }
  
          if (c->ioprio_set) {
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
index 6d7fdbcb64..453780045b 100644
--- a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
+++ b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
@@ -1,13 +1,13 @@
-From d1db531ddd3bbf94d5e764b7917bcc8684ff6357 Mon Sep 17 00:00:00 2001
+From cd12bfdbaa96638e3705d27501292047697d0d51 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 28 Feb 2018 21:25:22 -0800
-Subject: [PATCH 11/26] test-sizeof.c: Disable tests for missing typedefs in
- musl
+Subject: [PATCH] test-sizeof.c: Disable tests for missing typedefs in musl
 
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/test/test-sizeof.c | 4 ++++
  1 file changed, 4 insertions(+)
@@ -37,6 +37,3 @@ index 3c9dc180fa..e1a59d408c 100644
          info(pid_t);
          info(uid_t);
          info(gid_t);
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
index c15b6e7d82..d616a007b3 100644
--- a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
+++ b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
@@ -1,7 +1,7 @@
-From 03e89da266edf70121a19ffc32a78cc3b97585ef Mon Sep 17 00:00:00 2001
+From cf671c95565ff80d160383f717b1dbd39c7969db Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 10 Oct 2017 14:33:30 -0700
-Subject: [PATCH 12/26] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
+Subject: [PATCH] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
 
 Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn't seem like the right
 thing to do and it's not portable (not supported by musl). See:
@@ -25,6 +25,7 @@ just historical and not actually necessary or desired behaviour?
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
 ---
  src/basic/fs-util.h          | 22 +++++++++++++++++++++-
  src/shared/base-filesystem.c |  6 +++---
@@ -94,6 +95,3 @@ index 1d05409086..1ed06c31ab 100644
                                                  continue;
                                  }
  
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
index 89736bcfde..24ed1246b7 100644
--- a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
+++ b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
@@ -1,8 +1,7 @@
-From dd134880e9a16595ab473934577e873c748e9c7a Mon Sep 17 00:00:00 2001
+From 832e07310c859f03ba2640e1ffdbbc0091897dd9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 May 2018 08:36:44 -0700
-Subject: [PATCH 13/26] Define glibc compatible basename() for non-glibc
- systems
+Subject: [PATCH] Define glibc compatible basename() for non-glibc systems
 
 Fixes builds with musl, even though systemd is adamant about
 using non-posix basename implementation, we have a way out
@@ -10,6 +9,7 @@ using non-posix basename implementation, we have a way out
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/machine/machine-dbus.c | 5 +++++
  1 file changed, 5 insertions(+)
@@ -30,6 +30,3 @@ index f5780f1aec..aec5825b3e 100644
  #include "alloc-util.h"
  #include "bus-common-errors.h"
  #include "bus-get-properties.h"
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
index e95d2ae078..2d0cfada9c 100644
--- a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
@@ -1,7 +1,7 @@
-From 55af446156da863b5b36a1109845858956a4c274 Mon Sep 17 00:00:00 2001
+From f8ea020d5c0b8a8678db2f38b876ff80c9f95de2 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jul 2018 15:00:44 +0800
-Subject: [PATCH 14/26] Do not disable buffering when writing to oom_score_adj
+Subject: [PATCH] Do not disable buffering when writing to oom_score_adj
 
 On musl, disabling buffering when writing to oom_score_adj will
 cause the following error.
@@ -19,6 +19,7 @@ Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [rebased for systemd 243]
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
 ---
  src/basic/process-util.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -36,6 +37,3 @@ index 4417101569..556dab8ebf 100644
  }
  
  int pidfd_get_pid(int fd, pid_t *ret) {
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
index 5cdcf84dc1..d05cbf6f6d 100644
--- a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
+++ b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
@@ -1,7 +1,7 @@
-From e382845aed90cfe4496a8351d57d4466dd2e9a9c Mon Sep 17 00:00:00 2001
+From 811c152eb6de17f9cefcd5cac02d146a280c4eba Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 10 Jul 2018 15:40:17 +0800
-Subject: [PATCH 15/26] distinguish XSI-compliant strerror_r from GNU-specifi
+Subject: [PATCH] distinguish XSI-compliant strerror_r from GNU-specifi
  strerror_r
 
 XSI-compliant strerror_r and GNU-specifi strerror_r are different.
@@ -18,6 +18,7 @@ assigned to (char *) variable, resulting in segment fault.
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/journal/journal-send.c        | 5 +++++
  src/libsystemd/sd-bus/bus-error.c | 5 +++++
@@ -57,6 +58,3 @@ index 8da2024a50..9605a9b869 100644
                  if (errno == ERANGE || strlen(x) >= k - 1) {
                          free(m);
                          k *= 2;
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch b/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
index 9a125de638..0ec9efa6dc 100644
--- a/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
+++ b/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
@@ -1,7 +1,7 @@
-From 0c7af5f288231a8c0545e169e01ba5ee173cafe7 Mon Sep 17 00:00:00 2001
+From 060af8b799f4b6b9142079e96f851adb7b16080f Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:18:00 +0800
-Subject: [PATCH 16/26] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
+Subject: [PATCH] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
 
 for currently unknown reasons they get exported to the shared libries
 even without being listed in the sym file
@@ -11,6 +11,7 @@ Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 [Rebased for v241]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/libsystemd/sd-bus/bus-error.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -30,6 +31,3 @@ index 9605a9b869..38b6cf90c3 100644
  
  /* Additional maps registered with sd_bus_error_add_map() are in this
   * NULL terminated array */
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch b/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
index 31747c6b40..47a8aa7517 100644
--- a/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
+++ b/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
@@ -1,7 +1,7 @@
-From 32dd7a47b87793cd836ab4bb776d1524f24c2d58 Mon Sep 17 00:00:00 2001
+From 26f2da75e7643bf7e343b30ba0524928230052ec Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:27:54 +0800
-Subject: [PATCH 17/26] missing_type.h: add __compar_d_fn_t definition
+Subject: [PATCH] missing_type.h: add __compar_d_fn_t definition
 
 Fix the following compile failure:
 src/basic/util.h:71:18: error: unknown type name '__compar_d_fn_t'; did you mean '__compar_fn_t'?
@@ -9,6 +9,7 @@ src/basic/util.h:71:18: error: unknown type name '__compar_d_fn_t'; did you mean
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/basic/missing_type.h | 1 +
  1 file changed, 1 insertion(+)
@@ -25,6 +26,3 @@ index 3df1084ef2..697aa7f58a 100644
  #endif
  
  #ifndef __COMPAR_FN_T
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
index 56d361a213..c938a63592 100644
--- a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
+++ b/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
@@ -1,7 +1,7 @@
-From bfc3416edeb69082ac9b9c9e844f12d7b45bb006 Mon Sep 17 00:00:00 2001
+From 7e19bcfb5fdd7979b20457a41430db4f5a57eb2c Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:44:54 +0800
-Subject: [PATCH 18/26] avoid redefinition of prctl_mm_map structure
+Subject: [PATCH] avoid redefinition of prctl_mm_map structure
 
 Fix the following compile failure:
 error: redefinition of 'struct prctl_mm_map'
@@ -9,6 +9,7 @@ error: redefinition of 'struct prctl_mm_map'
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/basic/missing_prctl.h | 2 ++
  1 file changed, 2 insertions(+)
@@ -27,6 +28,3 @@ index ab851306ba..5547cad875 100644
  
  /* 58319057b7847667f0c9585b9de0e8932b0fdb08 (4.3) */
  #ifndef PR_CAP_AMBIENT
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch b/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
index 6ca196489b..117273193d 100644
--- a/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
+++ b/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
@@ -1,10 +1,11 @@
-From e427f03de2c56e868bb0f24aa231315b2dae1b71 Mon Sep 17 00:00:00 2001
+From ca845b73cf4b8a61bde7eab426c5df015ad5ea1e Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Fri, 7 Aug 2020 15:19:27 +0000
-Subject: [PATCH 19/26] Handle missing LOCK_EX
+Subject: [PATCH] Handle missing LOCK_EX
 
 Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+
 ---
  src/partition/makefs.c | 1 +
  1 file changed, 1 insertion(+)
@@ -21,6 +22,3 @@ index fd924d2231..b97580fdcc 100644
  
  #include "alloc-util.h"
  #include "blockdev-util.h"
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
index f74de43849..f226bd01b3 100644
--- a/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
+++ b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
@@ -1,7 +1,7 @@
-From 9abbc5e69e21aef0d4d4567e69302fa660b76c53 Mon Sep 17 00:00:00 2001
+From 333b197754da3a4dabe2e34f4617396c9fe4e5f0 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Fri, 7 Aug 2020 15:20:17 +0000
-Subject: [PATCH 20/26] Fix incompatible pointer type struct sockaddr_un *
+Subject: [PATCH] Fix incompatible pointer type struct sockaddr_un *
 
 | ../../../../../../workspace/sources/systemd/src/nspawn/nspawn.c: In function 'cant_be_in_netns':
 | ../../../../../../workspace/sources/systemd/src/nspawn/nspawn.c:4893:25: error: passing argument 2 of 'connect' from incompatible pointer type [-Werror=incompatible-pointer-types]
@@ -18,15 +18,16 @@ Subject: [PATCH 20/26] Fix incompatible pointer type struct sockaddr_un *
 
 Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+
 ---
  src/nspawn/nspawn.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 0842731c18..3528b7ff14 100644
+index 7515380fcd..8a09cbf520 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -5084,7 +5084,7 @@ static int cant_be_in_netns(void) {
+@@ -5088,7 +5088,7 @@ static int cant_be_in_netns(void) {
          if (fd < 0)
                  return log_error_errno(errno, "Failed to allocate udev control socket: %m");
  
@@ -35,6 +36,3 @@ index 0842731c18..3528b7ff14 100644
  
                  if (errno == ENOENT || ERRNO_IS_DISCONNECT(errno))
                          return log_error_errno(SYNTHETIC_ERRNO(EOPNOTSUPP),
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
index fa6652a5bf..db8420bde5 100644
--- a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
+++ b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
@@ -1,7 +1,7 @@
-From 1f5bc54bed0b365e7e448c26f6c792dbe8b3b198 Mon Sep 17 00:00:00 2001
+From 61b50658f76b00be289dd88d5bbf0f4a5c9efa8f Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 16:53:06 +0800
-Subject: [PATCH 21/26] test-json.c: define M_PIl
+Subject: [PATCH] test-json.c: define M_PIl
 
 Fix the following compile failure:
 src/test/test-json.c:305:50: error: 'M_PIl' undeclared (first use in this function); did you mean 'M_PI'?
@@ -9,6 +9,7 @@ src/test/test-json.c:305:50: error: 'M_PIl' undeclared (first use in this functi
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  src/test/test-json.c | 4 ++++
  1 file changed, 4 insertions(+)
@@ -28,6 +29,3 @@ index 1d4b11945e..572c8cf9d0 100644
  static void test_tokenizer(const char *data, ...) {
          unsigned line = 0, column = 0;
          void *state = NULL;
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
index 675fd20f11..574065b2d0 100644
--- a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
@@ -1,7 +1,7 @@
-From 564dba5ad0cd884e3f69fa19ca64095413578ea5 Mon Sep 17 00:00:00 2001
+From a15c0f76e282821d6ae38a29e9676fdc12b50d29 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Fri, 1 Mar 2019 15:22:15 +0800
-Subject: [PATCH 22/26] do not disable buffer in writing files
+Subject: [PATCH] do not disable buffer in writing files
 
 Do not disable buffer in writing files, otherwise we get
 failure at boot for musl like below.
@@ -18,6 +18,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 [rebased for systemd 243]
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
 ---
  src/basic/cgroup-util.c                 | 10 +++++-----
  src/basic/procfs-util.c                 |  4 ++--
@@ -227,10 +228,10 @@ index d8f91f4e66..a088e6e2d8 100644
                  log_error_errno(r, "Failed to write '%s' to /sys/power/resume: %m", major_minor);
                  return EXIT_FAILURE;
 diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
-index d06f90ce1d..43d0a58750 100644
+index d1aa3282bf..f311182a51 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
-@@ -1976,7 +1976,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
+@@ -1945,7 +1945,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
          if (!value)
                  return -ENOMEM;
  
@@ -266,7 +267,7 @@ index cb01b25bc6..e92051268b 100644
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 3528b7ff14..11b0c20f95 100644
+index 8a09cbf520..78563faeab 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
 @@ -2667,7 +2667,7 @@ static int reset_audit_loginuid(void) {
@@ -408,6 +409,3 @@ index b28e2853e1..115b7233a0 100644
          if (r < 0)
                  return log_warning_errno(r, "Failed to %s sysfs UTF-8 flag: %m", enable_disable(utf8));
  
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
index 1cc3985d12..f11485488d 100644
--- a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
+++ b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
@@ -1,7 +1,7 @@
-From bbda4a48a34662393117fc677c3a678d4ce4c2ec Mon Sep 17 00:00:00 2001
+From e4b35316e676e036d1db0ae4576699df4a503163 Mon Sep 17 00:00:00 2001
 From: Scott Murray <scott.murray@konsulko.com>
 Date: Fri, 13 Sep 2019 19:26:27 -0400
-Subject: [PATCH 25/26] Handle __cpu_mask usage
+Subject: [PATCH] Handle __cpu_mask usage
 
 Fixes errors:
 
@@ -18,6 +18,7 @@ add a typedef to cpu-set-util.h defining __cpu_mask appropriately.
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
 ---
  src/shared/cpu-set-util.h | 2 ++
  src/test/test-sizeof.c    | 2 +-
@@ -55,6 +56,3 @@ index e1a59d408c..c269ea6e8c 100644
  
  /* Print information about various types. Useful when diagnosing
   * gcc diagnostics on an unfamiliar architecture. */
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
index 4180afb08e..ce283747b9 100644
--- a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
+++ b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
@@ -1,7 +1,7 @@
-From 47bf88f74717b417e4adbcc04256334b2335c873 Mon Sep 17 00:00:00 2001
+From bb5adfa69c291431d783b0d1beda869db3ae63ca Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 10 Mar 2020 11:05:20 +0000
-Subject: [PATCH 26/26] Handle missing gshadow
+Subject: [PATCH] Handle missing gshadow
 
 gshadow usage is now present in the userdb code. Mask all uses of it to
 allow compilation on musl
@@ -10,6 +10,7 @@ Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 [Rebased for v247]
 Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
+
 ---
  src/shared/user-record-nss.c | 20 ++++++++++++++++++++
  src/shared/user-record-nss.h |  4 ++++
@@ -168,6 +169,3 @@ index 2d480283d1..0d19764f2e 100644
                          if (r < 0)
                                  return r;
  
--- 
-2.27.0
-
diff --git a/meta/recipes-core/systemd/systemd_247.3.bb b/meta/recipes-core/systemd/systemd_247.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_247.3.bb
rename to meta/recipes-core/systemd/systemd_247.4.bb
-- 
2.17.1


--===============4302456622928466050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/systemd: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/libnss-myhostname: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/libnss-myhostname: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/libnss-mymachines: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/libnss-mymachines: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/libnss-resolve: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/libnss-resolve: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/libnss-systemd: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/libnss-systemd: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/libsystemd: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/libsystemd: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/libudev: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/libudev: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-analyze: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-analyze: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-bash-completion: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-bash-completion: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-binfmt: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-binfmt: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-container: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-container: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-dbg: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-dbg: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-dbg: PKGSIZE changed from 61147104 to 61145736 (-0%)
packages/core2-32-poky-linux/systemd/systemd-dev: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-dev: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-dev: PKGSIZE changed from 145290 to 145315 (+0%)
packages/core2-32-poky-linux/systemd/systemd-doc: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-doc: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-extra-utils: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-extra-utils: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-gui: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-gui: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-initramfs: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-initramfs: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-journal-gatewayd: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-journal-gatewayd: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-journal-remote: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-journal-remote: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-journal-upload: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-journal-upload: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-kernel-install: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-kernel-install: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-be+latin: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-be+latin: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-be: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-be: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-bg: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-bg: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-ca: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-ca: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-cs: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-cs: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-da: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-da: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-de: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-de: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-el: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-el: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-es: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-es: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-fr: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-fr: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-gl: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-gl: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-hr: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-hr: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-hu: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-hu: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-id: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-id: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-it: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-it: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-ja: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-ja: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-ko: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-ko: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-lt: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-lt: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-pl: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-pl: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-pt-br: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-pt-br: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-ro: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-ro: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-ru: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-ru: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-sk: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-sk: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-sr: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-sr: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-sv: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-sv: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-tr: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-tr: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-uk: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-uk: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-zh-cn: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-zh-cn: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-locale-zh-tw: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-locale-zh-tw: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-rpm-macros: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-rpm-macros: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-src: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-src: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-src: PKGSIZE changed from 17899477 to 17898551 (-0%)
packages/core2-32-poky-linux/systemd/systemd-staticdev: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-staticdev: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-udev-rules: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-udev-rules: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-vconsole-setup: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-vconsole-setup: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd-zsh-completion: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd-zsh-completion: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/systemd: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/systemd: PKGSIZE changed from 9929771 to 9922910 (-0%)
packages/core2-32-poky-linux/systemd/udev-hwdb: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/udev-hwdb: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/udev: PV changed from "247.3" to "247.4"
packages/core2-32-poky-linux/systemd/udev: PKGV changed from 247.3 [default] to 247.4 [default]
packages/core2-32-poky-linux/systemd/udev: PKGSIZE changed from 1972495 to 1976449 (+0%)

--===============4302456622928466050==--
